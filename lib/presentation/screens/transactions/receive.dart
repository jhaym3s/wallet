import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:hodl/bloc/wallet_bloc.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../components/copy_button.dart';
import '../../../configs/configs.dart';

class ReceiveScreen extends StatelessWidget {
  const ReceiveScreen({Key? key, required this.address}) : super(key: key);
  final String address;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(top:18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(child: Image.asset(AssetsImages.purpleLogo,height: 40, width: 40,)),
              Text("Hodl", style: Theme.of(context).textTheme.bodyText1!.copyWith(color: kPrimaryColor))
            ],
          ),
        ),
        QrImage(
          data: address,
          size: kScreenWidth(context) / 2,
        ),
        CopyButton(
          text: Text(
            "Copy Address",
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(color: kPrimaryColor, fontWeight: FontWeight.bold),
          ),
          value: address,
          radius: 18,
          color: kWhite,
        ),
       const Gap(10)
      ],
    );
  }
}
