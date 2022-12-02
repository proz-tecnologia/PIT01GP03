// WIDGET do formulário de registro de transação

import 'package:flutter/material.dart';
import 'package:projeto_flutter/controllers/custom_form_field_validator.dart';
import 'package:provider/provider.dart';

import '../../controllers/transaction_controller.dart';
import '../../models/transaction_model.dart';

class TransactionForm extends StatefulWidget {
  const TransactionForm({Key? key}) : super(key: key);

  // Rota para navegação do formulário de registro de transação
  static const routeTransactionForm = '/transaction-form';

  @override
  // Cria estado o estado do instanciamento de registro de transação
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  // Variável _formKey é gerada como chave de estado
  final _formKey = GlobalKey<FormState>();

  // Variável _formData é gerada como mapa de dados de registro de transação
  final Map<String, dynamic> _formData = {};

  // Método que lê objetos do modo para gerar dados de registro de transação
  void _loadFormData(TransactionModel transactionModel) {
    _formData['id'] = transactionModel.id;
    _formData['title'] = transactionModel.title;
    _formData['ammount'] = transactionModel.ammount;
    _formData['date'] = transactionModel.date;
    _formData['category'] = transactionModel.category;
  }

  @override
  // Método que observa a mudança de estado
  void didChangeDependencies() {
    super.didChangeDependencies();

    // Variável transaction lê os dados de registro de transação na mudança de estado
    final transaction =
        ModalRoute.of(context)?.settings.arguments as TransactionModel?;
    if (transaction != null) {
      _loadFormData(transaction);
    }
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
                  initialValue: _formData['title'],
                  decoration: const InputDecoration(labelText: 'Título'),
                  validator: CustomFormFieldValidator.validateTitle,
                  onSaved: (value) => _formData['title'] = value,
                ),

                TextFormField(
                  initialValue: _formData['ammount'] == 0
                      ? ''
                      : _formData['ammount'].toString(),
                  decoration: const InputDecoration(labelText: 'Valor (R\$)'),
                  keyboardType: TextInputType.number,
                  validator: CustomFormFieldValidator.validateNull,
                  onSaved: (value) =>
                      _formData['ammount'] = double.tryParse(value!),
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

            Provider.of<TransactionController>(context, listen: false).put(
              TransactionModel(
                id: _formData['id'],
                title: _formData['title'],
                ammount: _formData['ammount'], 
                date:DateTime.now(),
                category: _formData['category'],
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
