import 'package:dartz/dartz.dart';
import 'package:two_dashboard/config/constants/base_uri.dart';
import 'package:two_dashboard/core/api/get_api.dart';
import 'package:two_dashboard/core/api/get_with_token_api.dart';
import 'package:two_dashboard/core/api/post_api.dart';
import 'package:two_dashboard/core/api/post_api_with_token.dart';
import 'package:two_dashboard/core/api/put_request.dart';
import 'package:two_dashboard/core/models/empty_response_model.dart';
import 'package:two_dashboard/features/posts/data/models/create_post_response_model.dart';
import 'package:two_dashboard/features/posts/data/models/reply_to_post_response_model.dart';
import 'package:two_dashboard/features/posts/data/models/show_post_replies_response_model.dart';
import 'package:two_dashboard/features/posts/data/models/show_post_response_model.dart';

abstract class PostRemoteDatasource {
  Future<CreatePostResponseModel> createPost(
    String token,
    String description,
    String image,
  );
  Future<EmptyResponseModel> deletePost(String token, int postId);
  Future<ShowPostResponesModel> showActivePosts();
  Future<ShowPostResponesModel> showUnActivePosts();
  Future<Unit> unActivePost(String token, int postId);
  Future<ReplyToPostResponesModel> replyToPost(
    String fullName,
    String email,
    String phone,
    String cv,
    int postId,
  );
  Future<EmptyResponseModel> acceptReply(String token, int replyId);
  Future<ShowPostRepliesResponesModel> showPostReplies(
    String token,
    int postId,
  );
  Future<ShowPostRepliesResponesModel> showPostAcceptedReplies(
    String token,
    int postId,
  );
}

class PostsRemoteDatasourceImpl implements PostRemoteDatasource {
  @override
  Future<CreatePostResponseModel> createPost(
    String token,
    String description,
    String image,
  ) async {
    final result = PostApiWithToken(
      uri: Uri.parse("$baseUri/api/create/post"),
      body: ({'description': description, 'image': '$imageBase64$image'}),
      fromJson: createPostResponseModelFromJson,
      token: token,
    );
    return await result.call();
  }

  @override
  Future<EmptyResponseModel> deletePost(String token, int postId) async {
    final result = GetWithTokenApi(
      uri: Uri.parse("$baseUri/api/delete/post/$postId"),
      token: token,
      fromJson: emptyResponseModelFromJson,
    );
    return await result.callRequest();
  }

  @override
  Future<ShowPostResponesModel> showActivePosts() async {
    final result = GetApi(
      uri: Uri.parse("$baseUri/api/show/active/posts"),
      fromJson: showPostResponesModelFromJson,
    );
    return await result.callRequest();
  }

  @override
  Future<ShowPostResponesModel> showUnActivePosts() async {
    final result = GetApi(
      uri: Uri.parse("$baseUri/api/show/not/active/posts"),
      fromJson: showPostResponesModelFromJson,
    );
    return await result.callRequest();
  }

  @override
  Future<Unit> unActivePost(String token, int postId) async {
    final result = GetWithTokenApi(
      uri: Uri.parse("$baseUri/api/un/activate/post/$id"),
      token: token,
      fromJson: showPostRepliesResponesModelFromJson,
    );
    return await result.callRequest();
  }

  @override
  Future<ReplyToPostResponesModel> replyToPost(
    String fullName,
    String email,
    String phone,
    String cv,
    int postId,
  ) async {
    final result = PostApi(
      uri: Uri.parse("$baseUri/api/create/reply"),
      body: ({
        'full_name': fullName,
        'email': email,
        'phone': phone,
        'cv': '$pdfBase64$cv',
        'post_id': postId,
      }),
      fromJson: replyToPostResponesModelFromJson,
    );
    return await result.call();
  }

  @override
  Future<EmptyResponseModel> acceptReply(String token, int replyId) async {
    final result = PutApi(
      uri: Uri.parse("$baseUri/api/accept/reply/$replyId"),
      body: ({}),
      token: token,
      fromJson: emptyResponseModelFromJson,
    );
    return await result.call();
  }

  @override
  Future<ShowPostRepliesResponesModel> showPostAcceptedReplies(
    String token,
    int postId,
  ) async {
    final result = GetWithTokenApi(
      uri: Uri.parse("$baseUri/api/show/accepted/post/replies/$postId"),
      token: token,
      fromJson: showPostRepliesResponesModelFromJson,
    );
    return await result.callRequest();
  }

  @override
  Future<ShowPostRepliesResponesModel> showPostReplies(
    String token,
    int postId,
  ) async {
    final result = GetWithTokenApi(
      uri: Uri.parse("$baseUri/api/show/post/replies/$postId"),
      token: token,
      fromJson: showPostRepliesResponesModelFromJson,
    );
    return await result.callRequest();
  }
}
