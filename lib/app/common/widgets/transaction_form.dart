
import 'package:flutter/material.dart';
import 'package:porkinio/app/common/utils/custom_form_field_validator.dart';
import 'package:porkinio/app/common/widgets/custom_form_field.dart';

class TransactionForm extends StatefulWidget {
  const TransactionForm({Key? key}) : super(key: key);

  static const routeTransactionForm = '/transaction-form';

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
//TODO CHARLESTON (DICA DO KAIO) MUDAR NAVEGAÇÃO E REFATORA TELA, CATEGORY DEVE SER ESCOLHIDO NO FORMULARIO

  final GlobalKey<FormState> _formKey = GlobalKey();
  final _titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 25,
                ),
                CustomFormField(
                  formFieldText: 'Titulo',
                  formFieldBorder: true,
                  formFieldValidator: CustomFormFieldValidator.validateNull,
                  formFieldController: _titleController,
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_formKey.currentState != null &&
              _formKey.currentState!.validate()) {
            Navigator.pop(context);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
