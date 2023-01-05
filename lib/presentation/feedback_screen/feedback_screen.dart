import 'dart:async';

import 'package:flutter/material.dart';
import 'package:text_project/presentation/feedback_screen/feedback_screen_event.dart';
import 'package:provider/provider.dart';
import 'package:text_project/presentation/feedback_screen/feedback_screen_view_model.dart';
import 'package:text_project/presentation/home_screen/home_screen_view.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late StreamSubscription<FeedbackScreenEvent> _streamSubscription;

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      final viewModel = context.read<FeedbackScreenViewModel>();
      _streamSubscription = viewModel.eventStream.listen((event) {
        event.when(
          onSuccess: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeScreenView(),
              ),
            );
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text('피드백이 전송되었습니다.'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('확인'),
                  ),
                ],
              ),
            );
          },
          onError: (message) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('알 수 없는 에러가 발생했습니다..')));
          },
        );
      });
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    _streamSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Consumer<FeedbackScreenViewModel>(
            builder: (context, value, child) {
              return value.state.isLoading
                  ? const Padding(
                      padding: EdgeInsets.all(8),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  : TextButton(
                      onPressed: () async {
                        if (!_formKey.currentState!.validate()) return;
                        await context
                            .read<FeedbackScreenViewModel>()
                            .sendFeedback(
                                _titleController.text, _contentController.text);

                        _titleController.clear();
                        _contentController.clear();
                      },
                      child: const Text(
                        '전송',
                      ));
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextFormField(
                    controller: _titleController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '제목을 입력해야합니다.';
                      }

                      return null;
                    },
                    maxLines: 1,
                    maxLength: 30,
                    decoration: const InputDecoration(
                      hintText: '제목',
                      counterText: '',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _contentController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '내용을 입력해야합니다.';
                      }

                      return null;
                    },
                    keyboardType: TextInputType.multiline,
                    maxLines: 20,
                    decoration: const InputDecoration(
                      hintText: '내용',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
