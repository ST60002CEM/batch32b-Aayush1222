import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  final String? id;
  final String name;
  final String username;
  final String email;
  final String password;

  const AuthEntity({
    this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.password, 
  });

  @override
  List<Object?> get props => [id, name, username, email, password];
}
