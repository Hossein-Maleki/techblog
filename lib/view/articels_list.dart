import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techblog/constans/api_constant.dart';
import 'package:techblog/constans/const_colors.dart';
import 'package:techblog/controller/articels-list-controller.dart';
import 'package:techblog/view/components/component.dart';

class ArticelsListScreen extends StatelessWidget {
  ArticelsListScreen({super.key});
  ArticelsListController _articelsListController =
      Get.put(ArticelsListController());
  @override
  Widget build(BuildContext context) {
    var texttheme = Theme.of(context).textTheme;
    return SafeArea(
        child: Scaffold(
   
      appBar: genAppBar(" لیست مقاله ها"),
     
      body: Container(
        width: 5000, // Get.size.width / 3,,
        child: Obx(
          () => ListView.builder(
              itemCount: _articelsListController.ArticelsList.length,
              itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start, //
                      children: [
                        SizedBox(
                          height: 120,
                          width: 120,
                          child: SizedBox(
                            height: 200,
                            width: 100,
                            child: CachedNetworkImage(
                              imageUrl: _articelsListController
                                  .ArticelsList[index].image!,
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover)),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                              height: 6,
                            ),
                            SizedBox(
                              width: 200,
                              child: Text(
                                _articelsListController
                                    .ArticelsList[index].title!,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ),
                            SizedBox(
                              height: 14,
                            ),
                            Row(
                              children: [
                                Text(
                                  _articelsListController
                                      .ArticelsList[index].author!,
                                  style: texttheme.bodySmall,
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Text(
                                  _articelsListController
                                          .ArticelsList[index].view! +
                                      " یازدید",
                                  style: texttheme.bodySmall,
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  )),
        ),
      ),
    ));
  }
}
