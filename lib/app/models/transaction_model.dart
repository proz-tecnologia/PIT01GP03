import 'package:cloud_firestore/cloud_firestore.dart';
class TransactionModel {
  String? id;
  final String title;
  final double ammount;
  final DateTime date;
  final bool category;

  TransactionModel({
    this.id = '',
    required this.title,
    required this.ammount,
    required this.date,
    required this.category,
  });

  TransactionModel copyWith({
    String? id,
    String? title,
    double? ammount,
    DateTime? date,
    bool? category,
  }) {
    return TransactionModel(
      id: id ?? this.id,
      title: title ?? this.title,
      ammount: ammount ?? this.ammount,
      date: date ?? this.date,
      category: category ?? this.category,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'ammount': ammount, 
      'date': date.millisecondsSinceEpoch,
      'category': category,
    };
  }

  factory TransactionModel.fromMap(String id, Map<String, dynamic> map) {
    return TransactionModel(
      id: map['id'] as String,
      title: map['title'] as String,
      ammount: map['ammount'] as double,
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
      category: map['category'] as bool,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'ammount': ammount.toDouble(),
        'date': date,
        'category': category,
      };

  static TransactionModel fromJson(Map<String, dynamic> json) =>
      TransactionModel(
        id: json['id'],
        title: json['title'],
        ammount: (json['ammount']),
        date: (json['date'] as Timestamp).toDate(),
        category: json['category'],
      );
}