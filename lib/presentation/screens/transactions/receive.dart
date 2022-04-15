import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hodl/bloc/wallet_bloc.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../../components/copy_button.dart';
import '../../../configs/configs.dart';

class ReceiveScreen extends StatelessWidget {
  const ReceiveScreen({Key? key, required this.address}) : super(key: key);
  final String address;
//git remote set-url origin https://github.com/jhaym3s/wallet.git

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppBar(
          backgroundColor: kPrimaryColor,
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: kWhite,
              )),
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
      ],
    );
  }
}
