import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:getx_1/controllers/topic.controller.dart';

class TopicView extends StatelessWidget {
  TopicView({Key? key}) : super(key: key);
  final topicController = Get.put(TopicController(
      slugid: '${Get.parameters['slugid']}'));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
              Obx(
                () => topicController.isTopicLoading.value
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Column(
                        children: [
                          Card(
                            margin: EdgeInsets.all(12),
                            child: Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              topicController
                                                  .topic!.data.topicSubject,
                                              style: TextStyle(fontSize: 23),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Text(
                                              topicController
                                                  .topic!.data.topicDetail,
                                              softWrap: true,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
              ),
              Expanded(
                child: Obx(
                  () => topicController.isCommentLoading.value
                      ? Container()
                      : ListView.builder(
                          itemCount: topicController.comment!.data.length,
                          itemBuilder: (context, index) {
                            // print(topicController.comment!.data[index].commentBy);
                            return Column(
                              children: [
                                Card(
                                  margin: EdgeInsets.all(12),
                                  child: Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            CircleAvatar(
                                              backgroundImage: NetworkImage(
                                                  'https://c.tenor.com/Ad-xu5LhRHoAAAAC/elysia-honkai-impact3.gif'),
                                            ),
                                            SizedBox(width: 30,),
                                            Text(topicController
                                                .comment!.data[index].postName.name)
                                          ],
                                        ),
                                        SizedBox(height: 20,),
                                        Text(topicController.comment!.data[index].commentDetail),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            );
                          },
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
