import 'package:flutter/material.dart';
import 'package:text_project/presentation/user_screen/components/name_input_box.dart';
import 'package:provider/provider.dart';
import 'package:text_project/presentation/user_screen/user_screen_view_model.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<UserScreenViewModel>();

    return Scaffold(
        appBar: AppBar(
          title: const Text('내 정보 수정'),
          actions: [TextButton(onPressed: () {
          }, child: const Text('저장'))],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: ClipOval(
                      child: Stack(
                        clipBehavior: Clip.antiAlias,
                        children: [
                          SizedBox(
                              width: 100, height: 100, child: CircleAvatar()),
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
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // create text input box that has borders. the box size width is 200, and height is 50. it is positioned at the center of the screen. it has a cancel button at the trailing side.
                  NameInputBox(
                    name: viewModel.state.user!.displayName!,
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
