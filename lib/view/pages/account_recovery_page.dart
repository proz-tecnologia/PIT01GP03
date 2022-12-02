import 'package:flutter/material.dart';
import 'package:porkinio/view/components/custom_form_field.dart';
import 'package:porkinio/view/components/header_logo.dart';
import 'package:porkinio/view/themes/app_colors.dart';

class AccountRecoveryPage extends StatelessWidget {
  const AccountRecoveryPage({super.key});

  static const routeAccountRecoveryPage = '/account-recovery-page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeaderLogo(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              child: Card(
                color: AppColors.lightgreen,
                margin: const EdgeInsets.symmetric(horizontal: 22),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Form(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04,
                        ),
                        const Center(
                          child: Text(
                            'Recuperar sua senha',
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
                          formFieldText: "E-mail",
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.06,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width * 0.6,
              child: ElevatedButton(
                onPressed: () {},
                // TODO: PAULO: IMPLENTAR COMPORTAMENTO, POR EXEMPLO, UM SHOW DIALOG COM UMA MENSAGEM DE "FOI ENVIADO E-MAIL DE RECUPERAÇÃO DE SENHA, VERIFIQUE SUA CAIXA DE ENTRADA"
                // TODO: PAULO: COMPONENTIZAR BOTÃO E AJUSTAR LAYOUT
                style: ButtonStyle(
                  shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16))),
                  backgroundColor:
                      const MaterialStatePropertyAll(AppColors.green),
                ),
                child: const Text(
                  'RECUPERAR',
                  style: TextStyle(fontSize: 25, color: AppColors.linear),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
          ],
        ),
      ),
    );
  }
}
