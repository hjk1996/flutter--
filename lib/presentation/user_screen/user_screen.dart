import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:text_project/presentation/user_screen/components/edit_page.dart';
import 'package:text_project/presentation/user_screen/user_screen_event.dart';
import 'package:text_project/presentation/user_screen/user_screen_view_model.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  late StreamSubscription<UserScreenEvent> _eventSubscription;

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      _eventSubscription =
          context.read<UserScreenViewModel>().eventStream.listen((event) {
        event.when(
          onEditPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const EditPage()));
          },
        );
      });
    });
  }

  @override
  void dispose() {
    _eventSubscription.pause();
    _eventSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('내 정보'),
      ),
      body: FutureBuilder(
          future: context.read<UserScreenViewModel>().getUserInfo(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 100,
                            width: double.infinity,
                            child: Consumer<UserScreenViewModel>(
                              builder: (context, vm, child) {
                                return Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 50,
                                      child: Icon(Icons.person),
                                    ),
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          vm.state.user!.displayName!,
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineMedium,
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Text('70승 10패')
                                      ],
                                    ),
                                    const Spacer(),
                                    IconButton(
                                        onPressed: context
                                            .read<UserScreenViewModel>()
                                            .onEditPressed,
                                        icon: const Icon(
                                            Icons.arrow_forward_ios_outlined))
                                  ],
                                );
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 70,
                            child: Card(
                              child: ListTile(
                                leading: const Icon(Icons.history),
                                title: Text('최근 게임'),
                                trailing: const Icon(
                                    Icons.arrow_forward_ios_outlined),
                              ),
                            ),
                          ),
                          const Divider(),
                          SizedBox(
                            width: double.infinity,
                            height: 70,
                            child: Card(
                              child: ListTile(
                                leading: const Icon(Icons.history),
                                title: Text('최근 게임'),
                                trailing: const Icon(
                                    Icons.arrow_forward_ios_outlined),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            '회원 탈퇴',
                            style: TextStyle(color: Colors.red),
                            textAlign: TextAlign.end,
                          )),
                    ],
                  )
                ],
              ),
            );
          }),
    );
  }
}
