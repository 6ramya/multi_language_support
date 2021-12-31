import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:multi_language_support/l10n/l10n.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:multi_language_support/pages/localization_app_page.dart';
import 'package:multi_language_support/pages/localization_system_page.dart';
import 'package:multi_language_support/provider/locale_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => LocaleProvider(),
        builder: (context, child) {
          final provider = Provider.of<LocaleProvider>(context);
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.teal,
            ),
            locale: provider.locale,
            supportedLocales: L10n.all,
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate
            ],
            home: const HomePage(),
          );
        });
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: buildBottomNavigationBar(), body: buildPages());
  }

  Widget buildBottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: Colors.teal[300],
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white60,
      currentIndex: index,
      items: [
        BottomNavigationBarItem(
            icon: Text('Localization', style: TextStyle(color: Colors.white)),
            title: Text('System', style: TextStyle(color: Colors.white))),
        BottomNavigationBarItem(
            icon: Text('Localization', style: TextStyle(color: Colors.white)),
            title: Text('App', style: TextStyle(color: Colors.white)))
      ],
      onTap: (int index) {
        setState(() {
          this.index = index;
          print(index);
        });
      },
    );
  }

  Widget buildPages() {
    switch (index) {
      case 0:
        return LocalizationSystemPage();
      case 1:
        return LocalizationAppPage();
      default:
        return Container();
    }
  }
}
