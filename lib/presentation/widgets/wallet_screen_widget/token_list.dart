import 'package:flutter/material.dart';

class TokenList extends StatelessWidget {
  const TokenList({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (BuildContext context, int index) { 
      return Padding(
        padding: const EdgeInsets.only(top:10.0),
        child: ListTile(
          leading:const  CircleAvatar(),
          title: const Text("Hi"),
          subtitle: const Text("Small Hi"),
          trailing: Column(
            children: const [
              Text("Hi"),
              Text("Hi")
            ],
          ),
        ),
      );
     },
      
    );
  }
}