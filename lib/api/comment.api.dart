import 'package:dio/dio.dart';
import 'package:getx_1/models/comment.dart';
import 'package:getx_1/routes/app.route.dart';
import 'package:getx_1/services/auth.services.dart';

class CommentApi {
  var dio = Dio();

  Future getComment({required String topicId}) async {
    dio.options.baseUrl = APIRoutes.BaseURL;
    dio.interceptors
      ..add(LogInterceptor())
      ..add(AuthInterceptor());

    final String subURL = '/forum/comments/';
    try {
      final response = await dio
          .get(subURL, queryParameters: {'topicId': topicId});
      final statusCode = response.statusCode;
      final body = response.data;

      if (statusCode == 200) {
        return Comment.fromJson(body);
      }
    } catch (e) {
      // print(e);
    }
  }
}
