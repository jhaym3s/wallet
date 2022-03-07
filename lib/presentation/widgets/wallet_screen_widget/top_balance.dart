import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hodl/presentation/widgets/copy_button.dart';
import 'package:hodl/presentation/widgets/wallet_screen_widget/top_icons.dart';

import '../../../configs/configs.dart';

class TopBalance extends StatefulWidget {
  const TopBalance({Key? key}) : super(key: key);

  @override
  State<TopBalance> createState() => _TopBalanceState();
}

String dropdownValue = "USD";

class _TopBalanceState extends State<TopBalance> {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Container(
      width: deviceSize.width,
      height: deviceSize.height / 3,
      color: const Color.fromARGB(248, 250, 250, 250),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal:20.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Gap(30),
                const Padding(
                  padding: EdgeInsets.only(left: 25.0),
                  child: Text("Account 1"),
                ),
                DropdownButton<String>(
                  value: dropdownValue,
                  elevation: 0,
                  style: const TextStyle(color: kBlack),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                    });
                  },
                  items: <String>['USD', 'EUR', 'GPB', 'JPY']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
            const Text(
              "\$0.0",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 40),
            ),
            const Gap(10),
            const CopyButton(text: Text("0xa64f....8987"), value: "0x"),
            const Gap(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                TopIconsAndLabel(iconData: Icons.send, label: "Send"),
                TopIconsAndLabel(iconData: Icons.send, label: "Send"),
                TopIconsAndLabel(iconData: Icons.send, label: "Send"),
                TopIconsAndLabel(iconData: Icons.send, label: "Send")
              ],
            ),
          ],
        ),
      ),
    );
  }
}
