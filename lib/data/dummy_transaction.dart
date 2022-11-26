import 'package:projeto_flutter/models/transaction_model.dart';

final dummyTransaction = {
  '1': TransactionModel(
    id: '1',
    name: 'comprar moto',
    value: 900.00,
    date:  DateTime.now(),
 //   iconUrl : 'https://imgur.com/YtXmL9b'
  ),
  '2': TransactionModel(
    id: '2',
    name: 'comprar de um carro',
    value: 10.00,
    date:  DateTime.now(),
   //iconUrl : 'https://imgur.com/YtXmL9b'
  ),
  '3': TransactionModel(
    id: '3',
    name: 'dinheiro que ganhei da minha avó',
    value: 30.00,
    date:  DateTime.now(),
   // iconUrl : 'https://imgur.com/YtXmL9b'
  ),
  
};

