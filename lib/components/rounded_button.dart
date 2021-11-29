import 'package:flutter/material.dart';
import 'package:flutter_fire_trips/Constants/const_colors.dart';
import 'package:flutter_fire_trips/components/custom_text.dart';
class RoundedButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, textColor;
  final double size;
  final double width_factor;
  final double height_factor;

  const RoundedButton({
    Key key,
    this.text,
    this.press,
    this.color = kPrimaryColor,
    this.textColor = Colors.white, this.size, this.width_factor:0.8, this.height_factor:0.08,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * width_factor,
      height: size.height * height_factor,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: FlatButton(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          color: color,
          onPressed: press,
          child: CustomText(
            text:text,
            color: textColor,size: this.size,),
          ),
        ),

    );
  }
}
