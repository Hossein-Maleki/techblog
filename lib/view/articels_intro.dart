import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:techblog/view/category-screen.dart';
import 'package:techblog/constans/const_colors.dart';
import 'package:techblog/constans/const_strings.dart';
import 'package:techblog/gen/assets.gen.dart';
import 'package:validators/validators.dart';

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
                  showEmailBottomSheet(context, size, textthem);
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

  Future<dynamic> showCodeBottomSheet(
      BuildContext context, Size size, TextTheme textthem) {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) => Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Container(
                height: size.height / 3,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: const Color.fromARGB(255, 255, 255, 255)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      MyStrings.activateCode,
                      style: textthem.labelLarge,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: TextField(
                        style: textthem.bodyMedium,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            hintStyle: textthem.labelSmall, hintText: "******"),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(builder: (context) {
                           return Categorys();
                          }));
                        },
                        child: Text(
                          MyStrings.continuation,
                          style: textthem.bodyLarge,
                        ))
                  ],
                ),
              ),
            ));
  }

  Future<dynamic> showEmailBottomSheet(
      BuildContext context, Size size, TextTheme textthem) {
         
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) => Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Container(
                height: size.height / 3,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: const Color.fromARGB(255, 255, 255, 255)),
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
                        onChanged: (value) => print(value+"status12"+ isEmail(value).toString()),
                        style: textthem.bodyMedium,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            hintStyle: textthem.labelSmall,
                            hintText: "techblog@gmail.com"),
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          showCodeBottomSheet(context, size, textthem);
                        },
                        child: Text(
                          MyStrings.continuation,
                          style: textthem.bodyLarge,
                        ))
                  ],
                ),
              ),
            ));
  }
}
