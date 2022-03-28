import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../configs/configs.dart';

class OnBoardingItem extends StatelessWidget {
  const OnBoardingItem(
      {Key? key,
      required this.description,
      required this.image,
      required this.title})
      : super(key: key);

  final String image;
  final String title;
  final String description;
  
  @override
  Widget build(BuildContext context) {
    return 
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Gap(30),
              Text(
                title,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontWeight: FontWeight.bold,fontSize: 32, color: kTextColors),
              ),
              const Gap(10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Text(
                  description,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(fontWeight: FontWeight.bold, color: kTextColors),
                ),
              ),
                const Gap(50),
              Expanded(
                child: Image.asset(
                  image,
                  fit: BoxFit.contain,
                ),
              ),

                     
            ],
          ),
        );
  }
}
