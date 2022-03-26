import 'package:flutter/material.dart';
import 'package:hodl/configs/configs.dart';

class InfoScreen extends StatefulWidget {
  static const routeName = "info_screen";
  const InfoScreen({ Key? key }) : super(key: key);

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: SafeArea(child: Column(
       children: [
         
       ],
     )),
    );
  }
}