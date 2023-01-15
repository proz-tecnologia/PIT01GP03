import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:porkinio/app/common/widgets/password_form_field.dart';

void main() {
  testWidgets('test in PasswordFormField', (tester) async {
          const tname = 'name';
      await tester.pumpWidget(const MaterialApp(
          home: Material(
              child: PasswordFormField(
        text: tname,
      ))));

      final textFinder = find.text(tname);
      expect(textFinder, findsOneWidget);
    });

}