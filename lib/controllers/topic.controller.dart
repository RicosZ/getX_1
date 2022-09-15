import 'package:get/state_manager.dart';
import 'package:getx_1/api/comment.api.dart';
import 'package:getx_1/api/topic.api.dart';
import 'package:getx_1/models/comment.dart';
import 'package:getx_1/models/topic.dart';


class TopicController extends GetxController {
  String slugid;
  // String topicId;
  TopicController({required this.slugid});
  Topic? topic;
  Comment? comment;
  var isTopicLoading = true.obs;
  var isCommentLoading = true.obs;

  @override
  Future<void> onInit() async {
    getTopic(slugid: slugid);
    
    super.onInit();
  }
  @override
  Future<void> onReady() async {
    super.onReady();
  }

  @override
  void onClose() {}
  
  // String get Slug => slug;
  // void set Slug(String categorySlug){
  //   slug = categorySlug;
  // }

  getTopic({required String slugid}) async {
    try {
      final topicData = await TopicApi().getTopic(slugid: slugid);
      topic = topicData;
    } catch (e) {
      print(e);
    } finally {
      isTopicLoading(false);
      getComment(topicId: topic!.data.id);
    }
  }

  getComment({required String topicId}) async{
    try {
      final commentData = await CommentApi().getComment(topicId: topicId);
      comment = commentData;
      // print(commentData);
    } catch (e) {
      print(e);
    }finally {
      isCommentLoading(false);
    }
  }
}
