import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:wefresco/constants.dart';

class RoundedButtonLoading extends StatelessWidget {
  final String text;
  final Icon icon;
  final width;
  final Function press;
  final Widget child;
  final double padding_vertical, padding_horizontal;
  final Color color, textColor, iconColor;
  const RoundedButtonLoading({
    Key key,
    this.text,
    this.press,
    this.color = kPrimaryColor,
    this.textColor = Colors.white,
    this.iconColor = Colors.white,
    this.icon,
    this.padding_vertical,
    this.padding_horizontal,
    this.width = 0.5, this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * width,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.4),
            blurRadius: 15,
            spreadRadius: 2,
            offset: Offset(0, 10), //// changes position of shadow
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(kBorderRadiusValue),
        child: RaisedButton(
          padding: EdgeInsets.symmetric(
              vertical: padding_vertical, horizontal: padding_horizontal),
          color: color,
          onPressed: press,
          child: child,
        ),
      ),
    );
  }
}
