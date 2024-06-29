import 'dart:io';

import 'package:campmart/core/common/internet_checker/internet_connectivity.dart';
import 'package:campmart/core/failure/failure.dart';
import 'package:campmart/features/auth/data/repository/auth_remote_repository.dart';
import 'package:campmart/features/auth/domain/entity/auth_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repository/auth_local_repository.dart';

final authRepositoryProvider = Provider<IAuthRepository>((ref) {
  final checkConnectivity = ref.read(authRemoteRepositoryProvider);

  if (checkConnectivity == ConnectivityStatus.isConnected) {
    return ref.read(authRemoteRepositoryProvider);
  } else {
    return ref.read(authLocalRepositoryProvider);
  }
});

abstract class IAuthRepository {
  Future<Either<Failure, bool>> registerStudent(AuthEntity student);
  Future<Either<Failure, bool>> loginStudent(String email, String password);
  //Future<Either<Failure, String>> uploadProfilePicture(File file);
  Future<Either<Failure, AuthEntity>> getCurrentUser();
}
