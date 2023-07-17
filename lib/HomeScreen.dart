import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'themes_provider.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeModeState = ref.watch(themesProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Flutter Theming Riverpod Demo",
          style: TextStyle(fontSize: 18),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "images/logo.png",
              height: 100,
              width: 100,
            ),
            Text(
              "Change Theme $themeModeState",
              style: const TextStyle(fontSize: 18),
            ),
            Consumer(
              builder: (context, ref, child) {
                return Switch(
                    value: themeModeState == ThemeMode.dark, //false or true
                    onChanged: (value) {
                      ref.read(themesProvider.notifier).changeTheme(value);
                    });
              },
            ),
          ],
        ),
      ),
    );
  }
}
