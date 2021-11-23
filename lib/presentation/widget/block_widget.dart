import 'package:flutter/material.dart';

class BlockWidget extends StatelessWidget {
  const BlockWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.all(32),
        child: Text(
          'Test',
          softWrap: true,
        ));
  }
}
