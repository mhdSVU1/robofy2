import 'package:flutter/material.dart';
import 'package:flutter_fire_trips/constants/const_colors.dart';
import 'custom_text.dart';

class CustomRoundedButton extends StatelessWidget {
  final String text;
  final Function onPress;
  final Color color, textColor;
  final double size;
  final double widthFactor;
  final double heightFactor;
  final double minHieght;
  final double minWidth;

  const CustomRoundedButton({
    Key key,
    this.text,
    this.onPress,
    this.color = myPrimaryLightColor1,
    this.textColor = Colors.white,
    this.size,
    this.widthFactor: 0.8,
    this.heightFactor: 0.07,
    this.minHieght: 80.0,
    this.minWidth: 150,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: minHieght, minWidth: minWidth),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        width: size.width * widthFactor,
        height: size.height * heightFactor,
        child: ElevatedButton(
            child: CustomText(
              text: text,
              color: textColor,
              size: this.size,
            ),
            onPressed: onPress,
            style: ElevatedButton.styleFrom(
                elevation: 11.0,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(29),
                ),
                shadowColor: const Color(0xFFE09EDD),
                onSurface: Colors.white,
                onPrimary: color)),
      ),
    );
  }
}
