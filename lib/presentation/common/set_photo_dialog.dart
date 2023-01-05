import 'package:flutter/material.dart';

enum SetPhotoAction { camera, gallery, remove, cancel }

class SetPhotoDialog extends StatelessWidget {
  const SetPhotoDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      children: [
        SimpleDialogOption(
          onPressed: () {
            Navigator.pop(context, SetPhotoAction.camera);
          },
          child: const Text('카메라'),
        ),
        SimpleDialogOption(
          onPressed: () {
            Navigator.pop(context, SetPhotoAction.gallery);
          },
          child: const Text('갤러리'),
        ),
        SimpleDialogOption(
          onPressed: () {
            Navigator.pop(context, SetPhotoAction.remove);
          },
          child: const Text('프로필 이미지 제거'),
        ),
        TextButton(
            onPressed: () {
              Navigator.pop(context, SetPhotoAction.cancel);
            },
            child: const Text('취소')),
      ],
    );
  }
}
