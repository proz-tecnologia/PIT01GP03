// WIDGET do formulário de registro de transação

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
  final _formattedDate = TextEditingController();

  

  // Variável _formData é gerada como mapa de dados de registro de transação
  final Map<String, dynamic> _formData = {};

  // Método que lê objetos do modo para gerar dados de registro de transação
  void _loadFormData(TransactionModel transactionModel) {
    _formData['id'] = transactionModel.id;
    _formData['title'] = transactionModel.title;
    _formData['ammount'] = transactionModel.ammount;
    _formData['description'] = transactionModel.description;
    _formData['date'] = transactionModel.date;
    _formData['tipo'] = transactionModel.tipo;

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
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Título inválido';
                    }

                    if (value.trim().length < 3) {
                      return 'Favor identificar o título com pelo menos 3 caracteres.';
                    }

                    return null;
                  },
                  onSaved: (value) => _formData['title'] = value,
                ),
                TextFormField(
                  initialValue: _formData['description'],
                  decoration: const InputDecoration(labelText: 'Descrição'),
                  onSaved: (value) => _formData['description'] = value,
                ),
                TextFormField(
                  initialValue: _formData['ammount'].toString(),
                  decoration: const InputDecoration(labelText: 'Valor (R\$)'),
                  keyboardType: TextInputType.number,
                  onSaved: (value) =>
                      _formData['ammount'] = double.tryParse(value!),
                ),
                TextFormField(
                  initialValue: _formData['date'].toString(),
                  decoration: const InputDecoration(
                    labelText: 'Escolha a data da transação',
                    suffixIcon: Icon(Icons.calendar_today),
                  ),
                  validator: (value) {
                    if (value == null) {
                      return 'Campo obrigatório';
                    }
                    return null;
                  },
                  readOnly: true,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                    );
                    if (pickedDate != null) {
                      String formattedDate =
                          DateFormat('d MMM y').format(pickedDate);
                      setState(() {
                        _formattedDate.text = formattedDate;
                      });
                    }
                  },
                  onSaved: (value) =>
                      _formData['date'] = DateTime.tryParse(value!),
                ),
                // TODO: IMPLEMENTAR BOTÃO SELETOR TAG DE ENTRADA E SAÍDA DE DINHEIRO
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
                description: _formData['description'],
                date: _formData['date'],
                tipo: _formData['tipo']
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
