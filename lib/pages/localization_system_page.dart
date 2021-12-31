import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:multi_language_support/widget/language_picker_widget.dart';

class LocalizationSystemPage extends StatefulWidget {
  const LocalizationSystemPage({Key? key}) : super(key: key);

  @override
  _LocalizationSystemPageState createState() => _LocalizationSystemPageState();
}

class _LocalizationSystemPageState extends State<LocalizationSystemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Multi Language Support'),
          centerTitle: true,
          elevation: 0,
        ),
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          LanguagePicker(),
          const SizedBox(height: 32),
          Text(AppLocalizations.of(context)!.language,
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic)),
          const SizedBox(height: 32),
          Text(AppLocalizations.of(context)!.helloWorld,
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic)),
        ])));
  }
}
