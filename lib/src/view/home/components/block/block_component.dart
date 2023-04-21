import 'package:flutter/widgets.dart';
import 'package:glue_core/glue_core.dart';

import 'text_block_component.dart';
import 'title_block_component.dart';

class BlockComponent extends StatefulWidget {
  final Block block;
  final bool isEditMode;

  const BlockComponent(
      {super.key, required this.block, required this.isEditMode});

  @override
  State<BlockComponent> createState() => _BlockComponentState();
}

class _BlockComponentState extends State<BlockComponent> {
  late Block block;

  @override
  void initState() {
    super.initState();
  }

  renderBlock(Block block, bool isEditMode) {
    switch (block.type) {
      case BlockType.title:
        return TitleBlockComponent(
          block: block,
          isEditMode: isEditMode,
        );
      default:
        return TextBlockComponent(block: block, isEditMode: isEditMode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return renderBlock(widget.block, widget.isEditMode);
  }
}
