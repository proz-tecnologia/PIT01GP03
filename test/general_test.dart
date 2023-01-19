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

  testWidgets('finds a specific instance', (tester) async {
    const childWidget = Padding(padding: EdgeInsets.zero);

    await tester.pumpWidget(Container(child: childWidget));

    expect(find.byWidget(childWidget), findsOneWidget);
  });
}
