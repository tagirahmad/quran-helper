import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:quran_helper/screens/home/home.dart';

void main() {
  testWidgets(
    'Shows list of juzs on the home page',
    (WidgetTester tester) async {
      await tester.pumpWidget(const TestApp(Home()));

      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      await tester.pump();

      // expect(find.text('1'), findsOneWidget);
    },
  );
}

class TestApp extends StatelessWidget {
  const TestApp(this.child, {Key? key}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: child,
    );
  }
}
