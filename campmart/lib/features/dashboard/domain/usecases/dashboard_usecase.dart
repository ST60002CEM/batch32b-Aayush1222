import 'package:campmart/core/failure/post_failure.dart';
import 'package:campmart/features/dashboard/domain/entity/dashboard_entity.dart';
import 'package:campmart/features/dashboard/domain/repository/dashboard_repository.dart';
import 'package:dartz/dartz.dart';


class DashboardUsecase {
  final IDashboardRepository dashboardRepository;

  DashboardUsecase({required this.dashboardRepository});

  Future<Either<PostFailure, List<DashboardEntity>>> getAllPosts(int page) {
    return dashboardRepository.getAllPosts(page);
  }
}
