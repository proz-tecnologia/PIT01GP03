// ignore_for_file: unused_import
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:porkinio/app/common/widgets/custom_form_field.dart';

void main() {
  
  testWidgets('test in CustomFormField', (tester) async {
    const text = 'name';
    const text1 = 'qual seu name';
    const text2 = 'nome completo';

    await tester.pumpWidget(const MaterialApp(
        home: Material(
            child: CustomFormField(
      text: text,
      helperText: text1,
      labelText: text2,
    ))));

    final textFinder = find.text(text);
    final helperTextFinder = find.text(text1);
    final labelTextFinder = find.text(text2);

    expect(textFinder, findsOneWidget);
    expect(helperTextFinder, findsOneWidget);
    expect(labelTextFinder, findsOneWidget);
  });
}
