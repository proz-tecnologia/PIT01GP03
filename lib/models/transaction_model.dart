// Modelo de lista de transação:
// Recebe um "id" em forma de String, nulável
// Recebe um "title" título da transação em forma de String, requerido
// Recebe um "description" descrição em forma de String, nulável
// Recebe um "ammount" quantia/montante em forma de double, requerido
// Recebe um "tag" imagem de categoria em forma de String, requerido
// Recebe um "category" categoria de transação em forma de booleano, nulável, onde TRUE é dinheiro recebido e FALSE é dinheiro gasto

class TransactionModel {
  final String? id;
  final String title;
  final String? description;
  final double ammount;
  final DateTime date;
  final bool? category;
  // TODO: PAULO: PRECISA IMPLEMENTAR, SERÁ O NOSSO ICONE CORRESPONDENTE
  // TODO: PAULO: RESTAURAR TAG DA ULTIMA COMMIT

  const TransactionModel({
    this.id,
    required this.title,
    this.description,
    required this.ammount,
    required this.date,
    this.category,
  });
}
