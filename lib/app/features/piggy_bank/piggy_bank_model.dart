class PiggyBankModel {
  String? id;
  String? userId;
  double amount;
  String title;
  String networkImage;

  PiggyBankModel({
    this.id = '',
    this.userId = '',
    required this.amount,
    required this.title,
    required this.networkImage,
  });

  PiggyBankModel copyWith({
    String? id,
    String? userId,
    double? amount,
    String? title,
    String? networkImage,
  }) {
    return PiggyBankModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      amount: amount ?? this.amount,
      title: title ?? this.title,
      networkImage: networkImage ?? this.networkImage,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'userId': userId,
      'amount': amount.toDouble(),
      'title': title,
      'networkImage': networkImage,
    };
  }

  factory PiggyBankModel.fromMap(String id, Map<String, dynamic> map) {
    return PiggyBankModel(
      id: map['id'] as String,
      userId: map['userId'] as String,
      amount: map['amount'] as double,
      title: map['title'] as String,
      networkImage: map['networkImage'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'userId': userId,
        'amount': amount.toDouble(),
        'title': title,
        'networkImage': networkImage,
      };

  static PiggyBankModel fromJson(Map<String, dynamic> json) => PiggyBankModel(
        id: json['id'],
        userId: json['userId'],
        amount: json['amount'] as double,
        title: json['title'] as String,
        networkImage: json['networkImage'] as String,
      );
}
