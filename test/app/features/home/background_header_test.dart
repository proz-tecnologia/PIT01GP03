import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:porkinio/app/features/home/background_header.dart';

void main() {
  testWidgets('background header ...', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: BackgroundHeader()));

    expect(find.byType(SizedBox), findsOneWidget);
    expect(find.byType(Container), findsOneWidget);
  });
}
