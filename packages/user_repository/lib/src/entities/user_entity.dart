class MyUserEntity{
  String userId;
  String email;
  // String password;
  String name;
  bool hasActiveCart;

  MyUserEntity({
    required this.userId,
    required this.email,
    // required this.password,
    required this.name,
    required this.hasActiveCart,
  });

  Map<String, Object> toDocument(){
    return {
      'userId': userId,
      'email': email,
      // 'password': password,
      'name': name,
      'hasActiveCart': hasActiveCart,
    }
  }
}