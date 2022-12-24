import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum SetPhotoAction { CAMERA, GALLERY, REMOVE, CANCEL }

class SetPhotoDialog extends StatelessWidget {
  const SetPhotoDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      children: [
        SimpleDialogOption(
          onPressed: () {
            Navigator.pop(context, SetPhotoAction.CAMERA);
          },
          child: const Text('카메라'),
        ),
        SimpleDialogOption(
          onPressed: () {
            Navigator.pop(context, SetPhotoAction.GALLERY);
          },
          child: const Text('갤러리'),
        ),
        SimpleDialogOption(
          onPressed: () {
            Navigator.pop(context, SetPhotoAction.REMOVE);
          },
          child: const Text('프로필 이미지 제거'),
        ),
        const Spacer(),
        TextButton(
            onPressed: () {
              Navigator.pop(context, SetPhotoAction.CANCEL);
            },
            child: const Text('취소')),
      ],
    );
  }
}
