import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:text_project/presentation/note_screen/note_screen_view_model.dart';

import 'package:flutter/material.dart';

class SortDialog extends StatefulWidget {
  @override
  _SortDialogState createState() => _SortDialogState();
}

class _SortDialogState extends State<SortDialog> {
  late SortType tempSortType;
  late bool tempAscending;

  @override
  void initState() {
    super.initState();

    final viewModel = context.read<NoteScreenViewModel>();
    tempSortType = viewModel.sortType;
    tempAscending = viewModel.ascending;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('노트 정렬'),
      content: Consumer<NoteScreenViewModel>(
        builder: (context, vm, child) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Divider(),
            RadioListTile(
              title: const Text(
                '날짜순',
                textAlign: TextAlign.center,
              ),
              value: SortType.date,
              groupValue: tempSortType,
              onChanged: (value) {
                setState(() {
                  tempSortType = value as SortType;
                });
              },
            ),
            RadioListTile(
              title: const Text(
                '단어순',
                textAlign: TextAlign.center,
              ),
              value: SortType.word,
              groupValue: tempSortType,
              onChanged: (value) {
                setState(() {
                  tempSortType = value as SortType;
                });
              },
            ),
            const Divider(),
            CheckboxListTile(
              title: const Text('오름차순 정렬'),
              value: tempAscending,
              onChanged: (value) {
                setState(() {
                  tempAscending = value!;
                });
              },
            ),
            const Divider(),
          ],
        ),
      ),
      actions: [
        TextButton(
          child: const Text('적용'),
          onPressed: () {
            context
                .read<NoteScreenViewModel>()
                .setSortMethod(tempSortType, tempAscending);
            context.read<NoteScreenViewModel>().sort();
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: const Text('취소'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
