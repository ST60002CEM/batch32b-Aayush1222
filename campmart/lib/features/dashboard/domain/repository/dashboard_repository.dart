import 'package:campmart/core/failure/post_failure.dart';
import 'package:campmart/features/dashboard/data/repository/dashboard_remote_repository.dart';
import 'package:campmart/features/dashboard/domain/entity/dashboard_entity.dart';
import 'package:dartz/dartz.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final dashboardRepositoryProvider = Provider<IDashboardRepository>(
  (ref) => ref.read(dashboardRemoteRepositoryProvider),
);

abstract class IDashboardRepository {
  Future<Either<PostFailure, List<DashboardEntity>>> getAllPosts(int page);
}
