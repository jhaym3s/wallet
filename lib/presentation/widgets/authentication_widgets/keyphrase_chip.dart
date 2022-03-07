import 'package:flutter/material.dart';

class KeyPhraseChip extends StatelessWidget {
  const KeyPhraseChip({ Key? key, required this.label}) : super(key: key);
  final String label;

  @override
  Widget build(BuildContext context) {
    return Chip(label: Text(label),
      
    );
  }
}