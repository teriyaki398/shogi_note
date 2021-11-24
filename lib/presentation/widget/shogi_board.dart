import 'package:flutter/material.dart';

class ShogiBoard extends StatefulWidget {
  final double? size;

  const ShogiBoard({Key? key, this.size}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ShogiBoardState();
}

class _ShogiBoardState extends State<ShogiBoard> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: widget.size,
        height: widget.size,
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
    return const Text(' ');
  }
}