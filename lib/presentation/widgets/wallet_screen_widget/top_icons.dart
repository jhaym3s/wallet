import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../configs/configs.dart';

class TopIconsAndLabel extends StatelessWidget {
  const TopIconsAndLabel({ Key? key, required this.images, required this.label}) : super(key: key);

  final String images;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         CircleAvatar(
          backgroundColor: kWhite,
         // backgroundImage:  AssetImage(AssetsImages.buyIcon, ),
          child:Center(child: Image(image:  AssetImage(images))),
        ),
        const Gap(5),
        Text(label, style: Theme.of(context).textTheme.bodyText2!.copyWith(color: kWhite, fontWeight: FontWeight.bold),),
      ],
    );
  }
}