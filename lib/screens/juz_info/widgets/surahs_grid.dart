import 'package:flutter/material.dart';

class SurahsGrid extends StatelessWidget {
  const SurahsGrid({Key? key, required this.widgets}) : super(key: key);

  final List<Widget> widgets;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      addRepaintBoundaries: false,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 3,
      children: widgets,
    );
  }
}
