import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:quran_helper/models/juz.dart';
import 'package:quran_helper/screens/juz_info/juz_info.dart';

class JuzCard extends StatelessWidget {
  const JuzCard({
    Key? key,
    required this.juz,
  }) : super(key: key);

  final Juz juz;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0)),
      child: ListTile(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0)),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => JuzInfo(juz: juz),
            ),
          );
        },
        title: FittedBox(
          child: Text(
            AppLocalizations.of(context)!.juz,
            textAlign: TextAlign.center,
          ),
        ),
        subtitle: Text(
          juz.juzNumber.toString(),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
