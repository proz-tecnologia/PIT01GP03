import 'package:flutter/material.dart';
import 'package:porkinio/app/common/utils/custom_form_field_validator.dart';
import 'package:porkinio/controllers/transaction_controller.dart';
import 'package:porkinio/app/models/transaction_model.dart';

class TransactionForm extends StatefulWidget {
  const TransactionForm({Key? key}) : super(key: key);

  static const routeTransactionForm = '/transaction-form';

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _formKey = GlobalKey<FormState>();


//TODO CHARLESTON (DICA DO KAIO) MUDAR NAVEGAÇÃO E REFATORA TELA, CATEGORY DEVE SER ESCOLHIDO NO FORMULARIO  

  bool? category;
  TransactionController? transactionController;
  TransactionModel? transactionModel;

  double valor = 0;
  String titulo = '';

  @override
  void didChangeDependencies() {
    final args =
            ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
        category = args['category'] as bool;
        transactionController = args['controller'] as TransactionController;
        transactionModel = args['transactionModel'];
    super.didChangeDependencies();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: (MediaQuery.of(context).size.height * 0.08),
                ),
                TextFormField(
                  initialValue: transactionModel == null
                      ? titulo
                      : transactionModel?.title,
                  decoration: const InputDecoration(labelText: 'Título'),
                  validator: CustomFormFieldValidator.validateTitle,
                  onChanged: (value) {
                    titulo = value;
                  },
                ),
                TextFormField(
                  initialValue: transactionModel == null
                      ? ''
                      : transactionModel?.ammount.toString(),
                  decoration: const InputDecoration(labelText: 'Valor (R\$)'),
                  keyboardType: TextInputType.number,
                  validator: CustomFormFieldValidator.validateNull,
                  onChanged: (value) {
                    valor = double.tryParse(value) ?? valor;
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final isValid = _formKey.currentState!.validate();
          if (isValid) {
            _formKey.currentState!.save();
            transactionController?.put(
              TransactionModel(
                title: titulo,
                ammount: valor,
                date: DateTime.now(),
                category: category,
              ),
            );
            Navigator.of(context).pop();
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
