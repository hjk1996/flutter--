import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:text_project/domain/model/note_item.dart';
import 'package:provider/provider.dart';
import 'package:text_project/presentation/note_screen/note_screen_view_model.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({required this.noteItem, super.key});
  final NoteItem noteItem;

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<NoteScreenViewModel>();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      child: SizedBox(
        width: double.infinity,
        child: Card(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    noteItem.word,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  const Spacer(),
                  IconButton(
                      onPressed: () {
                        viewModel.toggleFavorite(noteItem.word);
                      },
                      icon: Icon(noteItem.isFavorite == true
                          ? Icons.star
                          : Icons.star_outline)),
                  IconButton(
                    onPressed: () {
                      viewModel.deleteWord(noteItem.word);
                    },
                    icon: const Icon(Icons.delete),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              ...noteItem.meanings.map(
                (m) => Text(
                  m,
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
