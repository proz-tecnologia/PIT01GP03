class GoalsCardModel {
  String? id;
  String? userId;
  double amount;
  String title;
  String networkImage;

  GoalsCardModel({
    this.id = '',
    this.userId = '',
    required this.amount,
    required this.title,
    required this.networkImage,
  });

  GoalsCardModel copyWith({
    String? id,
    String? userId,
    double? amount,
    String? title,
    String? networkImage,
  }) {
    return GoalsCardModel(
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

  factory GoalsCardModel.fromMap(String id, Map<String, dynamic> map) {
    return GoalsCardModel(
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

  static GoalsCardModel fromJson(Map<String, dynamic> json) =>
      GoalsCardModel(
        id: json['id'],
        userId: json['userId'],
        amount: json['amount'] as double,
        title: json['title'] as String,
        networkImage: json['networkImage'] as String,
      );
}
