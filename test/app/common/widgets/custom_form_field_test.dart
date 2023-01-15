import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:porkinio/app/common/widgets/custom_form_field.dart';

void main() {
  testWidgets('custom form field ...', (tester) async {
     const tText = 'name';
     await tester.pumpWidget( const MaterialApp(home: Material(child: CustomFormField(text: tText,))));

    final textFinder = find.text(tText);
    expect(textFinder, findsOneWidget);
  });
}