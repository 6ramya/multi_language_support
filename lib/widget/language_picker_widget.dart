import 'package:flutter/material.dart';
import 'package:multi_language_support/l10n/l10n.dart';
import 'package:multi_language_support/provider/locale_provider.dart';
import 'package:provider/provider.dart';

class LanguagePicker extends StatelessWidget {
  const LanguagePicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
    final flag = L10n.getFlag(locale.languageCode);
    return Center(
        child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 72,
            child: Text(flag, style: TextStyle(fontSize: 40))));
  }
}

class LanguagePickerWidget extends StatelessWidget {
  const LanguagePickerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LocaleProvider>(context);
    final locale = provider.locale ?? Locale('en');
    return DropdownButtonHideUnderline(
        child: DropdownButton(
            value: locale,
            icon: Container(width: 12),
            items: L10n.all.map((locale) {
              final flag = L10n.getFlag(locale.languageCode);
              return DropdownMenuItem(
                  child:
                      Center(child: Text(flag, style: TextStyle(fontSize: 18))),
                  value: locale,
                  onTap: () {
                    final provider =
                        Provider.of<LocaleProvider>(context, listen: false);
                    provider.setLocale(locale);
                  });
            }).toList(),
            onChanged: (_) {}));
  }
}
