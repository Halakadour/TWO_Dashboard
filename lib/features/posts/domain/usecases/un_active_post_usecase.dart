import 'package:dartz/dartz.dart';
import 'package:two_dashboard/core/error/failures.dart';
import 'package:two_dashboard/core/usecases/use_case.dart';
import 'package:two_dashboard/features/posts/domain/repos/post_repo.dart';
import 'package:two_dashboard/features/posts/domain/usecases/show_post_replies_usecase.dart';

class UnActivePostUsecase
    extends
        UseCase<
          Future<Either<Failure, Unit>>,
          PostRepliesOrDeleteOrUnActiveParam
        > {
  final PostRepo postRepo;

  UnActivePostUsecase(this.postRepo);

  @override
  Future<Either<Failure, Unit>> call(PostRepliesOrDeleteOrUnActiveParam param) {
    return postRepo.unActivePost(param.token, param.postId);
  }
}
