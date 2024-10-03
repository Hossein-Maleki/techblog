import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:techblog/Screens/components/component.dart';
import 'package:techblog/constans/const_colors.dart';
import 'package:techblog/constans/const_strings.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/models/fake_data/data.dart';

class Categorys extends StatelessWidget {
  const Categorys({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textthem = Theme.of(context).textTheme;
    return SafeArea(
        child: Scaffold(
      backgroundColor: SolidColors.statusBarColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              Assets.images.tcbot,
              width: size.width / 3,
            ),
            const SizedBox(
              height: 12,
            ),
            const Text(MyStrings.successfulRegistration),
            Padding(
                padding: const EdgeInsets.fromLTRB(32, 16, 32, 28),
                child: TextField(
                  decoration: InputDecoration(
                      hintText: MyStrings.nameAndFamilyName,
                      hintStyle: textthem.labelSmall),
                )),
            const Text(MyStrings.chooseCats),
            const SizedBox(
              height: 12,
            ),
            SizedBox(
              width: double.infinity,
              height: size.height/8,
              child: GridView.builder(
                  physics: const ClampingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: tagList.length,
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    childAspectRatio: 0.4,
                  ),
                  itemBuilder: (context, index) =>
                      MainTags(textthem: textthem, index: index)),
            )
          ],
        ),
      ),
    ));
  }
}
