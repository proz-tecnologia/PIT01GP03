import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:porkinio/app/common/widgets/custom_form_field.dart';

void main() {
  group('test in CustomFormField', (() {


    testWidgets('CustomFormField test text ', (tester) async {
      const tname = 'name';
      await tester.pumpWidget(const MaterialApp(
          home: Material(
              child: CustomFormField(
        text: tname,
      ))));

      final textFinder = find.text(tname);
      expect(textFinder, findsOneWidget);
    });



  }));
}
