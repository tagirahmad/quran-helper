import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SurahCard extends StatelessWidget {
  const SurahCard({
    Key? key,
    required this.surah,
    required this.ayahs,
  }) : super(key: key);

  final String surah;
  final String ayahs;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white10,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${AppLocalizations.of(context)!.surah}: $surah",
                style: const TextStyle(color: Colors.white),
              ),
              Text(
                "${AppLocalizations.of(context)!.ayahs}: $ayahs",
                style: const TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
