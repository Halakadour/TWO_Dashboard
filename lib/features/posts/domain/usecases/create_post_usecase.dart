// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dartz/dartz.dart';

import 'package:two_dashboard/core/usecases/use_case.dart';
import 'package:two_dashboard/features/posts/domain/entities/post_entity.dart';
import 'package:two_dashboard/features/posts/domain/repos/post_repo.dart';

import '../../../../core/error/failures.dart';

class CreatePostUsecase
    extends UseCase<Future<Either<Failure, PostEntity>>, PostParam> {
  CreatePostUsecase(this.postRepo);
  final PostRepo postRepo;
  @override
  Future<Either<Failure, PostEntity>> call(PostParam param) {
    return postRepo.createPost(param.token, param.image, param.body);
  }
}

class PostParam {
  final String token;
  final String image;
  final String body;
  PostParam({required this.token, required this.image, required this.body});
}
