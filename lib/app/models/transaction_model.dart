import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class TransactionModel {
  final String? id;
  final String title;
  final double ammount;
  final DateTime date;
  final bool category;
  final String userID;
  
  TransactionModel({
    this.id,
    required this.title,
    required this.ammount,
    required this.date,
    required this.category,
    required this.userID,
  });



  TransactionModel copyWith({
    String? id,
    String? title,
    double? ammount,
    DateTime? date,
    bool? category,
    String? userID,
  }) {
    
    return TransactionModel(
      id: id ?? this.id,
      title: title ?? this.title,
      ammount: ammount ?? this.ammount,
      date: date ?? this.date,
      category: category ?? this.category,
      userID: userID ?? this.userID,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{   
      'title': title,
      'ammount': ammount,
      'date': date.millisecondsSinceEpoch,
      'category': category,
      'userID': userID,
    };
  }

  factory TransactionModel.fromMap(Map<String, dynamic> map) {
    return TransactionModel(
      id: map['id'] != null ? map['id'] as String : null,
      title: map['title'] as String,
      ammount: map['ammount'] as double,
      date: DateTime.fromMillisecondsSinceEpoch(map['date'] as int),
      category: map['category'] as bool,
      userID: map['userID'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TransactionModel.fromJson(String source) => TransactionModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'TransactionModel(id: $id, title: $title, ammount: $ammount, date: $date, category: $category, userID: $userID)';
  }

  @override
  bool operator ==(covariant TransactionModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.title == title &&
      other.ammount == ammount &&
      other.date == date &&
      other.category == category &&
      other.userID == userID;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      title.hashCode ^
      ammount.hashCode ^
      date.hashCode ^
      category.hashCode ^
      userID.hashCode;
  }
}
