import 'package:flutter/material.dart';
import 'package:hodl/configs/configs.dart';

class IntroScreenButton extends StatelessWidget {
  const IntroScreenButton(
      {Key? key,
      required this.text,
      required this.title,
      required this.color,
      this.onPressed})
      : super(key: key);

  final String title;
  final String text;
  final Color color;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onPressed,
        child: SizedBox(
            height: kScreenHeight(context) / 8,
            width: kScreenWidth(context),
            child: Card(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              color: color,
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      text,
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
