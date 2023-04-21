import 'package:flutter/material.dart';
import 'package:glue_core/glue_core.dart';

class TitleBlockComponent extends StatefulWidget {
  final Block block;
  final bool isEditMode;

  const TitleBlockComponent(
      {super.key, required this.block, required this.isEditMode});

  @override
  State<TitleBlockComponent> createState() => _TitleBlockComponentState();
}

class _TitleBlockComponentState extends State<TitleBlockComponent> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.value = TextEditingValue(text: widget.block.value);
  }

  @override
  Widget build(BuildContext context) {
    return EditableText(
      readOnly: !widget.isEditMode,
      controller: _controller,
      focusNode: FocusNode(),
      style: const TextStyle(
        fontSize: 40,
      ),
      cursorColor: const Color.fromARGB(255, 0, 0, 0),
      backgroundCursorColor: const Color.fromARGB(255, 51, 0, 255),
      keyboardType: TextInputType.multiline,
      maxLines: null,
      onChanged: (value) {
        // Faça algo com o valor do texto quando ele mudar.
      },
    );
  }
}
