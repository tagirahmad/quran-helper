import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:quran_helper/models/juz.dart';
import 'package:quran_helper/service/juz_fetcher.dart';

import 'juz_fetcher.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group('JuzFetcher', () {
    test('behavior', () async {
      JuzFetcher fetchJuzService = JuzFetcher(client: http.Client());
      final juzs = await fetchJuzService.fetch();

      expect(juzs, isA<List<Juz>>());
      expect(juzs.length, 30);

      expect(juzs[0].juzNumber, 1);
      expect(juzs[0].verseMapping, {"1": "1-7", "2": "1-141"});
      expect(juzs[0].versesCount, 148);

      expect(juzs[1].juzNumber, 2);
      expect(juzs[1].verseMapping, {"2": "142-252"});
      expect(juzs[1].versesCount, 111);
    });

    group('.fetch', () {
      test('returns list of Juzs if the http call completes successfully',
          () async {
        final client = MockClient();

        when(
          client.get(
            Uri.parse('http://api.quran.com/api/v3/juzs'),
          ),
        ).thenAnswer(
          (_) async {
            return http.Response(
                '{"juzs": [{"id": 1, "juz_number": 1, "verse_mapping": {"1": "1-7", "2": "1-141"}, "verses_count": 148}]}',
                200);
          },
        );

        var result = await JuzFetcher(client: client).fetch();

        expect(result, isA<List<Juz>>());
        expect(result[0].versesCount, equals(148));
      });
    });
  });
}
