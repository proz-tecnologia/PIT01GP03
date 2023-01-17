import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('splash page ...', (tester) async {
    const text = 'Finanças Pessoais';
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: Text(text),
      ),
    ));

    expect(find.text(text), findsOneWidget);
  });

}

