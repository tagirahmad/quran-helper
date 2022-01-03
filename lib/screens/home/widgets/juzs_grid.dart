import 'package:flutter/material.dart';
import 'package:quran_helper/models/juz.dart';

import 'juz_card.dart';

class JuzsGrid extends StatelessWidget {
  const JuzsGrid({Key? key, required this.juzs}) : super(key: key);

  final List<Juz> juzs;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: juzs.length,
      itemBuilder: (context, index) {
        final juz = juzs[index];

        return JuzCard(juz: juz);
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
      ),
    );
  }
}
