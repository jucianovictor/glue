import 'package:flutter/material.dart';
import 'package:glue/src/view/home/home_page.dart';
import 'package:glue/src/view/home/home_page_controller.dart';
import 'package:provider/provider.dart';

import 'home/components/card_list/card_list_controller.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomePageController()),
        ChangeNotifierProvider(create: (_) => CardListController()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          //useMaterial3: true,
          brightness: Brightness.light,
          primarySwatch: Colors.indigo,
          fontFamily: 'Georgia',
        ),
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.system,
        initialRoute: '/',
        routes: {
          '/': (context) => const HomePage(),
        },
      ),
    );
  }
}
