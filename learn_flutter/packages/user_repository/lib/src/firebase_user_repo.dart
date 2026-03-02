import 'package:rxdart/rxdart.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:user_repository/user_repository.dart';

class FirebaseUserRepo implements UserRepository {
  final FirebaseAuth _firebaseAuth;
  final usersCollection = FirebaseFirestore.instance.collection('users');

  FirebaseUserRepo({
    FirebaseAuth? firebaseAuth,
  }) : _firebaseAuth = firebaseAuth ?? FirebaseAuth.instance;

  @override

  /// Streams the current authenticated user's data from Firestore, emitting MyUser.empty when signed out
  Stream<MyUser?> get user {
    return _firebaseAuth.authStateChanges().flatMap((firebaseUser) async* {
      if (firebaseUser == null) {
        yield MyUser.empty;
      } else {
        yield await usersCollection.doc(firebaseUser.uid).get().then((value) =>
            MyUser.fromEntity(MyUserEntity.fromDocument(value.data()!)));
      }
    });
  }

  @override

  /// Signs in a user with email and password using Firebase Authentication
  Future<void> signIn(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      throw Exception('Error signing in: $e');
    }
  }

  @override

  /// Creates a new user account with email and password, returns the user with assigned userId
  Future<MyUser> signUp(MyUser myUser, String password) async {
    try {
      UserCredential user = await _firebaseAuth.createUserWithEmailAndPassword(
          email: myUser.email, password: password);
      myUser = MyUser(
        userId: user.user!.uid,
        email: myUser.email,
        name: myUser.name,
        hasActiveCart: myUser.hasActiveCart,
      );
      return myUser;
    } catch (e) {
      throw Exception('Error signing up: $e');
    }
  }

  @override

  /// Signs out the current authenticated user from Firebase
  Future<void> logOut() async {
    await _firebaseAuth.signOut();
  }

  @override

  /// Stores or updates user data in Firestore users collection
  Future<void> setUserData(MyUser myUser) async {
    try {
      await usersCollection
          .doc(myUser.userId)
          .set(myUser.toEntity().toDocument());
    } catch (e) {
      throw Exception('Error setting user data: $e');
    }
  }
}
