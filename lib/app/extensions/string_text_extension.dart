import 'package:firefolio/app/widgets/bouncing_text_widget.dart';
import 'package:flutter/material.dart';

extension StringTextX on String {
  Row toBouncingTextWidgets({
    Color textColor = Colors.white,
  }) =>
      Row(
        children: split('')
            .map(
              (text) => BouncingTextWidget(
                textWidget: Text(
                  text,
                  textScaleFactor: 6,
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: textColor,
                  ),
                ),
                scaleFactor: 3,
              ),
            )
            .toList(),
      );
}
