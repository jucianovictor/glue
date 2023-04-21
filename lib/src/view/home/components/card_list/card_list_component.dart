import 'package:flutter/material.dart' hide Card;
import 'package:provider/provider.dart';

import '../card_component.dart';
import 'card_list_controller.dart';

class CardListComponent extends StatefulWidget {
  const CardListComponent({super.key});

  @override
  State<CardListComponent> createState() => _CardListComponentState();
}

class _CardListComponentState extends State<CardListComponent> {
  @override
  initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) =>
        Provider.of<CardListController>(context, listen: false).fetchCards());
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CardListController>(
      builder: (context, provider, child) {
        if (provider.cards.isEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Container(
          color: const Color.fromARGB(255, 0, 255, 204),
          child: ListView.builder(
              itemCount: provider.cards.length,
              itemBuilder: (context, index) {
                return Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: CardComponent(card: provider.cards[index]));
              }),
        );
      },
    );
  }
}
