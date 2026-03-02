import 'package:pizza_repository/src/entities/entities.dart';
import 'package:pizza_repository/src/models/models.dart';

class PizzaEntity {
  String pizzaId;
  String picture;
  String name;
  String description;
  int spicy;
  int price;
  int discount;
  bool isVeg;
  Macros macros;

  PizzaEntity({
    required this.pizzaId,
    required this.picture,
    required this.name,
    required this.description,
    required this.spicy,
    required this.isVeg,
    required this.price,
    required this.discount,
    required this.macros,
  });

  Map<String, Object?> toDocument() {
    return {
      'pizzaId': pizzaId,
      'picture': picture,
      'name': name,
      'description': description,
      'spicy': spicy,
      'isVeg': isVeg,
      'price': price,
      'discount': discount,
      'macros': macros.toEntity().toDocument(),
    };
  }

  static PizzaEntity fromDocument(Map<String, dynamic> doc) {
    return PizzaEntity(
      pizzaId: doc['pizzaId'],
      picture: doc['picture'],
      name: doc['name'],
      description: doc['description'],
      spicy: doc['spicy'],
      isVeg: doc['isVeg'],
      price: doc['price'],
      discount: doc['discount'],
      macros: Macros.fromEntity(MacrosEntity.fromDocument(doc['macros'])),
    );
  }
}
