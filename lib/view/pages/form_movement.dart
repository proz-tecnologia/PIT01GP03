// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:projeto_flutter/controllers/movement_controller.dart';


class FormMovement extends StatelessWidget {
  FormMovement({
    Key? key,
  }) : super(key: key);

  static const formMovement = '/formMovement';
  final _form = GlobalKey<FormState>();

  final movementControllers = MovementController();
  final _movementFormDescrition = TextEditingController();
  final _movementFormValor = TextEditingController();

  //final movementModel = MovementController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Formulário add movimentações"),
        actions: [
          IconButton(
              onPressed: () {
                final isValid = _form.currentState!.validate();

                if (isValid) {
                  _form.currentState!.save();


                  Navigator.of(context).pop();
                }
              },
              icon: const Icon(Icons.save))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Form(
          key: _form,
          child: Column(
            children: [
              TextFormField(
                  controller: _movementFormDescrition,
                  decoration: const InputDecoration(labelText: 'Descrição'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Descrição obrigatoria';
                    }
                    return null;
                  }

                  //onSaved: (value) => _movementForm['description'] = value!
                  ),
              TextFormField(
                  controller: _movementFormValor,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Valor'),
                  validator: (value) {
                    if (value == null || value.toString().isEmpty) {
                      return 'Valor obrigatoria';
                    }
                    return null;
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
