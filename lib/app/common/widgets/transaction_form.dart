import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  const TransactionForm({Key? key}) : super(key: key);

  static const routeTransactionForm = '/transaction-form';

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
//TODO CHARLESTON (DICA DO KAIO) MUDAR NAVEGAÇÃO E REFATORA TELA, CATEGORY DEVE SER ESCOLHIDO NO FORMULARIO

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SingleChildScrollView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
