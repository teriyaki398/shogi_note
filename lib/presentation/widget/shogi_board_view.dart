import 'package:flutter/material.dart';

class ShogiBoardView extends StatelessWidget {
  final String? sfen;
  final double? size;

  const ShogiBoardView({Key? key, this.sfen, this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Stack(
      children: [
        const AspectRatio(aspectRatio: 1.0),
        AspectRatio(
            aspectRatio: 1.0,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 9),
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black45),
                  ),
                  child: _getPiece("sfen", index),
                );
              },
              itemCount: 81,
              shrinkWrap: true,
            ))
      ],
    ));
  }

  Text _getPiece(String sfen, int index) {
    // TODO: Implement
    return Text("$index" + this.sfen!);
  }
}
