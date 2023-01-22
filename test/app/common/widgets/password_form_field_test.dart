// ignore_for_file: unused_import
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:porkinio/app/common/widgets/password_form_field.dart';

void main() {
  testWidgets('test in PasswordFormField', (tester) async {
          const text = 'name';
      await tester.pumpWidget(const MaterialApp(
          home: Material(
              child: PasswordFormField(
        text: text,
      ))));

      final textFinder = find.text(text);
      expect(textFinder, findsOneWidget);
    });

}