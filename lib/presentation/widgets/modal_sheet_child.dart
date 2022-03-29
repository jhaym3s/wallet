import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hodl/configs/configs.dart';

class ModalSheetChild extends StatefulWidget {
  const ModalSheetChild({ Key? key }) : super(key: key);

  @override
  State<ModalSheetChild> createState() => _ModalSheetChildState();
}

class _ModalSheetChildState extends State<ModalSheetChild> {

   bool toggle = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom:12.0),
      child: ListTile(
            onTap: () {
            },
            leading: CircleAvatar(
              backgroundColor: Colors.grey[300],
              backgroundImage: const AssetImage(AssetsImages.scan),
            ),
            title: Text(
              "Etheruem",
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(fontWeight: FontWeight.bold, color: Colors.purple),
            ),
            trailing: Switch(
              activeColor: Colors.purple,
              value: toggle, onChanged: (value){
              setState(() {
                toggle = !toggle;
              });
            })
          ),
    );
  }
}