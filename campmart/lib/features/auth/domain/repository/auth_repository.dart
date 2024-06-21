import 'dart:io';

import 'package:campmart/core/failure/failure.dart';
import 'package:campmart/features/auth/data/repository/auth_remote_repository.dart';
import 'package:campmart/features/auth/domain/entity/auth_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repository/auth_local_repository.dart';

final authRepositoryProvider = Provider<IAuthRepository>((ref) {
  return ref.read(authRemoteRepositoryProvider);
});

abstract class IAuthRepository {
  Future<Either<Failure, bool>> registerStudent(AuthEntity student);
  Future<Either<Failure, bool>> loginStudent(String email, String password);
  //Future<Either<Failure, String>> uploadProfilePicture(File file);
  Future<Either<Failure, AuthEntity>> getCurrentUser();
}
