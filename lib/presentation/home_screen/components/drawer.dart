import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:text_project/presentation/home_screen/home_screen_view_model.dart';
import 'package:text_project/presentation/note_screen/note_screen_view.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              child: const Icon(Icons.person),
            ),
            otherAccountsPictures: [
              IconButton(
                onPressed: context.read<HomeScreenViewModel>().logout,
                icon: const Icon(Icons.logout),
              )
            ],
            accountName: const Text('test'),
            accountEmail: const Text('test@dot.com'),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
          ),
          ListTile(
            style: ListTileStyle.drawer,
            shape: ListTileTheme.of(context).shape,
            leading: const Icon(Icons.abc),
            title: Text(
              '단어장',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NoteScreen(),
                  ));
            },
          )
        ],
      ),
    );
  }
}
