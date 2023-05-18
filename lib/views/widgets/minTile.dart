import 'package:flutter/material.dart';

import '../../constants.dart';

class minTile extends StatelessWidget {
  const minTile({
    super.key,
    required this.height,
    required this.column,
  });

  final double height;
  final Widget column;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(height * .002),
      child: Container(
        height: height * .17,
        decoration: BoxDecoration(
          color: textColor.withOpacity(.3),
          borderRadius: BorderRadius.circular(25),
        ),
        child: column,
      ),
    );
  }
}
