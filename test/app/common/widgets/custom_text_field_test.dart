import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:porkinio/app/common/widgets/custom_text_field.dart';

void main() {
  testWidgets('test in CustomTextField', (tester) async {
          const tname = 'name';
      await tester.pumpWidget(const MaterialApp(
          home: Material(
              child: CustomTextField(
        text: tname,
      ))));

      final textFinder = find.text(tname);
      expect(textFinder, findsOneWidget);
  });
}


