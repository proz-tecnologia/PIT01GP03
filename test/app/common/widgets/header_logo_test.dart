// ignore_for_file: unused_import
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:porkinio/app/common/widgets/header_logo.dart';

void main() {


  testWidgets('header logo ...', (tester) async {

    await tester
        .pumpWidget(const MaterialApp(home: HeaderLogo()));
 
      expect(find.byType(Container), findsOneWidget);
      expect(find.byType(SizedBox), findsOneWidget);
  });
}

