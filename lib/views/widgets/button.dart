import 'package:flutter/material.dart';
import 'package:weather_ap/constants.dart';

class button extends StatelessWidget {
  const button({
    super.key,
    required this.function,
    required this.label,
  });

  final String label;
  final void Function()? function;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => function!(),
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all(primaryColor.withOpacity(.1)),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        overlayColor: MaterialStateProperty.all(primaryColor.withOpacity(.1)),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: textColor,
        ),
      ),
    );
  }
}
