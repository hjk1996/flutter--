import 'dart:async';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:text_project/presentation/auth_screen/auth_screen_event.dart';
import 'package:text_project/presentation/auth_screen/auth_screen_view_model.dart';
import 'package:text_project/presentation/common/constants.dart';
import 'package:provider/provider.dart';
import 'package:text_project/presentation/common/set_photo_dialog.dart';
import 'package:text_project/presentation/home_screen/home_screen_view.dart';
import 'package:text_project/presentation/user_screen/user_screen_view_model.dart';

class UserProfileSetting extends StatefulWidget {
  const UserProfileSetting({super.key});

  @override
  State<UserProfileSetting> createState() => _UserProfileSettingState();
}

class _UserProfileSettingState extends State<UserProfileSetting> {
  late StreamSubscription<AuthScreenEvent> _streamSubscription;
  final TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final viewModel = context.read<AuthScreenViewModel>();
    _nameController.addListener(
      () {
        viewModel.name = _nameController.text;
      },
    );

    _streamSubscription = viewModel.eventStream.listen((event) {
      event.when(
          onAuthError: (_) {},
          onSignInSuccess: () {},
          onSignUpSuccess: () async {
            await showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text(
                  '회원가입이 완료되었습니다.\n이메일 인증 후 이용해주세요.',
                  textAlign: TextAlign.center,
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('확인'),
                  ),
                ],
              ),
            );
            if (!mounted) return;
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const HomeScreenView(),
              ),
            );
          },
          whenEmailUsable: () {},
          onProfileTap: () async {
            if (!mounted) return;
            final action = await showDialog<SetPhotoAction>(
              context: context,
              builder: (context) => const SetPhotoDialog(),
            );
            if (action == SetPhotoAction.CAMERA) {
              final image = await ImagePicker().pickImage(
                source: ImageSource.camera,
                imageQuality: 50,
              );
              if (image != null) {
                final imageBytes = await image.readAsBytes();
                viewModel.image = imageBytes;
              }
            } else if (action == SetPhotoAction.GALLERY) {
              final image = await ImagePicker().pickImage(
                source: ImageSource.gallery,
                imageQuality: 50,
              );
              if (image != null) {
                final imageBytes = await image.readAsBytes();

                viewModel.image = imageBytes;
              }
            } else if (action == SetPhotoAction.REMOVE) {
              viewModel.image = null;
            }
          });
    });
  }

  @override
  void dispose() {
    _streamSubscription.cancel();
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('유저 정보 설정'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Consumer<AuthScreenViewModel>(
                builder: (context, value, child) => GestureDetector(
                  onTap: context.read<AuthScreenViewModel>().onProfileTap,
                  child: ClipOval(
                    child: Stack(
                      clipBehavior: Clip.antiAlias,
                      children: [
                        SizedBox(
                          width: 150,
                          height: 150,
                          child: CircleAvatar(
                            backgroundImage: value.state.image != null
                                ? MemoryImage(value.state.image!)
                                : null,
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          child: Container(
                            color: Colors.grey.withOpacity(0.4),
                            width: 150,
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
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 200,
                child: TextFormField(
                  decoration: const InputDecoration(
                    hintText: '별명',
                    border: OutlineInputBorder(),
                  ),
                  controller: _nameController,
                  validator: context.read<AuthScreenViewModel>().validateName,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Consumer<AuthScreenViewModel>(
                builder: (context, vm, child) {
                  return vm.state.isLoading
                      ? const CircularProgressIndicator()
                      : ElevatedButton(
                          onPressed: vm.state.isValidName ? vm.signUp : null,
                          child: const Text('계정 만들기'),
                        );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}