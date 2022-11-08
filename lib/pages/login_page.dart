import 'package:flutter/material.dart';

import '../themes/app_colors.dart';
import '../themes/app_images.dart';
import 'components/buttons.dart';
import 'components/logo_appbar.dart';
import 'home_page.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static const login = '/login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          const LogoAppBar(),
          SizedBox(height: (MediaQuery.of(context).size.height) * 0.03),
          Form(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                  // shrinkWrap: true,   // verifica se listview tem tamanho min
                  children: <Widget>[
                    TextFormField(
                      controller: null,
                      maxLines: null,
                      decoration: InputDecoration(
                        focusColor: AppColors.green,
                        hintText: 'E-MAIL',
                        hintStyle: const TextStyle(color: AppColors.green),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(70),
                            borderSide: const BorderSide(
                                color: AppColors.lightgreen, width: 3)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(70),
                            borderSide: const BorderSide(
                                color: AppColors.green, width: 2)),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(
                        height: (MediaQuery.of(context).size.height) * 0.03),
                    TextFormField(
                      controller: null,
                      maxLines: null,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.visibility_off,
                              color: AppColors.green),
                        ),
                        hintText: 'SENHA',
                        hintStyle: const TextStyle(color: AppColors.green),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(70),
                            borderSide: const BorderSide(
                                color: AppColors.lightgreen, width: 3)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(70),
                            borderSide: const BorderSide(
                                color: AppColors.green, width: 2)),
                      ),
                      keyboardType: TextInputType.visiblePassword,
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.045),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.075,
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacementNamed(HomePage.home);
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
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    const SocialButton(
                        image: AppImages.google,
                        text: "ENTRAR COM GOOGLE        "),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.025),
                    const Padding(
                        padding: EdgeInsets.only(left: 20, right: 40)),
                    const SocialButton(
                        image: AppImages.microsoft,
                        text: 'ENTRAR COM MICROSOFT'),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.025),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.075,
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
                  ]),
            ),
          ),
        ]),
      ),
    );
  }
}