import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:techblog/constans/const_colors.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/model/fake_data/data.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textthem = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: SolidColors.scaffoldBg,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Row(
                textDirection: TextDirection.ltr,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(
                    CupertinoIcons.search,
                  ),
                  Assets.images.logo.image(height: size.height / 13.6),
                  Icon(Icons.menu)
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Stack(
              children: [
                Container(
                  height: size.height / 4.2,
                  width: size.width / 1.2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: Assets.images.posterTest.provider())),
                  foregroundDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: GradientColors.homePosterCoverGradiant)),
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
                            " ملیکا عزیزی - یک روز پیش",
                            style: textthem.headlineMedium,
                          ),
                          Text(
                            " Like 253",
                            style: textthem.headlineMedium,
                          )
                        ],
                      ),
                      SizedBox(
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
            ),
            SizedBox(
              height: 14,
            ),
            //list view
            SizedBox(
              width: size.width,
              height: size.height / 16,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: tagList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:
                          EdgeInsets.fromLTRB(8, 8, index == 0 ? 32 : 10, 8),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            gradient:
                                LinearGradient(colors: GradientColors.tags)),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Assets.icons.hashtagicon.image(width: 12),
                              SizedBox(
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
                  }),
            )
          ],
        ),
      ),
    );
  }
}
