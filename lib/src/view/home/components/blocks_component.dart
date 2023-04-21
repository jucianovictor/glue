
import 'package:flutter/material.dart';
import 'package:glue_core/glue_core.dart';
import 'block/block_component.dart';

class BlocksComponent extends StatelessWidget {
  final List<Block> blocks;
  final bool isEditMode;

  const BlocksComponent(
      {super.key, required this.blocks, required this.isEditMode});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: Color.fromARGB(255, 217, 255, 0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: ListView.builder(
              itemCount: blocks.length,
              itemBuilder: (context, index) => BlockComponent(
                    block: blocks[index],
                    isEditMode: isEditMode,
                  )),
        ));
  }
}
