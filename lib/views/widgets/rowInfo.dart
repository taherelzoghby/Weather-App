import 'package:flutter/material.dart';

import '../../constants.dart';

class rowInfo extends StatelessWidget {
  const rowInfo({
    super.key,
    required this.label,
    required this.value,
  });
  final String label;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 16, color: textColor),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * .19,
          child: Text(
            value,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: textColor,
            ),
          ),
        ),
      ],
    );
  }
}
