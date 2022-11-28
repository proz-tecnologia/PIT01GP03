import 'package:flutter/material.dart';
import 'package:projeto_flutter/controllers/signUp_controller.dart';
import 'package:projeto_flutter/view/components/formfield_register_password.dart';
import 'package:projeto_flutter/view/components/logo_app_bar.dart';
import 'package:projeto_flutter/view/components/validator.dart';
import 'package:projeto_flutter/view/pages/signUp_state.dart';
import '../themes/app_colors.dart';
import '../components/formfield_register.dart';
import 'home_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  static const signUp = '/signUp';

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> _formkey = GlobalKey();
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
    _controller.addListener(() {
      if (_controller.state is SignUpLoadingState) {
        showDialog(
            context: context,
            builder: (context) =>
                const Center(child: CircularProgressIndicator()));
      }
      if (_controller.state is SignUpSucessState) {
        Navigator.of(context).pushReplacementNamed(HomePage.routeHomePage);
      }
      if (_controller.state is SignUpLoadingState) {
        showDialog(
            context: context,
            builder: (context) => const Center(
                child: Text('Erro ao cadastrar. Tente novamente', style: TextStyle(color: AppColors.orange, fontSize: 14 ))));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const LogoAppBar(),
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
                key: _formkey, //para acessar prop e metodo internos
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(children: <Widget>[
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
                    )),
                    const SizedBox(
                      height: 25,
                    ),
                    const FormRegister(
                        textRegister: 'Nome completo',
                        validator: Validator.validateName),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    const FormRegister(
                      textRegister: 'E-mail',
                      validator: Validator.validateEmail,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    FormRegisterPassword(
                        controller: _passwordController,
                        textRegister: 'Senha',
                        validator: Validator.validatePassword),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    FormRegisterPassword(
                        textRegister: 'Confirme sua senha',
                        validator: (value) => Validator.confirmValidatePassword(
                            _passwordController.text, value)),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    const Center(
                        child: Text(
                      'Ao criar uma conta você confirma que concorda com \nos nossos Termos de Serviço e Política de Privacidade.',
                      style: TextStyle(fontSize: 13, color: AppColors.linear),
                    )),
                  ]),
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
