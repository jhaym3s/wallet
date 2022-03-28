import 'package:flutter/material.dart';

import '../../../configs/configs.dart';

class Dapps extends StatefulWidget {
  static const routeName = "/dapps";
  const Dapps({Key? key}) : super(key: key);

  @override
  State<Dapps> createState() => _DappsState();
}

class _DappsState extends State<Dapps> {
  final TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: kBlack,
            // The search area here
            title: Container(
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(5)),
              child: Center(
                child: TextField(
                  controller: textEditingController,
                  cursorColor: kBlack,
                  
                  showCursor: false,
                  decoration: InputDecoration(
                    
                      prefixIcon: IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: () {},
                        color: kBlack,
                      ),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.clear),
                        color: kBlack,
                        onPressed: () {
                          setState(() {
                            textEditingController.text = " ";
                          });
                        },
                      ),
                      hintText: 'Enter website url',
                      border: InputBorder.none),
                ),
              ),
            )),
        body: const Center(
          child: Text("Your bookmarks will appear will appear"),
        ));
  }
}
