class VirtualWalletModel {
  String? id;
  String? userId;
  double? balance;
  double? income;
  double? expenses;

  VirtualWalletModel({
    this.id = '',
    this.userId = '',
     this.balance,
     this.income,
     this.expenses,
  });

  VirtualWalletModel copyWith({
    String? id,
    String? userId,
    double? balance,
    double? income,
    double? expenses,
  }) {
    return VirtualWalletModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      balance: balance ?? this.balance,
      income: income ?? this.income,
      expenses: expenses ?? this.expenses,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'userId': userId,
      'balance': balance?.toDouble(),
      'income': income?.toDouble(),
      'expenses': expenses?.toDouble(),
    };
  }

  factory VirtualWalletModel.fromMap(String id, Map<String, dynamic> map) {
    return VirtualWalletModel(
      id: map['id'] as String,
      userId: map['userId'] as String,
      balance: map['balance'] as double,
      income: map['income'] as double,
      expenses: map['expenses'] as double,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'userId': userId,
        'balance': balance?.toDouble(),
        'income': income?.toDouble(),
        'expenses': expenses?.toDouble(),
      };

  static VirtualWalletModel fromJson(Map<String, dynamic> json) => VirtualWalletModel(
        id: json['id'],
        userId: json['userId'],
        balance: json['balance'] as double,
        income: json['income'] as double,
        expenses: json['expenses'] as double,
      );
}
