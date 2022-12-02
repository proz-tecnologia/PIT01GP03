import 'package:flutter/material.dart';
import 'package:porkinio/controllers/custom_form_field_validator.dart';
import 'package:porkinio/controllers/transaction_controller.dart';
import 'package:porkinio/models/transaction_model.dart';
import 'package:provider/provider.dart';

class TransactionForm extends StatefulWidget {
  const TransactionForm({Key? key}) : super(key: key);

  static const routeTransactionForm = '/transaction-form';

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _formKey = GlobalKey<FormState>();

  final _transactionController = TransactionController();

  final Map<String, dynamic> _formData = {};

  void _loadFormData(TransactionModel transactionModel) {
    _formData['id'] = transactionModel.id;
    _formData['title'] = transactionModel.title;
    _formData['ammount'] = transactionModel.ammount;
    _formData['date'] = transactionModel.date;
    _formData['category'] = transactionModel.category;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

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
                date: DateTime.now(),
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
