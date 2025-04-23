import 'package:dartz/dartz.dart';
import 'package:two_dashboard/core/error/failures.dart';
import 'package:two_dashboard/core/error/handling_exception_manager.dart';
import 'package:two_dashboard/features/about-us-why-us/domain/entities/why_us_entity.dart';

abstract class WhyUsRepo with HandlingExceptionManager {
  Future<Either<Failure, List<WhyUsEntity>>> showWhyUs();
  Future<Either<Failure, WhyUsEntity>> createWhyUs(String token, String whyUs);
  Future<Either<Failure, Unit>> updateWhyUs(
    String token,
    int whyUsId,
    String whyUs,
  );
  Future<Either<Failure, Unit>> deleteWhyUs(String token, int whyUsId);
}
