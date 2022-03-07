import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CopyButton extends StatelessWidget {
  const CopyButton({
    Key? key,
    required this.text,
    required this.value,
  }) : super(key: key);

  final Text text;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
     style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: const BorderSide(
                      color: Colors.teal, 
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
