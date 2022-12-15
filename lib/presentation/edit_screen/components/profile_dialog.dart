import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum ProfileAction { CAMERA, GALLERY, REMOVE, CANCEL }

class ProfileDialog extends StatelessWidget {
  const ProfileDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: const Text('프로필 사진 변경'),
      children: [
        SimpleDialogOption(
          onPressed: () {
            Navigator.pop(context, ProfileAction.CAMERA);
          },
          child: const Text('카메라'),
        ),
        SimpleDialogOption(
          onPressed: () {
            Navigator.pop(context, ProfileAction.GALLERY);
          },
          child: const Text('갤러리'),
        ),
        SimpleDialogOption(
          onPressed: () {
            Navigator.pop(context, ProfileAction.REMOVE);
          },
          child: const Text('프로필 이미지 제거'),
        ),
        SimpleDialogOption(
          onPressed: () {
            Navigator.pop(context, ProfileAction.CANCEL);
          },
          child: const Text('취소'),
        ),
      ],
    );
  }
}
