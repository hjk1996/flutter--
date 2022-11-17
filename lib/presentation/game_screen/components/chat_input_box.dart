import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ChatInputBox extends StatelessWidget {
  final TextEditingController _controller;
  final VoidCallback _onSendPressed;
  const ChatInputBox({
    super.key,
    required TextEditingController controller,
    required VoidCallback onSendPressed,
  })  : _controller = controller,
        _onSendPressed = onSendPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: _controller,
            ),
          ),
          IconButton(
            onPressed: _onSendPressed,
            icon: const Icon(Icons.send),
          ),
        ],
      ),
    );
  }
}
