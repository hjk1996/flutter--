import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:text_project/presentation/note_screen/note_screen_view_model.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({super.key});

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
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
                          .map((note) => Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 4, vertical: 5),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Card(
                                      child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          note.word,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline4,
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        ...note.meanings.map(
                                          (m) => Text(
                                            m,
                                          ),
                                        )
                                      ],
                                    ),
                                  )),
                                ),
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
