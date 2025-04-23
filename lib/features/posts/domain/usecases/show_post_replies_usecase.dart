// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:two_dashboard/core/usecases/use_case.dart';
import 'package:two_dashboard/features/posts/domain/entities/reply_entity.dart';
import 'package:two_dashboard/features/posts/domain/repos/post_repo.dart';

import '../../../../core/error/failures.dart';

class ShowPostRepliesUsecase
    extends
        UseCase<
          Future<Either<Failure, List<ReplyEntity>>>,
          PostRepliesOrDeleteOrUnActiveParam
        > {
  ShowPostRepliesUsecase(this.postRepo);

  final PostRepo postRepo;
  @override
  Future<Either<Failure, List<ReplyEntity>>> call(
    PostRepliesOrDeleteOrUnActiveParam param,
  ) {
    return postRepo.showPostReplies(param.postId, param.token);
  }
}

class PostRepliesOrDeleteOrUnActiveParam {
  final int postId;
  final String token;
  PostRepliesOrDeleteOrUnActiveParam({
    required this.postId,
    required this.token,
  });
}
