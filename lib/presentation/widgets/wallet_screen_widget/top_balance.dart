import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hodl/components/copy_button.dart';
import 'package:hodl/presentation/widgets/modal_sheet_child.dart';
import 'package:hodl/presentation/widgets/wallet_screen_widget/token_list.dart';
import 'package:hodl/presentation/widgets/wallet_screen_widget/top_icons.dart';

import '../../../configs/configs.dart';

class TopBalance extends StatelessWidget {
  const TopBalance({Key? key, required this.ethAddress}) : super(key: key);
  final String ethAddress;
  //final String mnemonics;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: kScreenWidth(context),
      height: kScreenHeight(context) / 3,
      color: kPrimaryColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            const Gap(30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Gap(30),
                Text(
                  "Account 1",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(color: kWhite, fontWeight: FontWeight.bold),
                ),
                InkWell(
                    child: Image.asset(AssetsImages.scan),
                    onTap: () {
                      showModalBottomSheet<void>(
                        context: context,
                        isScrollControlled: true,
                        isDismissible: true,
                        builder: (BuildContext context) {
                          return FractionallySizedBox(
                            heightFactor: 0.9,
                            child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: 20,
                                itemBuilder: (context, index) {
                                  return const ModalSheetChild();
                                }),
                          );
                        },
                      );
                    })
              ],
            ),
            const Gap(20),
            Text(
              "\$0.0",
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 40)
                  .copyWith(color: kWhite),
            ),
            const Gap(10),
            CopyButton(
              text: Text(ethAddress),
              value: ethAddress,
              radius: 18,
              color: kWhite,
            ),
            const Gap(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                TopIconsAndLabel(images: AssetsImages.sendIcon, label: "Send"),
                TopIconsAndLabel(
                    images: AssetsImages.recieveIcon, label: "Recieve"),
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
