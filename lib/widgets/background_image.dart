import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return LinearGradient(
                colors: [Colors.black, Colors.black12],
                begin: Alignment.bottomCenter,
                end: Alignment.center)
            .createShader(bounds);
      },
      blendMode: BlendMode.darken,
      child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: const AssetImage('assets/images/HR-career.png'),
                fit: BoxFit.cover,
                colorFilter:
                    const ColorFilter.mode(Colors.black45, BlendMode.darken))),
      ),
    );
  }
}
