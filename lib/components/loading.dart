import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hodl/configs/configs.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key, required this.actionText}) : super(key: key);
  final String actionText;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(actionText),
             const SpinKitWanderingCubes(color: kPrimaryColor),
          ],
        ),
      ),
    );
  }
}
