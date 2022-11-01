import 'package:flutter/material.dart';

import '../themes/app_colors.dart';
import 'components/formfield_register.dart';
import 'components/logo_appbar.dart';
import 'home_page.dart';


class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  static const signUp = '/signUp';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const LogoAppBar(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.035,
            ),
            Card(
              color: AppColors.lightgreen,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child: Form(
                child: ListView(
                    padding: const EdgeInsets.all(16),
                    shrinkWrap: true,
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
                      )),
                      const SizedBox(
                        height: 25,
                      ),
                      const FormRegister(textRegister: 'Nome completo'),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      const FormRegister(textRegister: 'E-mail'),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      const FormRegister(textRegister: 'Senha'),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      const FormRegister(textRegister: 'Confirme sua senha'),
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
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.022,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.075,
              width: MediaQuery.of(context).size.width * 0.6,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed(HomePage.home);
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
          ],
        ),
      ),
    );
  }
}
