import 'package:flutter/material.dart';

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
          backgroundColor: kBlack,
         // backgroundImage:  AssetImage(AssetsImages.buyIcon, ),
          child:Center(child: Image(image:  AssetImage(images))),
        ),
        Text(label),
      ],
    );
  }
}