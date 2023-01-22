import 'package:flutter/material.dart';
import 'package:porkinio/app/common/utils/custom_form_field_validator.dart';
import 'package:porkinio/app/common/widgets/custom_auth_dialog.dart';
import 'package:porkinio/app/features/sign_in/sign_in_controller.dart';
import 'package:porkinio/app/features/sign_in/sign_in_state.dart';
import 'package:porkinio/app/common/widgets/custom_flat_button.dart';
import 'package:porkinio/app/common/widgets/custom_form_field.dart';
import 'package:porkinio/app/common/widgets/header_logo.dart';
import 'package:porkinio/app/common/widgets/password_form_field.dart';
import 'package:porkinio/app/features/account_recovery/account_recovery_page.dart';
import 'package:porkinio/app/features/home/home_page.dart';
import 'package:porkinio/app/features/sign_up/sign_up_page.dart';
import 'package:porkinio/app/common/themes/app_colors.dart';
import 'package:porkinio/locator.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  static const route = '/sign-in-page';

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final signInController = locator.get<SignInController>();

  @override
  void initState() {
    super.initState();
    signInController.addListener(
      () {
        if (signInController.state is SignInLoadingState) {
          showDialog(
            context: context,
            builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (signInController.state is SignInSuccessState) {
          Navigator.of(context).pushReplacementNamed(HomePage.route);
        }
        if (signInController.state is SignInErrorState) {
          final error = (signInController.state as SignInErrorState).message;
          customAuthDialog(context, error, 'Logan', SignInPage.route);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const HeaderLogo(),
            SizedBox(height: (MediaQuery.of(context).size.height) * 0.04),
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: <Widget>[
                    CustomFormField(
                        labelText: "E-MAIL",
                        controller: _emailController,
                        validator: CustomFormFieldValidator.validateEmail),
                    SizedBox(
                        height: (MediaQuery.of(context).size.height) * 0.04),
                    PasswordFormField(
                      labelText: 'SENHA',
                      controller: _passwordController,
                      validator: CustomFormFieldValidator.validatePassword,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                    CustomFlatButton(
                      text: 'ENTRAR',
                      color: AppColors.primaryDark,
                      width: 0.9,
                      height: 0.06,
                      fontSize: 20,
                      textColor: Colors.white,
                      onPressed: () {
                        final valid = _formKey.currentState != null &&
                            _formKey.currentState!.validate();
                        if (valid) {
                          signInController.doLogin(
                            email: _emailController.text,
                            password: _passwordController.text,
                          );
                        }
                      },
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    CustomFlatButton(
                      text: 'ESQUECI MINHA SENHA',
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(AccountRecoveryPage.route);
                      },
                      color: Colors.grey,
                      width: 0.9,
                      height: 0.06,
                      fontSize: 20,
                      textColor: Colors.white,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    CustomFlatButton(
                      text: 'CADASTRAR NOVA CONTA',
                      color: Colors.grey,
                      width: 0.9,
                      height: 0.06,
                      fontSize: 20,
                      textColor: Colors.white,
                      onPressed: () {
                        Navigator.of(context).pushNamed(SignUpPage.route);
                      },
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
