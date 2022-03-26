import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hodl/configs/eth_address_formatter.dart';
import 'package:hodl/components/copy_button.dart';
import 'package:hodl/presentation/widgets/wallet_screen_widget/top_icons.dart';

import '../../../configs/configs.dart';


class TopBalance extends StatelessWidget {
  const TopBalance({ Key? key, required this.ethAddress}) : super(key: key);
  final String ethAddress;
  //final String mnemonics;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: kScreenWidth(context),
      height: kScreenHeight(context) / 3,
      color: const Color.fromARGB(248, 250, 250, 250),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal:20.0),
        child: Column(
          children: [
            const Gap(30),
            Text("Account 1",style: Theme.of(context).textTheme.bodyText2,),
           const Gap(20),
            const Text(
              "\$0.0", 
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 40),
            ),
            const Gap(10),
             CopyButton(text: Text(ethAddress), value: ethAddress,radius: 18,),
            const Gap(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:  const[
                TopIconsAndLabel(images: AssetsImages.sendIcon, label: "Send"),
                TopIconsAndLabel(images: AssetsImages.recieveIcon, label: "Recieve"),
                TopIconsAndLabel(images: AssetsImages.buyIcon, label: "Buy"),
                TopIconsAndLabel(images: AssetsImages.swapIcon, label: "Swap")
              ],
            ),
          ],
        ),
      ),
    );
  }
}
