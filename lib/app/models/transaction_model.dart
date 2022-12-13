
class TransactionModel {
  final String? id;
  final String title;
  final double ammount;
  final DateTime date;
  final bool? category;

  const TransactionModel({
    this.id,
    required this.title,
    required this.ammount,
    required this.date,
    this.category,
  });

}
