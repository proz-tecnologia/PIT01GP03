import 'package:flutter/material.dart';
import 'package:projeto_flutter/controllers/login_controller.dart';
import 'package:projeto_flutter/view/components/formfield_register.dart';
import 'package:projeto_flutter/view/components/formfield_register_password.dart';
import 'package:projeto_flutter/view/components/logo_app_bar.dart';
import 'package:projeto_flutter/view/components/validator.dart';
import 'package:projeto_flutter/view/pages/login_state.dart';

import '../themes/app_colors.dart';
import '../themes/app_images.dart';
import '../components/buttons.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  static const login = '/login';

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formkey = GlobalKey();

  final _controller = LoginController();

  @override
  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      if (_controller.state is LoginLoadingState) {
        showDialog(
            context: context,
            builder: (context) =>
                const Center(child: CircularProgressIndicator()));
      }
      if (_controller.state is LoginSucessState) {
        Navigator.of(context).pushReplacementNamed(HomePage.routeHomePage);
      }
      if (_controller.state is LoginErrorState) {
        showDialog(
          
            context: context,
            builder: (context) => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    
                    children: [
                      const Text('Erro ao logar', style:
                              TextStyle(color: AppColors.orange, fontSize: 14, decoration: TextDecoration.none )),
                      const SizedBox(height: 12),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04,
                          width:  MediaQuery.of(context).size.height * 0.2,
                          child: TextButton(
                         //   style:  ButtonStyle(
                              //backgroundColor: const MaterialStatePropertyAll(AppColors.linear),  
                          //shape: MaterialStatePropertyAll(
                             // RoundedRectangleBorder(
                                 // borderRadius: BorderRadius.circular(16)))),                         
                            onPressed: () => Navigator.of(context)
                                .pushReplacementNamed(LoginPage.login),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    "Tente Novamente",
                                    style: TextStyle(
                                        fontSize: 14, color: AppColors.orange, decoration: TextDecoration.underline),
                                    textAlign: TextAlign.center,
                                  ),
                                ]),
                          )),
                    ]));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          const LogoAppBar(),
          SizedBox(height: (MediaQuery.of(context).size.height) * 0.04),
          Form(
            key: _formkey,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                  // shrinkWrap: true,   // verifica se listview tem tamanho min
                  children: <Widget>[
                    const FormRegister(
                        textRegister: "E-MAIL",
                        validator: Validator.validateEmail),
                    SizedBox(
                        height: (MediaQuery.of(context).size.height) * 0.04),
                    const FormRegisterPassword(
                        textRegister: 'SENHA',
                        validator: Validator.validatePassword),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.06,
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: ElevatedButton(
                        onPressed: () {
                          final valid = _formkey.currentState != null &&
                              _formkey.currentState!.validate();
                          if (valid) {
                            _controller.doLogin();
                          } else {}
                        },
                        style: ButtonStyle(
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16))),
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
                      onTap: null,
                      child: const Center(
                          child: Text(
                        'Esqueci minha senha',
                        style: TextStyle(fontSize: 15),
                      )),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                    const SocialButton(
                        image: AppImages.google,
                        text: "ENTRAR COM GOOGLE        "),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    const Padding(
                        padding: EdgeInsets.only(left: 20, right: 40)),
                    const SocialButton(
                        image: AppImages.microsoft,
                        text: 'ENTRAR COM MICROSOFT'),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.06,
                        child: OutlinedButton(
                          style: ButtonStyle(
                              side: MaterialStateProperty.all(
                                  const BorderSide(color: AppColors.orange)),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(16)))),
                          onPressed: () {},
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  "CADASTRAR NOVA CONTA",
                                  style: TextStyle(
                                      fontSize: 18, color: AppColors.orange),
                                  textAlign: TextAlign.center,
                                ),
                              ]),
                        )),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                  ]),
            ),
          ),
        ]),
      ),
    );
  }
}
