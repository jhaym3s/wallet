import 'package:flutter/material.dart';

import '../configs/constants.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({ Key? key, required this.onPressed, required this.label}) : super(key: key);

  final Function() onPressed;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: SizedBox(
              width: kScreenWidth(context),
              height: 50,
              child: ElevatedButton(
                onPressed: onPressed,
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