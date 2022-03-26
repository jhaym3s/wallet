import 'package:flutter/material.dart';

import '../configs/constants.dart';

class IntroElevatedButton extends StatelessWidget {
  const IntroElevatedButton({ Key? key, required this.onPress, required this.label}) : super(key: key);

  final Function() onPress;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: SizedBox(
              width: kScreenWidth(context),
              height: 50,
              child: ElevatedButton(
                onPressed: onPress,
                child: Text(label),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(kPrimaryColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}