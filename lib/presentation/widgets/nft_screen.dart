import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hodl/configs/configs.dart';
import 'package:url_launcher/url_launcher.dart';

class NftScreen extends StatelessWidget {
  const NftScreen({
    Key? key,
  }) : super(key: key);

  final bool isAvailable = false;
  final String url = "https://opensea.io/";

  @override
  Widget build(BuildContext context) {
    return isAvailable
        ? GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            itemCount: 10,
            itemBuilder: (BuildContext ctx, index) {
              return Container(
                alignment: Alignment.center,
                child: const Text("Text"),
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(15)),
              );
            })
        : Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(" Collectives will appear here"),
                const Gap(10),
                TextButton(
                    onPressed: () async {
                      if (!await launch(
                        url,
                        forceSafariVC: true,
                        forceWebView: true,
                        enableDomStorage: true,
                      )) {
                        throw 'Could not launch $url';
                      }
                    },
                    child: Text("Open on opensea.io",
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                            color: kPrimaryColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)))
              ],
            ),
          );
  }
}
