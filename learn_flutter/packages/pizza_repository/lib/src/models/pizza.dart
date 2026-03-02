import 'package:pizza_repository/src/entities/entities.dart';
import 'package:pizza_repository/src/models/models.dart';

class Pizza {
  String pizzaId;
  String picture;
  String name;
  String description;
  int spicy;
  int price;
  int discount;
  bool isVeg;
  Macros macros;

  Pizza({
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

  PizzaEntity toEntity() {
    return PizzaEntity(
      pizzaId: pizzaId,
      picture: picture,
      name: name,
      description: description,
      spicy: spicy,
      isVeg: isVeg,
      price: price,
      discount: discount,
      macros: macros,
    );
  }

  static Pizza fromEntity(PizzaEntity entity) {
    return Pizza(
      pizzaId: entity.pizzaId,
      picture: entity.picture,
      name: entity.name,
      description: entity.description,
      spicy: entity.spicy,
      isVeg: entity.isVeg,
      price: entity.price,
      discount: entity.discount,
      macros: entity.macros,
    );
  }
}
