import 'package:flutter/material.dart';

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
                "Surah: $surah",
                style: const TextStyle(color: Colors.white),
              ),
              Text(
                "Ayahs: $ayahs",
                style: const TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
