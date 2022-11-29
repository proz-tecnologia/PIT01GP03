import 'package:flutter/material.dart';
import 'package:projeto_flutter/controllers/signUp_state.dart';
import 'package:projeto_flutter/view/components/password_form_field.dart';
import 'package:projeto_flutter/view/components/header_logo.dart';
import 'package:projeto_flutter/view/components/validator.dart';
import '../../controllers/signUp_controller.dart';
import '../themes/app_colors.dart';
import '../components/custom_form_field.dart';
import 'home_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  static const routeSignUpPage = '/sign-up-page';

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formkey = GlobalKey();
  // TODO: upperCammelCase
  final _passwordController = TextEditingController();
  final _controller = SignUpController();

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

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
          Navigator.of(context).pushReplacementNamed(HomePage.routeHomePage);
        }
        if (_controller.state is SignUpErrorState) {
          // TODO: trabalhar na tela de erro
          showDialog(
            context: context,
            builder: (context) => const Center(
              child: Text(
                'Erro ao cadastrar. Verifique os dados inseridos e tente novamente.',
                style: TextStyle(
                  color: AppColors.orange,
                  fontSize: 14,
                ),
              ),
            ),
          );
        }
      },
    );
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
                key: _formkey, // para acessar prop e metodo internos
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
                      const CustomFormField(
                          validator: Validator.validateName,
                          customFormField: 'Nome completo'),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      const CustomFormField(
                          validator: Validator.validateEmail,
                          customFormField: 'E-mail'),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      PasswordFormField(
                        passwordFormField: 'Senha',
                        validator: Validator.validatePassword,
                        controller: _passwordController,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      PasswordFormField(
                        passwordFormField: 'Confirme sua senha',
                        validator: (value) => Validator.confirmValidatePassword(
                            _passwordController.text, value),
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
              child: ElevatedButton(
                onPressed: () {
                  final valid = _formkey.currentState != null &&
                      _formkey.currentState!.validate();
                  if (valid) {
                    _controller.doSignUp();
                  } else {}
                },
                style: ButtonStyle(
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16))),
                  backgroundColor:
                      const MaterialStatePropertyAll(AppColors.green),
                ),
                child: const Text(
                  ' ENTRAR',
                  style: TextStyle(fontSize: 25, color: AppColors.linear),
                ),
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
