import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hodl/presentation/widgets/wallet_screen_widget/top_icons.dart';

import '../../configs/constants.dart';

class IndexCurrencyHeader extends StatelessWidget {
  const IndexCurrencyHeader(
      {Key? key,
      required this.currencyPrice,
      required this.priceChangePercentage24H})
      : super(key: key);
  final double currencyPrice;
  final double priceChangePercentage24H;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(20),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text("\$${currencyPrice.toString()}",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: kPrimaryColor)),
            const Gap(9),
            Text(priceChangePercentage24H.toString(),
                style: Theme.of(context).textTheme.bodyText1)
          ],
        ),
        const Gap(10),
        const CircleAvatar(
          radius: 30.0,
          backgroundImage: AssetImage(AssetsImages.ethIcon),
          backgroundColor: Colors.transparent,
        ),
        const Gap(10),
        Text("Amount owned",
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: kPrimaryColor)),
        Text("~Dollar Equivalent",
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(fontSize: 20, color: kPrimaryColor)),
        const Gap(30),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            TopIconsAndLabel(
              images: AssetsImages.sendWhite,
              label: "Send",
              backGroundColor: kPrimaryColor,
            ),
            Gap(40),
            TopIconsAndLabel(
                images: AssetsImages.recieveWhite,
                label: "Recieve",
                backGroundColor: kPrimaryColor),
          ],
        ),
        const Divider(
          color: kPrimaryColor,
        )
      ],
    );
  }
}
