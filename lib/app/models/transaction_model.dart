// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

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
      'title': title,
      'ammount': ammount,
      'date': date,
      'category': category,
    };
  }

  factory TransactionModel.fromMap(Map<String, dynamic> map) {
    return TransactionModel(
      title: map['title'] as String,
      ammount: map['ammount'] as double,
      date: map['date'] as DateTime,
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
