import 'package:flutter/material.dart';

class BackgroundImageColorsLess extends StatelessWidget {
  final String assetimage;

  const BackgroundImageColorsLess({
    Key? key, required this.assetimage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(assetimage),
                fit: BoxFit.cover,
                colorFilter:
                    const ColorFilter.mode(Colors.black45, BlendMode.darken))),
      );
    
  }
}
