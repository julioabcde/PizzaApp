import 'package:equatable/equatable.dart';
import 'package:user_repository/src/entities/entities.dart';

class MyUser extends Equatable {
  final String userId;
  final String email;
  // String password;
  final String name;
  final bool hasActiveCart;

  const MyUser({
    required this.userId,
    required this.email,
    // required this.password,
    required this.name,
    required this.hasActiveCart,
  });

  static const empty = MyUser(
    userId: '',
    email: '',
    // password: '',
    name: '',
    hasActiveCart: false,
  );

  MyUserEntity toEntity() {
    return MyUserEntity(
      userId: userId,
      email: email,
      // password: password,
      name: name,
      hasActiveCart: hasActiveCart,
    );
  }

  static MyUser fromEntity(MyUserEntity entity) {
    return MyUser(
      userId: entity.userId,
      email: entity.email,
      // password: entity.password,
      name: entity.name,
      hasActiveCart: entity.hasActiveCart,
    );
  }

  @override
  String toString() {
    return 'MyUser: $userId, $email, $name, $hasActiveCart';
  }

  @override
  List<Object?> get props => [userId, email, name, hasActiveCart];
}
