import 'package:flutter/material.dart';
import 'package:porkinio/app/common/utils/custom_form_field_validator.dart';
import 'package:porkinio/app/common/widgets/custom_auth_dialog.dart';
import 'package:porkinio/app/common/widgets/custom_flat_button.dart';
import 'package:porkinio/app/common/widgets/custom_form_field.dart';
import 'package:porkinio/app/common/widgets/header_logo.dart';
import 'package:porkinio/app/common/themes/app_colors.dart';
import 'package:porkinio/app/features/account_recovery/account_controller.dart';

class AccountRecoveryPage extends StatefulWidget {
  const AccountRecoveryPage({super.key});

  static const route = '/account-recovery-page';

  @override
  State<AccountRecoveryPage> createState() => _AccountRecoveryPageState();
}

class _AccountRecoveryPageState extends State<AccountRecoveryPage> {

  final GlobalKey<FormState> _formKey = GlobalKey();
  final _emailController = TextEditingController();
  final accountController = AccountController();

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
                key: _formKey,
                child: ListView(
                    padding: const EdgeInsets.all(16),
                    shrinkWrap: true,
                    children:[
                      const SizedBox(
                        height: 25,
                      ),
                      const Center(
                          child: Text(
                        'Recuperar sua senha',
                        style: TextStyle(
                          fontSize: 28,
                          color: AppColors.white,
                        ),
                      )),
                      const SizedBox(
                        height: 25,
                      ),
                      
                      CustomFormField(
                        formFieldValidator:
                            CustomFormFieldValidator.validateEmail,
                        formFieldText: 'E-mail',
                        formFieldController: _emailController,
                      ),
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
              customButtonOnPressed: () {
                if (_formKey.currentState != null &&
                    _formKey.currentState!.validate()) {
                  accountController.forgotPassword(_emailController.text);
                } else {
                  customAuthDialog(
                      context,
                      'Digite um e-mail para recuperar a senha',
                      AccountRecoveryPage.route);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

 // COLOCAR VALORES RELATIVOS
 // TODO: PAULO: IMPLENTAR COMPORTAMENTO, POR EXEMPLO, UM SHOW DIALOG COM UMA
 // MENSAGEM DE "FOI ENVIADO E-MAIL DE RECUPERAÇÃO DE SENHA, 
 // VERIFIQUE SUA CAIXA DE ENTRADA"
