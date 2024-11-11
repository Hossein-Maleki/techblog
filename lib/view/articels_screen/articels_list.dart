import 'dart:ffi';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:techblog/constans/api_constant.dart';
import 'package:techblog/constans/const_colors.dart';
import 'package:techblog/controller/articels-list-controller.dart';
import 'package:techblog/controller/singel_articels_controller.dart';
import 'package:techblog/view/components/component.dart';
import 'package:techblog/view/articels_screen/singel_articels.dart';

class ArticelsListScreen extends StatelessWidget {
  String? appbarTitle;
  ArticelsListScreen( {super.key, required this.appbarTitle});

  ArticelsListController _articelsListController =
      Get.put(ArticelsListController());

  SingelArticelsController _singelArticelsController =
      Get.put(SingelArticelsController());

  @override
  Widget build(BuildContext context) {
    var texttheme = Theme.of(context).textTheme;
    return SafeArea(
        child: Scaffold(
      appBar: genAppBar(appbarTitle!),
      body: Container(
          width: 5000, // Get.size.width / 3,,
          child: Obx(
            () => ListView.builder(
                itemCount: _articelsListController.ArticelsList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      var articelsId =
                          _articelsListController.ArticelsList[index].id!;

                      _singelArticelsController.getsingelArticel(articelsId);
                    },
                    child: Padding(
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
                                placeholder: (context, url) => Icon(
                                  Icons.image_not_supported_outlined,
                                  color: Colors.black38,
                                  size: 38,
                                ),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.image_not_supported_rounded),
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
                    ),
                  );
                }),
          )),
    ));
  }
}
