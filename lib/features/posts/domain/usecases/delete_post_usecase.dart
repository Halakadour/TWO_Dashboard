import 'package:dartz/dartz.dart';

import 'package:two_dashboard/core/usecases/use_case.dart';
import 'package:two_dashboard/features/posts/domain/repos/post_repo.dart';
import 'package:two_dashboard/features/posts/domain/usecases/show_post_replies_usecase.dart';

import '../../../../core/error/failures.dart';

class DeletePostUsecase
    extends
        UseCase<
          Future<Either<Failure, Unit>>,
          PostRepliesOrDeleteOrUnActiveParam
        > {
  DeletePostUsecase(this.postRepo);
  final PostRepo postRepo;

  @override
  Future<Either<Failure, Unit>> call(PostRepliesOrDeleteOrUnActiveParam param) {
    return postRepo.deletePost(param.token, param.postId);
  }
}
