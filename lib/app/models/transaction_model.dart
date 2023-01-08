import 'package:cloud_firestore/cloud_firestore.dart';

class TransactionModel {
  String? id;
  String? userId;
  final String title;
  final double amount;
  final DateTime date;
  final bool category;

  TransactionModel({
    this.id = '',
    this.userId = '',
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  });

  TransactionModel copyWith({
    String? id,
    String? userId,
    String? title,
    double? amount,
    DateTime? date,
    bool? category,
  }) {
    return TransactionModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      amount: amount ?? this.amount,
      date: date ?? this.date,
      category: category ?? this.category,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'userId': userId,
      'title': title,
      'amount': amount.toDouble(),
      'date': date,
      'category': category,
    };
  }

  factory TransactionModel.fromMap(String id, Map<String, dynamic> map) {
    return TransactionModel(
      id: map['id'] as String,
      userId: map['userId'] as String,
      title: map['title'] as String,
      amount: map['amount'] as double,
      date: map['date'] as DateTime,
      category: map['category'] as bool,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'userId': userId,
        'title': title,
        'amount': amount.toDouble(),
        'date': date,
        'category': category,
      };

  static TransactionModel fromJson(Map<String, dynamic> json) =>
      TransactionModel(
        id: json['id'],
        userId: json['userId'],
        title: json['title'] as String,
        amount: json['amount'] as double,
        date: (json['date'] as Timestamp).toDate(),
        category: json['category'] as bool,
      );
}
