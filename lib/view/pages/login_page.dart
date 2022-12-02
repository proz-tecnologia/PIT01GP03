import 'package:flutter/material.dart';
import 'package:projeto_flutter/controllers/custom_form_field_validator.dart';
import 'package:projeto_flutter/controllers/login_controller.dart';
import 'package:projeto_flutter/controllers/login_state.dart';
import 'package:projeto_flutter/view/components/custom_form_field.dart';
import 'package:projeto_flutter/view/components/custom_outlined_button.dart';
import 'package:projeto_flutter/view/components/password_form_field.dart';
import 'package:projeto_flutter/view/components/header_logo.dart';
import 'package:projeto_flutter/view/pages/account_recovery_page.dart';
import 'package:projeto_flutter/view/pages/home_page.dart';
import 'package:projeto_flutter/view/pages/sign_up_page.dart';
import 'package:projeto_flutter/view/components/error_dialog.dart';
import 'package:projeto_flutter/view/themes/app_colors.dart';
import 'package:projeto_flutter/view/themes/app_images.dart';

// TODO: SPRINT 3: IMPLEMENTAR LOGIN COM GOOGLE
// TODO: SPRINT 3: IMPLEMENTAR LOGIN COM MICROSOFT

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static const routeLoginPage = '/login-page';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  final _controller = LoginController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(
      () {
        if (_controller.loginState is LoginLoadingState) {
          showDialog(
            context: context,
            builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (_controller.loginState is LoginSuccessState) {
          Navigator.of(context).pushReplacementNamed(HomePage.routeHomePage);
        }
        if (_controller.loginState is LoginErrorState) {
          errorDialog(context, "Erro ao logar", LoginPage.routeLoginPage);
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
                    const CustomFormField(
                        formFieldText: "E-MAIL",
                        formFieldValidator:
                            CustomFormFieldValidator.validateEmail),
                    SizedBox(
                        height: (MediaQuery.of(context).size.height) * 0.04),
                    const PasswordFormField(
                      passwordFormField: 'SENHA',
                      passwordValidator:
                          CustomFormFieldValidator.validatePassword,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: MediaQuery.of(context).size.width * 0.6,
                      // TODO: PAULO: COMPONENTIZAR ESSE BOTÃO
                      child: ElevatedButton(
                        onPressed: () {
                          final valid = _formKey.currentState != null &&
                              _formKey.currentState!.validate();
                          if (valid) {
                            _controller.attemptLogin();
                          } 
                        },
                        style: ButtonStyle(
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          backgroundColor:
                              const MaterialStatePropertyAll(AppColors.green),
                        ),
                        child: const Text(
                          ' ENTRAR',
                          style:
                              TextStyle(fontSize: 25, color: AppColors.linear),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: (MediaQuery.of(context).size.height * 0.02),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                            AccountRecoveryPage.routeAccountRecoveryPage);
                      },
                      child: const Center(
                          child: Text(
                        'Esqueci minha senha',
                        style: TextStyle(fontSize: 15),
                      )),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                    const CustomOutlinedButton(
                        customImage: AppImages.google,
                        customText: 'ENTRAR COM GOOGLE'),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    const Padding(
                        padding: EdgeInsets.only(left: 20, right: 40)),
                    const CustomOutlinedButton(
                        customImage: AppImages.microsoft,
                        customText: 'ENTRAR COM MICROSOFT'),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.06,
                      child: OutlinedButton(
                        style: ButtonStyle(
                          side: MaterialStateProperty.all(
                            const BorderSide(color: AppColors.orange),
                          ),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(SignUpPage.routeSignUpPage);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              "CADASTRAR NOVA CONTA",
                              style: TextStyle(
                                  fontSize: 18, color: AppColors.orange),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
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
