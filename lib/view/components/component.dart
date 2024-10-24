import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:techblog/constans/const_colors.dart';
import 'package:techblog/controller/home-screen-controller.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:techblog/models/fake_data/data.dart';
 

class TechDivider extends StatelessWidget {
  const TechDivider({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Divider(
      endIndent: size.width / 6,
      indent: size.width / 6,
      color: SolidColors.dividerColor,
    );
  }
}

class MainTags extends StatelessWidget {
  const MainTags({super.key, required this.textthem, required this.index});

  final TextTheme textthem;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}

 
 
Widget genLoding(){
  return SpinKitThreeInOut(
      color: SolidColors.primaryColor.withOpacity(0.5),
      size: 26,
    );

}
 
 