import 'package:flutter/material.dart';
import 'package:learn_provider_g9/controllers/home_controller.dart';
import 'package:learn_provider_g9/controllers/theme_controller.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // var homeController = Provider.of<HomeController>(context);
    // var themController = Provider.of<ThemeController>(context);
    var homeController = context.watch<HomeController>();
    var themController = context.read<ThemeController>();
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              themController.changeTheme();
            },
            icon: Icon(
              themController.currentTheme == ThemeMode.light
                  ? Icons.light_mode
                  : Icons.dark_mode,
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "This is your increment",
              style: TextStyle(
                fontSize: 28,
              ),
            ),
            Text(
              "${homeController.index}",
              style: const TextStyle(
                fontSize: 38,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          homeController.increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
