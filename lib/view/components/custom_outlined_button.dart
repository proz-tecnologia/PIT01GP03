import 'package:flutter/material.dart';
import 'package:projeto_flutter/view/themes/app_colors.dart';

class CustomOutlinedButton extends StatelessWidget {
  final String customImage;
  final String customText;

  const CustomOutlinedButton(
      {required this.customImage, required this.customText, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.06,
      child: OutlinedButton(
        style: ButtonStyle(
          side: MaterialStateProperty.all(
              const BorderSide(color: AppColors.orange)),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        onPressed: () {}, 
        // TODO: SPRINT 3: IMPLEMENTAR NAVEGAÇÃO
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              customImage,
              height: 24,
              // TODO: PAULO: VERIFICAR NO LAYOUT DE TODAS AS PÁGINAS OS VALORES FIXOS DE DIMENSÕES EM PIXELS
              color: AppColors.orange,
              alignment: Alignment.center,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
            ),
            Text(
              customText,
              style: const TextStyle(fontSize: 18, color: AppColors.orange),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
