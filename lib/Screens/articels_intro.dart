import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:techblog/constans/const_colors.dart';
import 'package:techblog/constans/const_strings.dart';
import 'package:techblog/gen/assets.gen.dart';

class ArticelsIntro extends StatelessWidget {
  const ArticelsIntro({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textthem = Theme.of(context).textTheme;
    return SafeArea(
        child: Scaffold(
      backgroundColor: SolidColors.statusBarColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SvgPicture.asset(
            Assets.images.tcbot,
            width: 164,
          ),
          const SizedBox(
            height: 20,
          ),
          // Text(
          //   textAlign:TextAlign.center,
          //   MyStrings.welcom)
          const Text.rich(
              textAlign: TextAlign.center, TextSpan(text: MyStrings.welcom)),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding:
                EdgeInsets.fromLTRB(size.width / 3, 12, size.width / 3, 12),
            child: ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (context) => Padding(
                            padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom),
                            child: Container(
                              height: size.height / 3,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(24),
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255)),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    MyStrings.insertYourEmail,
                                    style: textthem.labelLarge,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: TextField(
                                      style: textthem.bodyMedium,
                                      textAlign: TextAlign.center,
                                      decoration: InputDecoration(
                                          hintStyle: textthem.labelSmall,
                                          hintText: "techblog@gmail.com"),
                                    ),
                                  ),
                                  ElevatedButton(
                                      onPressed: () {},
                                      child: Text(
                                        MyStrings.continuation,
                                        style: textthem.bodyLarge,
                                      ))
                                ],
                              ),
                            ),
                          ));
                },
                child: Text(
                  textAlign: TextAlign.center,
                  MyStrings.letsGo,
                  style: textthem.bodyLarge,
                )),
          )
        ],
      ),
    ));
  }
}
