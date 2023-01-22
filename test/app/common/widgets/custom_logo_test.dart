// ignore_for_file: unused_import
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:porkinio/app/common/widgets/custom_logo.dart';

void main() {
  testWidgets('custom logo ...', (tester) async {
     await tester.pumpWidget(const MaterialApp(home: CustomLogo()));

    expect(find.byType(Column), findsOneWidget);
    expect(find.byType(Text), findsOneWidget);
    expect(find.text("Porkin.io"), findsOneWidget);
    expect(find.byType(Image), findsOneWidget);
    
  });
}