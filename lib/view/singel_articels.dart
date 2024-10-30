import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:techblog/constans/const_colors.dart';
import 'package:techblog/constans/const_strings.dart';
import 'package:techblog/constans/text-theme.dart';
import 'package:techblog/controller/home-screen-controller.dart';
import 'package:techblog/controller/singel_articels_controller.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/models/fake_data/data.dart';
import 'package:techblog/view/components/component.dart';
import 'package:techblog/view/main_screen/home_screen.dart';

class SingelArticelsScreen extends StatefulWidget {
  SingelArticelsScreen({super.key});

  @override
  State<SingelArticelsScreen> createState() => _SingelArticelsScreenState();
}

class _SingelArticelsScreenState extends State<SingelArticelsScreen> {
  SingelArticelsController _singelArticelsController =
      Get.put(SingelArticelsController());

  HomeSreenController _homeSreenController = Get.put(HomeSreenController());

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
    _singelArticelsController.getsingelArticel();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textthem = Theme.of(context).textTheme;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child:   Obx(
          () =>
          
           _singelArticelsController.singelArticel.value.title==null ? genLoding(): Column(
            children: [
              Stack(
                children: [
                  CachedNetworkImage(
                      imageUrl:
                          _singelArticelsController.singelArticel.value.image!,
                      imageBuilder: (context, ImageProvider) =>
                          Image(image: ImageProvider)),
                  Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 65,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              end: Alignment.bottomCenter,
                              begin: Alignment.topCenter,
                              colors: GradientColors.singleAppbarGradiant),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.arrow_back_rounded,
                                  color: SolidColors.lightIcon, size: 28),
                              Expanded(
                                  child: SizedBox(
                                width: 5,
                              )),
                              Icon(
                                Icons.bookmark_outline,
                                color: SolidColors.lightIcon,
                                size: 24,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Icon(Icons.share_rounded,
                                  color: SolidColors.lightIcon, size: 24),
                            ],
                          ),
                        ),
                      )),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  _singelArticelsController.singelArticel.value.title!,
                  style: textthem.titleLarge,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16, top: 8),
                child: Row(
                  children: [
                    Assets.images.profileAvatar.image(width: 36),
                    SizedBox(
                      width: 6,
                    ),
                    Text(
                      _singelArticelsController.singelArticel.value.author!,
                    ),
                    SizedBox(
                      width: 14,
                    ),
                    Text(
                        _singelArticelsController
                            .singelArticel.value.createdAt!,
                        style: textthem.bodySmall),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(26),
                child: HtmlWidget(
                  _singelArticelsController.singelArticel.value.content!,
                  textStyle: articelsTextTheme,
                ),
              ),
              //tagList view
              Padding(
                padding: const EdgeInsets.only(right: 32),
                child: SizedBox(
                  width: size.width,
                  height: size.height / 16,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: tagList.length,
                      itemBuilder: (context, index) {
                        double right = index == 0 ? 32 : 10;
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: SolidColors.surface,
                              ),
                              child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          tagList[index].title,
                                          style: textthem.bodyMedium,
                                        ),
                                      ]))),
                        );
                      }),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 32, top: 38, bottom: 12),
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
                  //related  ListView
                  SizedBox(
                      height: size.height / 3.8,
                      child: Obx(
                        () => ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount:
                                _singelArticelsController.related.length,
                            itemBuilder: (context, index) {
                              double right = index == 0 ? 32 : 10;
                              return InkWell(
                                onTap: () {
                                  _singelArticelsController.postIdContoreler.value= int.parse(_homeSreenController.topArticelsList[index].id!);
                                       _singelArticelsController.getsingelArticel();
                                       
                             Get.to(SingelArticelsScreen());
                                },
                              
                              child: Padding(
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
                                              imageUrl:   _singelArticelsController.related[index].image!,
                                              imageBuilder:
                                                  (context, ImageProvider) =>
                                                      Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(30),
                                                    image: DecorationImage(
                                                        image: ImageProvider,
                                                        fit: BoxFit.cover)),
                                                foregroundDecoration:
                                                    BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  gradient: const LinearGradient(
                                                      begin:
                                                          Alignment.bottomCenter,
                                                      end: Alignment.topCenter,
                                                      colors: GradientColors
                                                          .blogPost),
                                                ),
                                              ),
                                              placeholder: (context, url) =>
                                                  genLoding(),
                                              errorWidget:
                                                  (context, url, error) => Icon(
                                                Icons
                                                    .image_not_supported_outlined,
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
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text(
                                                  _singelArticelsController
                                                      .related[index]
                                                      .author!,
                                                  style: textthem.headlineSmall,
                                                ),
                                                Text(
                                                 _singelArticelsController
                                                      .related[index]
                                                      .view!,
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
                                        _singelArticelsController
                                                      .related[index]
                                                      .title!,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                          ))
                                    ],
                                  ),
                                ),
                              );
                            }),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
