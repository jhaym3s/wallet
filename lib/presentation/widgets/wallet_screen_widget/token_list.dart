import 'package:flutter/material.dart';

import '../../../configs/configs.dart';

class TokenList extends StatelessWidget {
  const TokenList({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (BuildContext context, int index) { 
      return Padding(
        padding: const EdgeInsets.only(top:10.0),
        child: ListTile(
          leading: CircleAvatar(backgroundColor: Colors.grey[300],),
          title:  Text("Etheruem",style: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.bold),),
          subtitle:  Text("\$400.00", style: Theme.of(context).textTheme.bodyText2!.copyWith(fontWeight: FontWeight.w500),),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children:  [
              Text("18 ETH",style: Theme.of(context).textTheme.headline6!.copyWith(fontWeight: FontWeight.w700),),
              Text("\$400.00",style: Theme.of(context).textTheme.bodyText2!.copyWith(fontWeight: FontWeight.w400),)
            ],
          ),
        ),
      );
     },
      
    );
  }
}