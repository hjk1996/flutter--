import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:text_project/presentation/common/yes_or_no_dialog.dart';
import 'package:text_project/presentation/edit_screen/components/profile_dialog.dart';
import 'package:text_project/presentation/edit_screen/edit_screen_event.dart';
import 'package:text_project/presentation/edit_screen/edit_screen_view_model.dart';
import 'package:text_project/presentation/edit_screen/components/name_input_box.dart';
import 'package:provider/provider.dart';
import 'package:text_project/presentation/user_screen/user_screen_view_model.dart';
import 'package:image_picker/image_picker.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({super.key});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

// TODO: 내일 프로필 이미지 조지기
class _EditScreenState extends State<EditScreen> {
  late StreamSubscription<EditScreenEvent> _eventSubscription;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      final viewModel = context.read<EditScreenViewModel>();
      _eventSubscription = viewModel.eventStream.listen((event) {
        event.when(
          onSave: () {
            if (!mounted) return;
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('변경사항이 저장되었습니다.'),
              ),
            );
          },
          onError: (String message) {
            print(message);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('변경사항 저장에 실패했습니다.'),
              ),
            );
          },
          onProfileTap: () async {
            if (!mounted) return;
            final action = await showDialog<ProfileAction>(
              context: context,
              builder: (context) => const ProfileDialog(),
            );
            if (action == ProfileAction.CAMERA) {
              final image = await ImagePicker().pickImage(
                source: ImageSource.camera,
                imageQuality: 50,
              );
              if (image != null) {
                final imageBytes = await image.readAsBytes();
                viewModel.photo = imageBytes;
              }
            } else if (action == ProfileAction.GALLERY) {
              final image = await ImagePicker().pickImage(
                source: ImageSource.gallery,
                imageQuality: 50,
              );
              if (image != null) {
                final imageBytes = await image.readAsBytes();

                viewModel.photo = imageBytes;
              }
            } else if (action == ProfileAction.REMOVE) {
              viewModel.photo = null;
            }
          },
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<EditScreenViewModel>();

    return Scaffold(
        appBar: AppBar(
          title: const Text('내 정보 수정'),
          actions: [
            Consumer<EditScreenViewModel>(
              builder: (context, value, child) {
                return TextButton(
                    onPressed: viewModel.state.name!.length < 2
                        ? null
                        : viewModel.save,
                    child: const Text('저장'));
              },
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Consumer<EditScreenViewModel>(
                      builder: (context, value, child) {
                    return GestureDetector(
                      onTap: viewModel.onProfileTap,
                      child: ClipOval(
                        child: Stack(
                          clipBehavior: Clip.antiAlias,
                          children: [
                            SizedBox(
                              width: 100,
                              height: 100,
                              child: CircleAvatar(
                                backgroundImage: viewModel.state.photo != null
                                    ? Image.memory(viewModel.state.photo!).image
                                    : null,
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              child: Container(
                                color: Colors.grey.withOpacity(0.4),
                                width: 100,
                                height: 25,
                                child: const Text(
                                  '편집',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ],
              ),
              const SizedBox(height: 20),
              Text(viewModel.uvm.state.user!.email!),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // create text input box that has borders. the box size width is 200, and height is 50. it is positioned at the center of the screen. it has a cancel button at the trailing side.
                  NameInputBox(),
                ],
              )
            ],
          ),
        ));
  }
}
