import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:porkinio/app/common/utils/custom_form_field_validator.dart';
import 'package:porkinio/app/common/widgets/custom_flat_button.dart';

import 'package:porkinio/app/features/sing_up/sign_up_controller.dart';

import 'package:porkinio/app/features/sing_up/sign_up_state.dart';
import 'package:porkinio/app/common/widgets/custom_form_field.dart';
import 'package:porkinio/app/common/widgets/error_dialog.dart';
import 'package:porkinio/app/common/widgets/header_logo.dart';
import 'package:porkinio/app/common/widgets/password_form_field.dart';

import 'package:porkinio/app/features/home/home_page.dart';
import 'package:porkinio/app/common/constants/app_colors.dart';
import 'package:porkinio/locator.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  static const routeSignUpPage = '/sign-up-page';

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _controller = locator.get<SignUpController>();

  @override
  void initState() {
    super.initState();
    _controller.addListener(
      () {
        if (_controller.state is SignUpLoadingState) {
          showDialog(
            context: context,
            builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (_controller.state is SignUpSucessState) {
          Navigator.of(context);
          Navigator.of(context).pushReplacementNamed(HomePage.routeHomePage);
        }
        if (_controller.state is SignUpErrorState) {
          

          //TODO ESCOLHER QUAL USAR errorDialog OU customShowModalBottomSheet

          Navigator.of(context);
          errorDialog(context, "Erro ao cadastrar", SignUpPage.routeSignUpPage, "Tente novamente");

//          Navigator.of(context);
          //       customShowModalBottomSheet(context, error.message, SignUpPage.routeSignUpPage);
        }
      },
    );
  }

  @override
  void dispose() {
    _controller.state.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeaderLogo(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            Card(
              color: AppColors.lightgreen,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child: Form(
                key: _formKey, 
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: <Widget>[
                      const SizedBox(
                        height: 25,
                      ),
                      const Center(
                        child: Text(
                          'Criar uma nova conta',
                          style: TextStyle(
                            fontSize: 28,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      CustomFormField(
                        formFieldValidator:
                            CustomFormFieldValidator.validateName,
                        formFieldText: 'Nome completo',
                        formFieldController: _nameController,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      CustomFormField(
                        formFieldValidator:
                            CustomFormFieldValidator.validateEmail,
                        formFieldText: 'E-mail',
                        formFieldController: _emailController,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      PasswordFormField(
                        passwordFormFieldText: 'Senha',
                        passwordFormFieldValidator:
                            CustomFormFieldValidator.validatePassword,
                        passwordFormFieldController: _passwordController,
                        passwordValidator: (String? value) {},
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      PasswordFormField(
                        passwordFormFieldText: 'Confirme sua senha',
                        passwordFormFieldValidator: (value) =>
                            CustomFormFieldValidator.confirmValidatePassword(
                                _passwordController.text, value),
                        passwordValidator: (String? value) {},
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      const Center(
                        child: Text(
                          'Ao criar uma conta você confirma que concorda com \nos nossos Termos de Serviço e Política de Privacidade.',
                          style:
                              TextStyle(fontSize: 13, color: AppColors.linear),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width * 0.6,
              child: CustomFlatButton(
                customButtonText: 'ENTRAR',
                customColor: AppColors.primaryDark,
                customWidth: 0.8,
                customHeight: 0.06,
                customFontSize: 25,
                customColorText: AppColors.white,
                customButtonOnPressed: () {
                  final valid = _formKey.currentState != null &&
                      _formKey.currentState!.validate();

                  if (valid) {
                    _controller.doSignUp(
                      name: _nameController.text,
                      email: _emailController.text,
                      password: _passwordController.text,
                    );
                  } else {
                    log('ERROR ao logar');
                  }
                },
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
          ],
        ),
      ),
    );
  }
}
