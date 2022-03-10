import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hodl/presentation/widgets/copy_button.dart';
import 'package:hodl/presentation/widgets/wallet_screen_widget/top_icons.dart';

import '../../../configs/configs.dart';


class TopBalance extends StatelessWidget {
  const TopBalance({ Key? key, }) : super(key: key);
  //final String mnemonics;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: kScreenWidth(context),
      height: kScreenHeight(context) / 3,
      color:  Colors.grey.shade300,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal:20.0),
        child: Column(
          children: [
            const Gap(30),
           const Text("Account 1"),
           const Gap(20),
            const Text(
              "\$0.0",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 40),
            ),
            const Gap(10),
             const CopyButton(text: Text("mnemonics"), value: "0x",radius: 18,),
            const Gap(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:  const[
                TopIconsAndLabel(images: AssetsImages.sendIcon, label: "Send"),
                TopIconsAndLabel(images: AssetsImages.recieveIcon, label: "Send"),
                TopIconsAndLabel(images: AssetsImages.buyIcon, label: "Send"),
                TopIconsAndLabel(images: AssetsImages.swapIcon, label: "Send")
              ],
            ),
          ],
        ),
      ),
    );
  }
}
