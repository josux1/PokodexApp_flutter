import 'package:card_loading/card_loading.dart';
import 'package:flutter/material.dart';

class GridLoad extends StatelessWidget {
  const GridLoad({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GridView.builder(
        itemCount: 8,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 5.0,
          mainAxisSpacing: 5.0,
        ),
        itemBuilder: (contex, index) {
          return Padding(
            padding: EdgeInsets.only(
              left: size.height * 0.012,
              right: size.height * 0.012,
              bottom: size.height * 0.012,
            ),
            child: Align(
              child: CardLoading(
                height: size.height * 0.2,
                width: size.width * 0.48,
                borderRadius: 15,
                margin: const EdgeInsets.only(bottom: 10),
              ),
            ),
          );
        });
  }
}
