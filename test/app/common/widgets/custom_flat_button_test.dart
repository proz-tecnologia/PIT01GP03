import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:porkinio/app/common/themes/app_colors.dart';
import 'package:porkinio/app/common/widgets/custom_flat_button.dart';

void main() {

  testWidgets('test in CustomFlatButton ...', (tester) async {

    const tname = 'ESQUECI MINHA SENHA';
    const tcolor = AppColors.textMediumGray;
    const twidth = 0.9;
    const theight = 0.06;
    const tfontSize = 20.0;
    const ttextColor= AppColors.white;

    await tester.pumpWidget(const MaterialApp(
        home: Material(
            child: CustomFlatButton(
      text: tname,
      color: tcolor,
      width: twidth,
      height: theight,
      fontSize: tfontSize,
      textColor: ttextColor,
    ))));

    final textFinder = find.text(tname);

    expect(textFinder, findsOneWidget);
  });
}
