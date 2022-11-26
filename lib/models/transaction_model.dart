// ignore_for_file: public_member_api_docs, sort_constructors_first
class TransactionModel {
  final String? id;
  final String name;
  final double value;
  final DateTime date;
  final String? iconUrl = 'https://imgur.com/YtXmL9b'  ;

  TransactionModel({
    this.id,
    required this.name,
    required this.value,
    required this.date,
  });
}
