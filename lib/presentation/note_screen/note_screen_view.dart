import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:text_project/presentation/note_screen/note_screen_view_model.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({super.key});

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  @override
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
                          .map((note) => ListTile(
                                title: Text(note.word),
                                subtitle: Text(note.meanings.toString()),
                              ))
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
