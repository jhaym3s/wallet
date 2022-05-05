import 'package:flutter/material.dart';


class LayoutWidget extends StatelessWidget {
  const LayoutWidget({Key? key, required this.columnChild}) : super(key: key);
  final Widget columnChild;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: viewportConstraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: columnChild
              ),
            ),
          );
        },
    );
  }
}
