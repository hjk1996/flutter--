import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:text_project/presentation/user_screen/user_screen_view_model.dart';

class NameInputBox extends StatefulWidget {
  @override
  State<NameInputBox> createState() => _NameInputBoxState();
}

class _NameInputBoxState extends State<NameInputBox> {
  bool _isEditing = false;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    final viewModel = context.read<UserScreenViewModel>();
    _controller.text = viewModel.state.edittedName ?? '';
    _controller.addListener(() {
      viewModel.edittedName = _controller.text;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<UserScreenViewModel>();

    return SizedBox(
      width: 300,
      child: TextFormField(
        controller: _controller,
        autovalidateMode: AutovalidateMode.always,
        onTap: () {
          setState(() {
            _isEditing = true;
          });
        },
        validator: viewModel.validateName,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          suffixIcon: _isEditing
              ? IconButton(
                  icon: const Icon(Icons.cancel),
                  onPressed: _controller.clear,
                )
              : null,
        ),
      ),
    );
  }
}
