import 'package:flutter/material.dart';
import 'package:porkinio/controllers/custom_form_field_validator.dart';
import 'package:porkinio/controllers/transaction_controller.dart';
import 'package:porkinio/models/transaction_model.dart';

class TransactionForm extends StatefulWidget {
  const TransactionForm({Key? key}) : super(key: key);

  static const routeTransactionForm = '/transaction-form';

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _formKey = GlobalKey<FormState>();

  final Map<String, dynamic> _formData = {};

  late final bool category;
  late final TransactionController transactionController;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        final args =
            ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
        category = args['category'] as bool;
        transactionController = args['controller'] as TransactionController;
      },
    );
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
                  initialValue: '',
                  decoration: const InputDecoration(labelText: 'Título'),
                  validator: CustomFormFieldValidator.validateTitle,
                  onSaved: (value) => _formData['title'] = value,
                ),
                TextFormField(
                  initialValue: _formData['ammount'] == null
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
            transactionController.put(
              TransactionModel(
                title: _formData['title'],
                ammount: _formData['ammount'],
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
