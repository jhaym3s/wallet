import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hodl/configs/configs.dart';
import 'package:hodl/models/coin_geko_api.dart';

class ModalSheetChild extends StatefulWidget {
  const ModalSheetChild({Key? key, required this.coinGeko}) : super(key: key);

  final CoinGeko coinGeko;

  @override
  State<ModalSheetChild> createState() => _ModalSheetChildState();
}

class _ModalSheetChildState extends State<ModalSheetChild> {
  bool toggle = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 12.0),
        child: SwitchListTile(
          title: Text(
            "${widget.coinGeko.name}",
            style:
                Theme.of(context).textTheme.bodyText2!.copyWith(fontSize: 20),
          ),
          onChanged: (val) {
            setState(() {
              toggle = val;
            });
          },
          value: toggle,
          secondary:  CircleAvatar(
            radius: 20.0,
            backgroundImage: NetworkImage("${widget.coinGeko.image}"),
            backgroundColor: Colors.transparent,
          ),
        ));
  }
}
