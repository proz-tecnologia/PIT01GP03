import 'package:flutter/material.dart';
import 'package:projeto_flutter/view/components/custom_form_field.dart';
import 'package:projeto_flutter/view/components/password_form_field.dart';
import 'package:projeto_flutter/view/components/header_logo.dart';

import '../../controllers/login_controller.dart';
import '../../controllers/login_state.dart';
import '../components/validator.dart';
import '../themes/app_colors.dart';
import '../themes/app_images.dart';
import '../components/custom_outlined_button.dart';
import 'home_page.dart';

// TODO: Implementar botão google
// TODO: Implementar botão microsoft
// TODO: Implementar navegação do botão CADASTRAR NOVA CONTA para página de cadastro

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static const routeLoginPage = '/login-page';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formkey = GlobalKey();

  final _controller = LoginController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(
      () {
        if (_controller.state is LoginLoadingState) {
          showDialog(
            context: context,
            builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        // TODO: corrigir nome LoginSucessState para LoginSuccessState
        if (_controller.state is LoginSucessState) {
          Navigator.of(context).pushReplacementNamed(HomePage.routeHomePage);
        }
        if (_controller.state is LoginErrorState) {
          showDialog(
            // TODO: trabalhar na tela de erro.
            context: context,
            builder: (context) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Erro ao logar',
                  style: TextStyle(
                      color: AppColors.orange,
                      fontSize: 14,
                      decoration: TextDecoration.none),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                  width: MediaQuery.of(context).size.height * 0.2,
                  child: TextButton(
                    onPressed: () => Navigator.of(context)
                        .pushReplacementNamed(LoginPage.routeLoginPage),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Tente novamente",
                          style: TextStyle(
                              fontSize: 14,
                              color: AppColors.orange,
                              decoration: TextDecoration.underline),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        }
      },
    );
  }

  // TODO: atualizar rotas com o padrão definido na home_page
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
              key: _formkey,
              //TODO: upperCammelCase
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: <Widget>[
                    const CustomFormField(
                        customFormField: "E-MAIL",
                        validator: Validator.validateEmail),
                    SizedBox(
                        height: (MediaQuery.of(context).size.height) * 0.04),
                    const PasswordFormField(
                      passwordFormField: 'SENHA',
                      validator: Validator.validatePassword,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: ElevatedButton(
                        onPressed: () {
                          // Navigator.of(context)
                          //     .pushReplacementNamed(HomePage.routeHomePage);
                          final valid = _formkey.currentState != null &&
                              _formkey.currentState!.validate();
                          // TODO: evitar exclamação no null safety
                          if (valid) {
                            _controller.doLogin();
                          } else {}
                          // TODO: else vazio
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
                      onTap: null, // TODO: Implementar navegação para página de recuperação de conta
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
                        onPressed: () {}, // TODO: Implementar
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
