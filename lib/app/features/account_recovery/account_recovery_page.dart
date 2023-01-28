import 'package:flutter/material.dart';
import 'package:porkinio/app/common/utils/custom_form_field_validator.dart';
import 'package:porkinio/app/common/widgets/custom_auth_dialog.dart';
import 'package:porkinio/app/common/widgets/custom_flat_button.dart';
import 'package:porkinio/app/common/widgets/custom_form_field.dart';
import 'package:porkinio/app/common/widgets/header_logo.dart';
import 'package:porkinio/app/common/themes/app_colors.dart';
import 'package:porkinio/app/features/account_recovery/account_recovery_controller.dart';
import 'package:porkinio/app/features/account_recovery/account_recovery_state.dart';
import 'package:porkinio/app/features/sign_in/sign_in_page.dart';

class AccountRecoveryPage extends StatefulWidget {
  const AccountRecoveryPage({super.key});

  static const route = '/account-recovery-page';

  @override
  State<AccountRecoveryPage> createState() => _AccountRecoveryPageState();
}

class _AccountRecoveryPageState extends State<AccountRecoveryPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final _emailController = TextEditingController();
  final accountController = AccountRecoveryController();

  @override
  void initState() {
    super.initState();
    accountController.addListener(
      () {
        if (accountController.state is AccountRecoverySuccessState) {
          customAuthDialog(context, accountController.infoMessage, 'Login',
              SignInPage.route);
        }
        if (accountController.state is AccountRecoveryErrorState) {
          final error =
              (accountController.state as AccountRecoveryErrorState).message;
          customAuthDialog(context, error, 'Tentar', AccountRecoveryPage.route);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const HeaderLogo(),
              Card(
                color: Colors.white,
                child: Form(
                  key: _formKey,
                  child: ListView(
                    padding: const EdgeInsets.all(16),
                    shrinkWrap: true,
                    children: [
                      Center(
                        child: Text(
                          'Recuperar sua senha',
                          style: Theme.of(context)
                              .textTheme
                              .headline5
                              ?.copyWith(
                                  color: Theme.of(context).primaryColorDark),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      CustomFormField(
                        validator: CustomFormFieldValidator.validateEmail,
                        labelText: 'E-mail',
                        controller: _emailController,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              CustomFlatButton(
                  text: 'RECUPERAR',
                  color: AppColors.primaryDark,
                  width: 0.9,
                  height: 0.06,
                  fontSize: 20,
                  textColor: Colors.white,
                  onPressed: () {
                    if (_formKey.currentState != null &&
                        _formKey.currentState!.validate()) {
                      accountController.forgotPassword(_emailController.text);
                    }
                  }),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(SignInPage.route);
                },
                child: const Center(
                  child: Text(
                    'Voltar para tela de login',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            ],
          ),
        ),
      ),
    );
  }
}
