import 'package:flutter/material.dart';
import 'package:hodl/configs/constants.dart';

class ImportOptionButton extends StatelessWidget {
  const ImportOptionButton({ Key? key, required this.buttonText,required this.routeName}) : super(key: key);

  final String buttonText;
  final String routeName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: kScreenHeight(context),
        height: 70,
        child: ElevatedButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:  [
              Text(buttonText),
              const Icon(Icons.arrow_forward)
            ],
          ),
          style: OutlinedButton.styleFrom(
            elevation: 6,
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10), 
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
          onPressed: (){
            Navigator.of(context).pushNamed(routeName);
          },
        ),
      ),
    );
  }
}