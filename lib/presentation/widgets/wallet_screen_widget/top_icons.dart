import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../configs/configs.dart';

class TopIconsAndLabel extends StatelessWidget {
  const TopIconsAndLabel({Key? key, required this.images, required this.label,this.backGroundColor = kWhite})
      : super(key: key);

  final String images;
  final String label;
  final Color backGroundColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: backGroundColor,
          radius: 30,
          // backgroundImage:  AssetImage(AssetsImages.buyIcon, ),
          child: Center(child: Image(image: AssetImage(images))),
        ),
        const Gap(5),
        Text(
          label,
          style: Theme.of(context)
              .textTheme
              .bodyText2!
              .copyWith(color: backGroundColor, fontWeight: FontWeight.bold, fontSize: 17),
        ),
      ],
    );
  }
}
