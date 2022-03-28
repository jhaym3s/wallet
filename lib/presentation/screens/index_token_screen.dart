import 'package:flutter/material.dart';

class IndexTokenScreen extends StatefulWidget {
  static const routeName = "/index_token_screen";
  const IndexTokenScreen({Key? key}) : super(key: key);

  @override
  State<IndexTokenScreen> createState() => _IndexTokenScreenState();
}

class _IndexTokenScreenState extends State<IndexTokenScreen> {

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [],
      )),
    );
  }
}
