import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:multi_language_support/widget/language_picker_widget.dart';

class LocalizationAppPage extends StatefulWidget {
  const LocalizationAppPage({Key? key}) : super(key: key);

  @override
  _LocalizationAppPageState createState() => _LocalizationAppPageState();
}

class _LocalizationAppPageState extends State<LocalizationAppPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Multi Language Support'),
          centerTitle: true,
          elevation: 0,
          actions: [LanguagePickerWidget(), const SizedBox(width: 10)],
        ),
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const SizedBox(height: 32),
          Text(AppLocalizations.of(context)!.language,
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic)),
          const SizedBox(height: 32),
          Text(AppLocalizations.of(context)!.hello('User'),
              style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic)),
        ])));
  }
}
