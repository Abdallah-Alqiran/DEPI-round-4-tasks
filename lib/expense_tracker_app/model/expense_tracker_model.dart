class ExpenseTrackerModel {
  final String? id;
  final String name;
  final String amount;
  final String date;

  ExpenseTrackerModel({
    this.id,
    required this.name,
    required this.amount,
    required this.date,
  });

  factory ExpenseTrackerModel.fromJson(Map<String, dynamic> json) {
    return ExpenseTrackerModel(id: json['id'], name: json['name'],amount: json['amount'], date: json['date']);
  }

  Map<String, dynamic> toJson() => {
    'id': DateTime.now().toString(),
    'name': name,
    'amount': amount,
    'date': date
  };
}