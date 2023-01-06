import 'package:cloud_firestore/cloud_firestore.dart';
class TransactionModel {
  String? id;
  String? userId;
  final String title;
  final double ammount;
  final DateTime date;
  final bool category;

  TransactionModel({
    this.id = '',
    this.userId = '',
    required this.title,
    required this.ammount,
    required this.date,
    required this.category,
  });

  TransactionModel copyWith({
    String? id,
    String? userId,
    String? title,
    double? ammount,
    DateTime? date,
    bool? category,
  }) {
    return TransactionModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      ammount: ammount ?? this.ammount,
      date: date ?? this.date,
      category: category ?? this.category,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'userId':userId,
      'title': title,
      'ammount': ammount, 
      'date': date,
      'category': category,
    };
  }

  factory TransactionModel.fromMap(String id, Map<String, dynamic> map) {
    return TransactionModel(
      id: map['id'] as String,
      userId: map['userId'] as String,
      title: map['title'] as String,
      ammount: map['ammount'] as double,
      date: map['date'],
      category: map['category'] as bool,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'userId': userId,
        'title': title,
        'ammount': ammount.toDouble(),
        'date': date,
        'category': category,
      };

  static TransactionModel fromJson(Map<String, dynamic> json) =>
      TransactionModel(
        id: json['id'],
        userId: json['userId'],
        title: json['title'],
        ammount: (json['ammount']),
        date: (json['date'] as Timestamp).toDate(),
        category: json['category'],
      );
}