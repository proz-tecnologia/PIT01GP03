import 'package:flutter/material.dart';
import 'package:projeto_flutter/view/components/logo_app_bar.dart';

import '../themes/app_colors.dart';

class RecoverPasswordPage extends StatelessWidget {
  const RecoverPasswordPage({super.key});

  static const recover = '/recover';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          const LogoAppBar(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.25,
            child: Card(
              color: AppColors.lightgreen,
              margin: const EdgeInsets.symmetric(horizontal: 22),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              child: Form(
                child: ListView(
                    padding: const EdgeInsets.all(16),
                    shrinkWrap: true,
                    children: <Widget>[
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.035,
                      ),
                      const Center(
                          child: Text(
                        'Recuperar sua senha',
                        style: TextStyle(
                          fontSize: 28,
                          color: AppColors.white,
                        ),
                      )),
                      const SizedBox(
                        height: 25,
                      ),
                      TextFormField(
                        controller: null,
                        maxLines: null,
                        decoration: InputDecoration(
                          hintText: 'E-mail',
                          hintStyle: const TextStyle(color: AppColors.linear),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(70),
                              borderSide: const BorderSide(
                                  color: AppColors.linear, width: 3)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(70),
                              borderSide: const BorderSide(
                                  color: AppColors.linear, width: 2)),
                        ),
                      ),
                    ]),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.055,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.075,
            width: MediaQuery.of(context).size.width * 0.6,
            child: ElevatedButton(
              onPressed: () {},
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
        ],
      ),
    ));
  }
}
