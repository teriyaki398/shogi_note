import 'package:flutter/material.dart';

class ShogiBoardView extends StatelessWidget {
  static const int rowNum = 9;
  static const int colNum = 9;

  final String sfen;

  const ShogiBoardView({Key? key, required this.sfen}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Stack(
      children: [
        const AspectRatio(aspectRatio: 1.0),
        AspectRatio(
            aspectRatio: 1.0,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: rowNum),
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black45),
                  ),
                  child: _getPiece(sfen, index),
                );
              },
              itemCount: rowNum * colNum,
              shrinkWrap: true,
            ))
      ],
    ));
  }

  Text _getPiece(String sfen, int index) {
    // TODO: Implement
    return Text("$index" + sfen);
  }
}
