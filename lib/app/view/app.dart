import 'package:flutter/material.dart';
import 'package:test_store/home/view/home_page.dart';
import 'package:test_store/l10n/l10n.dart';
import 'package:test_store/login/view/login_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme:
            const AppBarTheme(color: Color.fromARGB(255, 31, 108, 114)),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: const Color.fromARGB(255, 31, 108, 114),
        ),
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      // home: LoginPage(),
      home: LoginPage(),
    );
  }
}
