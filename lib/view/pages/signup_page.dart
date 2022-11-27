import 'package:flutter/material.dart';
import 'package:projeto_flutter/view/components/password_form_field.dart';
import 'package:projeto_flutter/view/components/header_logo.dart';
import '../themes/app_colors.dart';
import '../components/custom_form_field.dart';
import 'home_page.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  static const routeSignUpPage = '/sign-up-page';

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
                    const CustomFormField(customFormField: 'Nome completo'),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    const CustomFormField(customFormField: 'E-mail'),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    const PasswordFormField(passwordFormField: 'Senha'),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    const PasswordFormField(
                        passwordFormField: 'Confirme sua senha'),
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
                  Navigator.of(context)
                      .pushReplacementNamed(HomePage.routeHomePage);
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
