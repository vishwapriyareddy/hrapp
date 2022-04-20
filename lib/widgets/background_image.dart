import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  final String assetimage;
final Color colors1;
final Color colors2;
  const BackgroundImage({
    Key? key, required this.assetimage, required this.colors1, required this.colors2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return LinearGradient(
                colors:  [colors1,colors2],
                begin: Alignment.bottomCenter,
                end: Alignment.center)
            .createShader(bounds);
      },
      blendMode: BlendMode.darken,
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(assetimage),
                fit: BoxFit.cover,
                colorFilter:
                    const ColorFilter.mode(Colors.black45, BlendMode.darken))),
      ),
    );
  }
}
