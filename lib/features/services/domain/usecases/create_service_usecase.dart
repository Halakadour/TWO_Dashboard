// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dartz/dartz.dart';
import 'package:two_dashboard/core/error/failures.dart';
import 'package:two_dashboard/core/usecases/use_case.dart';
import 'package:two_dashboard/features/services/domain/entities/service_entity.dart';
import 'package:two_dashboard/features/services/domain/repos/service_repo.dart';

class CreateServiceUsecase
    extends
        UseCase<Future<Either<Failure, ServiceEntity>>, CreateServiceParam> {
  final ServiceRepo serviceRepo;

  CreateServiceUsecase(this.serviceRepo);

  @override
  Future<Either<Failure, ServiceEntity>> call(CreateServiceParam param) {
    return serviceRepo.createService(
      param.token,
      param.title,
      param.description,
      param.image,
    );
  }
}

class CreateServiceParam {
  final String token;
  final String title;
  final String description;
  final String image;
  CreateServiceParam({
    required this.token,
    required this.title,
    required this.description,
    required this.image,
  });
}
