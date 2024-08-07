import 'dart:io';

import 'package:campmart/core/failure/failure.dart';
import 'package:campmart/features/auth/data/data_source/local/auth_local_data_source.dart';
import 'package:campmart/features/auth/domain/entity/auth_entity.dart';
import 'package:campmart/features/auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authLocalRepositoryProvider = Provider<IAuthRepository>((ref) {
  return AuthLocalRepository(
    ref.read(authLocalDataSourceProvider),
  );
});

class AuthLocalRepository implements IAuthRepository {
  final AuthLocalDataSource _authLocalDataSource;

  AuthLocalRepository(this._authLocalDataSource);

  @override
  Future<Either<Failure, bool>> loginStudent(String email, String password) {
    return _authLocalDataSource.loginStudent(email, password);
  }

  @override
  Future<Either<Failure, bool>> registerStudent(AuthEntity student) {
    return _authLocalDataSource.registerStudent(student);
  }

  @override
  Future<Either<Failure, String>> uploadProfilePicture(File file) async {
    return const Right("");
  }
  
  @override
  Future<Either<Failure, AuthEntity>> getCurrentUser() {
    // TODO: implement getCurrentUser
    throw UnimplementedError();
  }
}
