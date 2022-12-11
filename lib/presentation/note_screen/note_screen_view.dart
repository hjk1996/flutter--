import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:text_project/presentation/note_screen/components/note_card.dart';
import 'package:text_project/presentation/note_screen/note_screen_view_model.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({super.key});

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  StreamSubscription? _subscription;

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      final viewModel = context.read<NoteScreenViewModel>();
      _subscription = viewModel.eventStream.listen((event) {
        event.when(onDelete: (String word) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('"$word"가 삭제되었습니다.'),
              duration: const Duration(seconds: 3),
              action: SnackBarAction(
                label: '취소',
                onPressed: () {
                  viewModel.cancelDelete();
                },
              ),
            ),
          );
        });
      });
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: context.read<NoteScreenViewModel>().refresh(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return SingleChildScrollView(
              child: Consumer<NoteScreenViewModel>(
                builder: (context, viewModel, child) {
                  return Column(
                      children: viewModel.notes
                          .map((noteItem) => NoteCard(noteItem: noteItem))
                          .toList());
                },
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
