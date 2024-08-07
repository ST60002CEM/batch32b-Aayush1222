import 'dart:io';

import 'package:campmart/core/failure/failure.dart';
import 'package:campmart/features/auth/data/data_source/remote/auth_remote_data_source.dart';
import 'package:campmart/features/auth/domain/entity/auth_entity.dart';
import 'package:campmart/features/auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRemoteRepositoryProvider = Provider<IAuthRepository>((ref) {
  return AuthRemoteRepository(
    ref.read(authRemoteDataSourceProvider),
  );
});

class AuthRemoteRepository implements IAuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;
  AuthRemoteRepository(this._authRemoteDataSource);

  @override
  Future<Either<Failure, String>> uploadProfilePicture(File file) {
    return _authRemoteDataSource.uploadProfilePicture(file);
  }

  @override
  Future<Either<Failure, bool>> loginStudent(String email, String password) {
    return _authRemoteDataSource.loginStudent(email, password);
  }

  @override
  Future<Either<Failure, bool>> registerStudent(AuthEntity student) {
    return _authRemoteDataSource.registerStudent(student);
  }

  @override
  Future<Either<Failure, AuthEntity>> getCurrentUser() {
   return _authRemoteDataSource.getCurrentUser();
  }
}
