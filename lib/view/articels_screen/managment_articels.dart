import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:techblog/constans/const_colors.dart';
import 'package:techblog/constans/const_strings.dart';
import 'package:techblog/controller/managment-articels-controller.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/view/components/component.dart';

class ManagmentArticelsScreen extends StatelessWidget {
  ManageArticleController _articelsListController =
      Get.find<ManageArticleController>();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textthem = Theme.of(context).textTheme;
    var texttheme = Theme.of(context).textTheme;
    return SafeArea(
        child: Scaffold(
            appBar: genAppBar("مدیریت مقاله ها"),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.fromLTRB(10, 15, 10, 30),
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  MyStrings.textManageArticle,
                  style: textthem.bodyLarge,
                ),
              ),
            ),
            body: SizedBox(
                width: 5000, // Get.size.width / 3,,
                child: Obx(() => _articelsListController.isloading.value
                    ? genLoding()
                    : _articelsListController.articleList.isNotEmpty
                        ? ListView.builder(
                            itemCount:
                                _articelsListController.articleList.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {},
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start, //
                                    children: [
                                      SizedBox(
                                        height: 120,
                                        width: 120,
                                        child: SizedBox(
                                          height: 200,
                                          width: 100,
                                          child: CachedNetworkImage(
                                            imageUrl: _articelsListController
                                                .articleList[index].image!,
                                            imageBuilder:
                                                (context, imageProvider) =>
                                                    Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(16),
                                                  image: DecorationImage(
                                                      image: imageProvider,
                                                      fit: BoxFit.cover)),
                                            ),
                                            placeholder: (context, url) => Icon(
                                              Icons
                                                  .image_not_supported_outlined,
                                              color: Colors.black38,
                                              size: 38,
                                            ),
                                            errorWidget: (context, url,
                                                    error) =>
                                                Icon(Icons
                                                    .image_not_supported_rounded),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 16,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          SizedBox(
                                            height: 6,
                                          ),
                                          SizedBox(
                                            width: 200,
                                            child: Text(
                                              _articelsListController
                                                  .articleList[index].title!,
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
                                                    .articleList[index].author!,
                                                style: texttheme.bodySmall,
                                              ),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              Text(
                                                _articelsListController
                                                        .articleList[index]
                                                        .view! +
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
                            })
                        : mptyState(textthem)))));
  }

  Widget mptyState(TextTheme textthem) {
    return SafeArea(
      child: Scaffold(
        appBar: genAppBar("مدیریت مقالات"),
        backgroundColor: SolidColors.statusBarColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Center(child: Assets.images.emptyState.image(scale: 3)),
            const SizedBox(height: 20),
            Text(
              MyStrings.articleEmpty,
              textAlign: TextAlign.center,
              style: textthem.labelMedium,
            ),
          ],
        ),
      ),
    );
  }
}
