import 'TabItem.dart';

// PurchaseModel class definition
class PurchaseModel {
  final Pages type;
  final double price;
  final DateTime date;
  final String randomNum;

  // Constructor for PurchaseModel
  PurchaseModel({
    required this.type,
    required this.price,
    required this.date,
    required this.randomNum,
  });

  // Factory method to create a PurchaseModel from a Map
  factory PurchaseModel.fromMap(Map<String, dynamic> map) {
    return PurchaseModel(
      type: map['type'] != null ? Pages.values[map['type']] : Pages.all,
      price: map['price'] ?? 0.0,
      date: map['date'] != null ? DateTime.parse(map['date']) : DateTime.now(),
      randomNum: map['randomNum'] ?? '',
    );
  }

  // Method to convert PurchaseModel to a Map
  Map<String, dynamic> toMap() {
    return {
      'type': type.index,
      'price': price,
      'date': date.toIso8601String(),
      'randomNum': randomNum,
    };
  }
}
