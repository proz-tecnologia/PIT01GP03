import 'package:flutter/material.dart';
import 'package:porkinio/app/common/themes/app_colors.dart';

class BackgroundHeader extends StatelessWidget {
  const BackgroundHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.10,
      color: AppColors.primaryDark,
    );
  }
}
