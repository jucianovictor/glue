import 'package:flutter/material.dart';
import 'package:glue_core/glue_core.dart';

class TextBlockComponent extends StatefulWidget {
  final Block block;
  final bool isEditMode;
  const TextBlockComponent(
      {super.key, required this.block, required this.isEditMode});

  @override
  State<TextBlockComponent> createState() => _TextBlockComponentState();
}

class _TextBlockComponentState extends State<TextBlockComponent> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.value = TextEditingValue(text: widget.block.value);
  }

  @override
  Widget build(BuildContext context) {
    return EditableText(
      controller: _controller,
      readOnly: !widget.isEditMode,
      focusNode: FocusNode(),
      style: const TextStyle(
        fontSize: 15,
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
