import 'package:flutter/material.dart';
import 'package:quran_helper/models/juz.dart';
import 'package:quran_helper/screens/juz_info/widgets/surah_card.dart';
import 'package:quran_helper/screens/juz_info/widgets/surahs_grid.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class JuzInfo extends StatelessWidget {
  const JuzInfo({Key? key, required this.juz}) : super(key: key);
  final Juz juz;

  Widget _renderVerseMapping() {
    List<Widget> widgets = [];

    juz.verseMapping.forEach((key, value) {
      widgets.add(
        SurahCard(surah: key, ayahs: value),
      );
    });

    return SurahsGrid(widgets: widgets);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${AppLocalizations.of(context)!.juz} ${juz.juzNumber}"),
      ),
      body: ListView(
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10.0),
                  RichText(
                    text: TextSpan(
                      text: "${AppLocalizations.of(context)!.versesCount}:  ",
                      style: const TextStyle(color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                          text: juz.versesCount.toString(),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  _renderVerseMapping()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}