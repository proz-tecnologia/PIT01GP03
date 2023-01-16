import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:porkinio/app/common/widgets/custom_form_field.dart';

void main() {
  
  testWidgets('test in CustomFormField', (tester) async {
    const tname = 'name';
    const thelperName = 'qual seu name';
    const tlabelName = 'nome completo';

    await tester.pumpWidget(const MaterialApp(
        home: Material(
            child: CustomFormField(
      text: tname,
      helperText: thelperName,
      labelText: tlabelName,
    ))));

    final textFinder = find.text(tname);
    final helperTextFinder = find.text(thelperName);
    final labelTextFinder = find.text(tlabelName);

    expect(textFinder, findsOneWidget);
    expect(helperTextFinder, findsOneWidget);
    expect(labelTextFinder, findsOneWidget);
  });
}
