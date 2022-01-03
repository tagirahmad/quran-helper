import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:quran_helper/models/juz.dart';

class JuzFetcher {
  JuzFetcher({http.Client? client}) {
    this.client = client ?? http.Client();
  }

  late final http.Client client;

  Future<List<Juz>> fetch() async {
    const String juzsUrl = 'http://api.quran.com/api/v3/juzs';

    http.Response data = await client.get(Uri.parse(juzsUrl));
    final decodedData = jsonDecode(data.body)['juzs'] as List<dynamic>?;

    final juzs = decodedData != null
        ? decodedData.map((juzData) => Juz.fromJson(juzData)).toList()
        : <Juz>[];

    return juzs;
  }
}
