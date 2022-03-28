import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hodl/configs/configs.dart';

class CopyButton extends StatelessWidget {
  const CopyButton({
    Key? key,
    required this.text,
    required this.value,
    required this.radius,
    this.color = Colors.transparent,
  }) : super(key: key);

  final Text text;
  final String? value;
  final double radius;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
     style: ButtonStyle(
       backgroundColor:
                      MaterialStateProperty.all<Color>(color),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius),
                  side: const BorderSide(
                      color: kBlack, 
                      width: 2.0,
                  ),
              ),
          ),
      ),
      child: text,
      onPressed: () {
        Clipboard.setData(ClipboardData(text: value));
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Copied'),
        ));
      },
    );
  }
}
