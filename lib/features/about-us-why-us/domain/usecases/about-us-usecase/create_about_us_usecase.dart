import 'package:dartz/dartz.dart';
import 'package:two_dashboard/core/error/failures.dart';
import 'package:two_dashboard/core/usecases/use_case.dart';
import 'package:two_dashboard/features/about-us-why-us/domain/entities/about_us_entity.dart';
import 'package:two_dashboard/features/about-us-why-us/domain/repos/about_us_repo.dart';

class CreateAboutUsUsecase
    extends
        UseCase<Future<Either<Failure, AboutUsEntity>>, CreateAboutUsParam> {
  final AboutUsRepo aboutUsRepo;

  CreateAboutUsUsecase(this.aboutUsRepo);

  @override
  Future<Either<Failure, AboutUsEntity>> call(CreateAboutUsParam param) {
    return aboutUsRepo.createAboutUs(param.token, param.workTime, param.site);
  }
}

class CreateAboutUsParam {
  final String token;
  final String workTime;
  final String site;

  CreateAboutUsParam({
    required this.token,
    required this.workTime,
    required this.site,
  });
}
