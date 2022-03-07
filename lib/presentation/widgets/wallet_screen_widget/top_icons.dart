import 'package:flutter/material.dart';

class TopIconsAndLabel extends StatelessWidget {
  const TopIconsAndLabel({ Key? key, required this.iconData, required this.label}) : super(key: key);

  final IconData iconData;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          child: IconButton(onPressed: (){}, icon: Icon(iconData)),
        ),
        Text(label),
      ],
    );
  }
}