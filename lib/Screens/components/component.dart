import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:techblog/constans/const_colors.dart';

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
