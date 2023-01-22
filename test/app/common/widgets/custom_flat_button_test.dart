// ignore_for_file: unused_import
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:porkinio/app/common/widgets/custom_flat_button.dart';

void main() {

  testWidgets('test in CustomFlatButton', (tester) async {

    const text = 'ESQUECI MINHA SENHA';
    const color = Colors.grey;
    const width = 0.9;
    const height = 0.06;
    const fontSize = 20.0;
    const textColor= Colors.white;

    await tester.pumpWidget(const MaterialApp(
        home: Material(
            child: CustomFlatButton(
      text: text,
      color: color,
      width: width,
      height: height,
      fontSize: fontSize,
      textColor: textColor,
    ))));

    final textFinder = find.text(text);

    expect(textFinder, findsOneWidget);
  });
}
