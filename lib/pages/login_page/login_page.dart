import 'package:flutter/material.dart';
import 'package:projeto_flutter/pages/components/logo_appBar.dart';
import 'package:projeto_flutter/pages/my_home_page/my_home_page.dart';
import 'package:projeto_flutter/themes/app_colors.dart';
import 'package:projeto_flutter/themes/app_images.dart';

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
                          hintText: 'E-MAIL',
                          hintStyle: const TextStyle(color: AppColors.green),
                          enabledBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2, color: AppColors.green)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(70),
                          )),
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
                          enabledBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2, color: AppColors.green)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(70),
                          )),
                      keyboardType: TextInputType.visiblePassword,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.06),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.075,
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacementNamed(MyHomePage.myHome);
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
                      height: (MediaQuery.of(context).size.height * 0.025),
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
                              children: [
                                Image.asset(
                                  AppImages.google,
                                  color: AppColors.orange,
                                  height: 24,
                                  alignment: AlignmentDirectional.centerStart,
                                ),
                                const Padding(
                                    padding: EdgeInsets.only(left: 50),
                                    child: Text(
                                      "ENTRAR COM GOOGLE",
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: AppColors.orange),
                                      textAlign: TextAlign.center,
                                    )),
                              ]),
                        )),
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
