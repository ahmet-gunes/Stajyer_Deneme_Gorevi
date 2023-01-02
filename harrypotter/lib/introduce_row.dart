import 'package:flutter/material.dart';
import 'package:harrypotter/color_constants.dart';

Row introduceRow(String soru, String cevap, double dividerHeight) {
  return Row(
    children: [
      Text(
        '${soru}:  ',
        style: TextStyle(
            fontSize: 20,
            color: ColorConstants.siyah,
            fontWeight: FontWeight.bold),
      ),
      Text(
        cevap,
        style: TextStyle(
            fontSize: 20,
            color: ColorConstants.mavi2,
            fontStyle: FontStyle.italic),
      ),
      Divider(
        height: dividerHeight,
      )
    ],
  );
}
