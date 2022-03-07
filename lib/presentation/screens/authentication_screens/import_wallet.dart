import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hodl/presentation/widgets/authentication_widgets/keyphrase_chip.dart';

class ImportWallet extends StatefulWidget {
  static const routeName = "/import_wallet";
  const ImportWallet({Key? key}) : super(key: key);

  @override
  State<ImportWallet> createState() => _ImportWalletState();
}

class _ImportWalletState extends State<ImportWallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: SafeArea(
      //     child: SingleChildScrollView(
      //   child: Column(
      //     children: [
      //       const Text("Write down your Secret Recovery Phrase"),
      //       const Text(
      //           "This is your Secret Recovery Phrase. Write it down on a paper and keep it in a sfe place.You’ll be asked to re-enter this phrase (in order) on the next step."),
      //       const Gap(20),
      //       Container(
      //         child: Wrap(
      //           children: const [
      //             KeyPhraseChip(label: "what"),
      //             KeyPhraseChip(label: "what"),
      //             KeyPhraseChip(label: "what"),
      //             KeyPhraseChip(label: "what"),
      //             KeyPhraseChip(label: "what"),
      //             KeyPhraseChip(label: "what"),
      //             KeyPhraseChip(label: "what"),
      //             KeyPhraseChip(label: "what"),
      //             KeyPhraseChip(label: "what"),
      //           ],
      //         ),
      //       ),
      //       ElevatedButton(onPressed: () {}, child: const Text("Copy Phrase")),
      //     ],
      //   ),
      // )),
    body: SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
            children: [
              const Text("Write down your Secret Recovery Phrase"),
              const Text(
                  "This is your Secret Recovery Phrase. Write it down on a paper and keep it in a safe place.You’ll be asked to re-enter this phrase (in order) on the next step."),
              const Gap(20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:20.0, vertical: 10),
                child: Container(
                  decoration: const BoxDecoration(),
                  child: Wrap(
                    children: const [
                      KeyPhraseChip(label: "what"),
                      KeyPhraseChip(label: "Recovery"),
                      KeyPhraseChip(label: "what"),
                      KeyPhraseChip(label: "keep"),
                      KeyPhraseChip(label: "Secret"),
                      KeyPhraseChip(label: "what"),
                      KeyPhraseChip(label: "place"),
                      KeyPhraseChip(label: "enter"),
                      KeyPhraseChip(label: "down"),
                    ],
                  ),
                ),
              ),
              ElevatedButton(onPressed: () {}, child: const Text("Copy Phrase")),
            ],
          ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: () => {},
                child: const Text("Continue")
              ),
            ),
          )
        ],
      ),
    ),
    );
  }
}
