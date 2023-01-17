import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  group('account recovery page ...', (() {

    testWidgets('finds a Text widget', (tester) async {
      const text = "Recuperar sua senha";
      await tester.pumpWidget(const MaterialApp(
        home: Scaffold(
          body: Text(text),
        ),
      ));

      expect(find.text(text), findsOneWidget);
    });

     testWidgets('finds a Text widget', (tester) async {
      const text = "Voltar para tela de login";
      await tester.pumpWidget(const MaterialApp(
        home: Scaffold(
          body: Text(text),
        ),
      ));

      expect(find.text(text), findsOneWidget);
    });


  }));
}
