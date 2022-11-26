import '../models/transaction_model.dart';

final Map<String, TransactionModel> dummyTransactions = {
  '1': TransactionModel(
    id: '1',
    title: 'Lanchonete',
    description: 'Lanche da Escola',
    date: DateTime.now(),
    ammount: 100.00,
  ),
  '2': TransactionModel(
    id: '2',
    title: 'Depósito',
    description: 'Mesada da vovó',
    date: DateTime.now(),
    ammount: 200.00,
  ),
  '3': TransactionModel(
    id: '3',
    title: 'Riachuelo',
    description: 'Vestido',
    date: DateTime.now(),
    ammount: 300.00,
  ),
  '4': TransactionModel(
    id: '4',
    title: 'Escola',
    description: 'Mensalidade',
    date: DateTime.now(),
    ammount: 400.00,
  ),
  '5': TransactionModel(
    id: '5',
    title: 'Inglês',
    description: 'Curso de Inglês',
    date: DateTime.now(),
    ammount: 500.00,
  ),
};
