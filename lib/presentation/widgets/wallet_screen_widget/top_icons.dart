import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../configs/configs.dart';

class TopIconsAndLabel extends StatelessWidget {
  TopIconsAndLabel(
      {Key? key,
      required this.images,
      required this.label,
      this.backGroundColor = kWhite,
      required this.onTap ,
      })
      : super(key: key);

  final String images;
  final String label;
  final Color backGroundColor;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: 
            onTap,
          child: CircleAvatar(
            backgroundColor: backGroundColor,
            radius: 30,
            child: Center(child: Image(image: AssetImage(images))),
          ),
        ),
        const Gap(5),
        Text(
          label,
          style: Theme.of(context).textTheme.bodyText2!.copyWith(
              color: backGroundColor,
              fontWeight: FontWeight.bold,
              fontSize: 17),
        ),
      ],
    );
  }
}
