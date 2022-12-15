import 'package:flutter/material.dart';
import 'package:text_project/presentation/edit_screen/edit_screen_view_model.dart';
import 'package:provider/provider.dart';

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
    final viewModel = context.read<EditScreenViewModel>();
    _controller.text = viewModel.state.name ?? '';
    _controller.addListener(() {
      viewModel.name = _controller.text;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<EditScreenViewModel>();

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
