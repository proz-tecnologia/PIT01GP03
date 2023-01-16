import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('custom logo ...', (tester) async {
      const text = "Porkin.io";
      await tester.pumpWidget(const MaterialApp(
        home: Scaffold(
          body: Text(text),
        ),
      ));

      expect(find.text(text), findsOneWidget);

  });
}