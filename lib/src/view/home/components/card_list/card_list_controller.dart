import 'package:flutter/foundation.dart';
import 'package:glue_core/glue_core.dart';

class CardListController extends ChangeNotifier {
  List<Card> cards = [];

  //final FindAllCardsUseCase useCase;

  //CardListController({required this.useCase});

  // static final Card defaultCard = () {
  //   Alternative correctAlternative =
  //       Alternative(id: UUID.generate(), value: '2');

  //   Answer answer = Alternatives(alternatives: {
  //     correctAlternative,
  //     Alternative(id: UUID.generate(), value: '3'),
  //     Alternative(id: UUID.generate(), value: '4'),
  //     Alternative(id: UUID.generate(), value: '1')
  //   }, correctAlternatives: <UUID>{
  //     correctAlternative.id!
  //   });

  //   return Card(
  //       question: ContentBlock(blocks: [
  //         Block(value: 'Quanto é:', type: BlockType.title, props: {}),
  //         Block(value: '2 + 2', type: BlockType.text, props: {})
  //       ]),
  //       answer: answer);
  // }();

  Future<void> fetchCards() async {
    cards = [];
    //cards = await useCase;
    notifyListeners();
  }
}

// Block(value: 'Quanto é:', type: BlockType.title, props: {}),
// Block(value: '2 + 2', type: BlockType.text, props: {})
