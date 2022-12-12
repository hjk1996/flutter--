import 'package:flutter/material.dart';

class NameInputBox extends StatefulWidget {
  final String name;
  const NameInputBox({required this.name, super.key});

  @override
  State<NameInputBox> createState() => _NameInputBoxState();
}

class _NameInputBoxState extends State<NameInputBox> {
  bool _isEditing = false;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.text = widget.name;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 50,
      child: TextField(
        controller: _controller,
        onTap: () {
          setState(() {
            _isEditing = true;
          });
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          suffixIcon: _isEditing
              ? IconButton(
                  icon: const Icon(Icons.cancel),
                  onPressed: () {
                    _controller.clear();
                  },
                )
              : null,
        ),
      ),
    );
  }
}
