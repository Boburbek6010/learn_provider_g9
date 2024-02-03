import 'package:flutter/material.dart';
import 'package:learn_provider_g9/controllers/home_controller.dart';
import 'package:learn_provider_g9/controllers/theme_controller.dart';
import 'package:learn_provider_g9/controllers/todo_controller.dart';
import 'package:learn_provider_g9/pages/detail_page.dart';
import 'package:learn_provider_g9/pages/home_page.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeController()),
        ChangeNotifierProvider(create: (context) => ThemeController()),
        ChangeNotifierProvider(create: (context) => TodoController()),
      ],
      child: const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: Provider.of<ThemeController>(context).currentTheme,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: const DetailPage(),
    );
  }
}

/// 1. ChangeNotifier - base controller class
/// 2. notifyListeners() - updater
/// 3. ChangeNotifierProvider - Inherited Widget - Asosiy taminotchi
/// 4. Provider.of<CounterController>(context) - kerakli malomtni inherited widget(ChangeNotifierProvider)dan olish

