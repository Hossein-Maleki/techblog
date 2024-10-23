import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:techblog/constans/const_colors.dart';
import 'package:techblog/constans/const_strings.dart';
import 'package:techblog/controller/home-screen-controller.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/models/fake_data/data.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:techblog/view/components/component.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    super.key,
    required this.size,
    required this.textthem,
  });
  HomeSreenController _homeSreenController = Get.put(HomeSreenController());
  final Size size;
  final TextTheme textthem;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
          child: Obx(() => _homeSreenController.isLoading.value
              ? Column(
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    genMianPoster(),
                    const SizedBox(
                      height: 12,
                    ),
                    //list view
                    HomescreenTagList(size: size, textthem: textthem),
                    const SizedBox(
                      height: 12,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 32),
                      child: Row(
                        children: [
                          Assets.icons.bluePen.image(width: 24),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(MyStrings.viewHotestBlog,
                              style: textthem.headlineSmall!.apply(
                                color: SolidColors.seeMore,
                              ))
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    //listview blog
                    genTopArticelsList(),
                    SizedBox(
                      height: 8,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 32),
                      child: Row(children: [
                        Assets.icons.microphon.image(width: 24),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(MyStrings.viewHotestPodCasts,
                            style: textthem.headlineSmall!.apply(
                              color: SolidColors.seeMore,
                            ))
                      ]),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    //listview podcast
                    genTopPdcastList(),
                    SizedBox(
                      height: 60,
                    )
                  ],
                )
              : Padding(
                  padding: const EdgeInsets.only(top: 300),
                  child: genLoding(),
                ))),
    );
  }

  Widget genTopArticelsList() {
    return SizedBox(
        height: size.height / 3.8,
        child: Obx(
          () => ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _homeSreenController.topArticelsList.length,
              itemBuilder: (context, index) {
                double right = index == 0 ? 32 : 10;
                return Padding(
                  padding: EdgeInsets.fromLTRB(
                    8,
                    8,
                    right,
                    8,
                  ),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: size.height / 5.5,
                            width: size.width / 2.7,
                            child: CachedNetworkImage(
                              imageUrl: _homeSreenController
                                  .topArticelsList[index].image!,
                              imageBuilder: (context, ImageProvider) =>
                                  Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    image: DecorationImage(
                                        image: ImageProvider,
                                        fit: BoxFit.cover)),
                                foregroundDecoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  gradient: const LinearGradient(
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                      colors: GradientColors.blogPost),
                                ),
                              ),
                              placeholder: (context, url) => genLoding(),
                              errorWidget: (context, url, error) => Icon(
                                Icons.image_not_supported_outlined,
                                color: Colors.black26,
                                size: 36,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 14,
                            right: 16,
                            left: 16,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  _homeSreenController
                                      .topArticelsList[index].author!,
                                  style: textthem.headlineSmall,
                                ),
                                Text(
                                  _homeSreenController
                                      .topArticelsList[index].view!,
                                  style: textthem.headlineSmall,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                          width: size.width / 2.7,
                          child: Text(
                            _homeSreenController.topArticelsList[index].title!,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ))
                    ],
                  ),
                );
              }),
        ));
  }

  Widget genTopPdcastList() {
    return SizedBox(
        height: size.height / 3.8,
        child: Obx(
          () => ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _homeSreenController.topPodcastList.length,
              itemBuilder: (context, index) {
                double right = index == 0 ? 32 : 10;
                return Padding(
                  padding: EdgeInsets.fromLTRB(
                    8,
                    8,
                    right,
                    8,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: size.height / 5.5,
                        width: size.width / 2.7,
                        child: CachedNetworkImage(
                          imageUrl: _homeSreenController
                              .topPodcastList[index].poster!,
                          imageBuilder: (Context, ImageProvider) => Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  image: DecorationImage(
                                      image: ImageProvider,
                                      fit: BoxFit.cover))),
                          placeholder: (context, url) => genLoding(),
                          errorWidget: (context, url, error) => Icon(
                            Icons.image_not_supported_outlined,
                            color: Colors.black26,
                            size: 36,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        _homeSreenController.topPodcastList[index].title!,
                      )
                    ],
                  ),
                );
              }),
        ));
  }

  Widget genMianPoster() {
    return Stack(
      children: [
        Container(
          height: size.height / 4.2,
          width: size.width / 1.2,
          child: CachedNetworkImage(
            imageUrl: _homeSreenController.postermodel.value.image!,
            imageBuilder: (contex, imageprovider) => Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  image:
                      DecorationImage(fit: BoxFit.cover, image: imageprovider)),
              foregroundDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: GradientColors.homePosterCoverGradiant)),
            ),
            placeholder: (context, url) => genLoding(),
            errorWidget: (context, url, error) => const Icon(
              Icons.image_not_supported_outlined,
              color: Colors.black26,
              size: 36,
            ),
          ),
        ),
        Positioned(
          left: 20,
          right: 20,
          bottom: 16,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _homeSreenController.postermodel.value.title!,
                    style: textthem.headlineMedium,
                  ),
                  Text(
                    " Like 253",
                    style: textthem.headlineMedium,
                  )
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      "دوازده قدم برنامه نویسی یک دوره ی ..س",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: textthem.headlineLarge,
                    ),
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}

class HomescreenTagList extends StatelessWidget {
  const HomescreenTagList({
    super.key,
    required this.size,
    required this.textthem,
  });

  final Size size;
  final TextTheme textthem;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      height: size.height / 16,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: tagList.length,
          itemBuilder: (context, index) {
            double right = index == 0 ? 32 : 10;
            return MainTags(right: right, textthem: textthem, index: index);
          }),
    );
  }
}

class MainTags extends StatelessWidget {
  const MainTags(
      {super.key,
      required this.right,
      required this.textthem,
      required this.index});

  final double right;
  final TextTheme textthem;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(8, 8, right, 8),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: const LinearGradient(colors: GradientColors.tags)),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Assets.icons.hashtagicon.image(width: 12),
              const SizedBox(
                width: 5,
              ),
              Text(
                tagList[index].title,
                style: textthem.headlineSmall,
              )
            ],
          ),
        ),
      ),
    );
  }
}
