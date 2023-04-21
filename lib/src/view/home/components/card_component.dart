import 'package:flutter/widgets.dart';
import 'package:glue_core/glue_core.dart';

import 'blocks_component.dart';

class CardComponent extends StatefulWidget {
  final Card card;

  const CardComponent({super.key, required this.card});

  @override
  State<CardComponent> createState() => _CardComponentState();
}

class _CardComponentState extends State<CardComponent> {
  bool isEditMode = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () => print('longpress'),
      // onDoubleTap: () => setState(() {
      //   isEditMode = !isEditMode;
      // }),
      onDoubleTap: () => {},
      child: Container(
        height: 500,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: BlocksComponent(
              blocks: widget.card.sentence.blocks, isEditMode: isEditMode),
        ),
      ),
    );
  }
}
