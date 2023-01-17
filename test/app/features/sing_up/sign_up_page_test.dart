import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('sign up page ...', (() {
    testWidgets('finds a Text widget', (tester) async {
      const text =
          'Ao criar uma conta você confirma que concorda com os nossos Termos de Serviço e Política de Privacidade.';
      await tester.pumpWidget(const MaterialApp(
        home: Scaffold(
          body: Text(text),
        ),
      ));

      expect(find.text(text), findsOneWidget);
    });

    testWidgets('finds a Text widget', (tester) async {
      const text = 'Voltar para tela de login';
      await tester.pumpWidget(const MaterialApp(
        home: Scaffold(
          body: Text(text),
        ),
      ));

      expect(find.text(text), findsOneWidget);
    });
  }));
}
