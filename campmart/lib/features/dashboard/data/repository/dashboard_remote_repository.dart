import 'package:campmart/core/failure/post_failure.dart';
import 'package:campmart/features/dashboard/data/data_source/dashboard_remote_data_source.dart';
import 'package:dartz/dartz.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final dashboardRemoteRepositoryProvider = Provider<IDashboardRepository>(
  (ref) => DashboardRemoteRepository(
    dashboardRemoteDataSource: ref.read(dashboardRemoteDataSourceProvider),
  ),
);

class DashboardRemoteRepository implements IDashboardRepository {
  final DashboardRemoteDataSource dashboardRemoteDataSource;

  DashboardRemoteRepository({required this.dashboardRemoteDataSource});

  @override
  Future<Either<PostFailure, List<DashboardEntity>>> getAllPosts(int page) {
    return dashboardRemoteDataSource.getAllPosts(page);
  }
}
