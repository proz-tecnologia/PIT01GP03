// Modelo de lista de transação:
// Recebe um "id" em forma de String, nulável
// Recebe um "title" título da transação em forma de String, requerido
// Recebe um "description" descrição em forma de String, nulável
// Recebe um "ammount" quantia/montante em forma de double, requerido
// Recebe um "tag" imagem de categoria em forma de String, requerido

class TransactionModel {
  final String? id;
  final String title;
  final String? description;
  final double ammount;
  final DateTime date;
  final String tag =
      'https://cdn.pixabay.com/photo/2014/04/03/10/32/user-310807__340.png';
      // TODO: PRECISA IMPLEMENTAR, SERÁ O NOSSO ICONE CORRESPONDENTE

  const TransactionModel({
    this.id,
    required this.title,
    this.description,
    required this.ammount,
    required this.date,
  });
}
