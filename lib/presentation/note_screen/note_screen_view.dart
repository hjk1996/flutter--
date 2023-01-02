import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:text_project/presentation/note_screen/components/note_card.dart';
import 'package:text_project/presentation/note_screen/components/sort_dialog.dart';
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
        event.when(onSortButtonPressed: () {
          showDialog(
            context: context,
            builder: (context) => SortDialog(),
          );
        }, onDelete: (String word) {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: context.read<NoteScreenViewModel>().toggleFavoritesOnly,
            icon: Consumer<NoteScreenViewModel>(
              builder: (context, vm, child) {
                return Icon(
                  vm.isFavoritesOnly ? Icons.star : Icons.star_border,
                );
              },
            ),
          ),
          IconButton(
            onPressed: context.read<NoteScreenViewModel>().onSortButtonPressed,
            icon: const Icon(Icons.sort),
          ),
        ],
      ),
      body: FutureBuilder(
        future: context.read<NoteScreenViewModel>().loadNotes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Consumer<NoteScreenViewModel>(
              builder: (context, viewModel, child) {
                if (viewModel.notes.isEmpty) {
                  return Center(
                    child: Text(
                      '단어장에 단어가 없습니다.',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  );
                }

                return SingleChildScrollView(
                  child: Column(
                    children: viewModel.isFavoritesOnly
                        ? viewModel.favorites
                            .map((noteItem) => NoteCard(noteItem: noteItem))
                            .toList()
                        : viewModel.notes
                            .map((noteItem) => NoteCard(noteItem: noteItem))
                            .toList(),
                  ),
                );
              },
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
