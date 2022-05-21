import 'dart:ui';


enum Importance {
  LOW,
  MEDIUM,
  HIGH,
}


class GroceryItem {

  final String id;
  final String name;
  final Importance importance;
  final Color color;
  final int quantity;
  final DateTime date;
  final bool isComplete;
  final String payment;

  GroceryItem({
    required this.id,
    required this.name,
    required this.importance,
    required this.color,
    required this.quantity,
    required this.date,
    this.isComplete = false,
    required this.payment,
  });

  GroceryItem copyWith({
    String? id,
    String? name,
    Importance? importance,
    Color? color,
    int? quantity,
    DateTime? date,
    bool? isComplete,
    String? payment,
  }) {
    return GroceryItem(
      id: id ?? this.id,
      name: name ?? this.name,
      importance: importance ?? this.importance,
      color: color ?? this.color,
      quantity: quantity ?? this.quantity,
      date: date ?? this.date,
      isComplete: isComplete ?? this.isComplete,
      payment: payment ?? this.payment,
    );
  }
}
