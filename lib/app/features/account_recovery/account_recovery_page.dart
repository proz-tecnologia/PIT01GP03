import 'package:flutter/material.dart';
import 'package:porkinio/app/common/utils/custom_form_field_validator.dart';
import 'package:porkinio/app/common/widgets/custom_flat_button.dart';
import 'package:porkinio/app/common/widgets/custom_form_field.dart';
import 'package:porkinio/app/common/widgets/header_logo.dart';
import 'package:porkinio/app/common/themes/app_colors.dart';

class AccountRecoveryPage extends StatelessWidget {
  const AccountRecoveryPage({super.key});

  static const route = '/account-recovery-page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade800,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const HeaderLogo(),
            SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            Card(
              color: AppColors.lightgreen,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child: Form(
                child: ListView(
                    padding: const EdgeInsets.all(16),
                    shrinkWrap: true,
                    children: const <Widget>[
                      SizedBox(
                        height: 25,
                      ),
                      Center(
                          child: Text(
                        'Recuperar sua senha',
                        style: TextStyle(
                          fontSize: 28,
                          color: AppColors.white,
                        ),
                      )),
                      SizedBox(
                        height: 25,
                      ),
                      CustomFormField(
                          formFieldValidator:
                              CustomFormFieldValidator.validateEmail,
                          formFieldText: 'E-mail'),
                    ]),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            CustomFlatButton(
              customButtonText: 'RECUPERAR',
              customColor: AppColors.green,
              customWidth: 0.8,
              customHeight: 0.08,
              customFontSize: 25,
              customColorText: AppColors.white,
              customButtonOnPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}


 // TODO: PAULO: IMPLENTAR COMPORTAMENTO, POR EXEMPLO, UM SHOW DIALOG COM UMA
 // MENSAGEM DE "FOI ENVIADO E-MAIL DE RECUPERAÇÃO DE SENHA, 
 // VERIFIQUE SUA CAIXA DE ENTRADA"
