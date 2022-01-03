import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:quran_helper/models/juz.dart';
import 'package:quran_helper/screens/home/widgets/juzs_grid.dart';
import 'package:quran_helper/service/juz_fetcher.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Quran Helper'), elevation: 0.0),
      body: FutureBuilder<List<Juz>>(
        future: JuzFetcher(client: http.Client()).fetch(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Juz> juzs = snapshot.data!;

            return JuzsGrid(juzs: juzs);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

