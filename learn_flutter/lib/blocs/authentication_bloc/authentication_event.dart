// ignore_for_file: override_on_non_overriding_member

part of 'authentication_bloc.dart';

@immutable
sealed class AuthenticationEvent {}

class AuthenticationUserChanged extends AuthenticationEvent {
  final MyUser? user;

  AuthenticationUserChanged(this.user);
}
