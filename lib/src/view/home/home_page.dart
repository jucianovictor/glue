import 'package:flutter/material.dart';
import 'package:glue/src/view/home/components/card_list/card_list_component.dart';
import 'package:glue/src/view/home/home_page_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomePageController _homePageController;

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Glue'),
      ),
      body: const CardListComponent(),
    );
  }
}
