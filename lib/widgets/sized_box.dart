import 'package:flutter/material.dart';

class Wd extends StatelessWidget {
  final double? width;

  const Wd({super.key, this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 10,
    );
  }
}

class Hg extends StatelessWidget {
  final double? height;

  const Hg({super.key, this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 10,
    );
  }
}
