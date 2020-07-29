import 'package:flutter/material.dart';
import 'package:wefresco/constants.dart';

class SmallIconButton extends StatelessWidget {
  final Function press;
  final backgroundColor;
  final iconColor;
  final icon;
  const SmallIconButton({
    Key key,
    this.press,
    this.backgroundColor,
    this.iconColor,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: size.width * 0.09,
        height: size.width * 0.09,
        decoration: BoxDecoration(
          color: backgroundColor,
          boxShadow: [
            BoxShadow(
              color: kPrimaryColor.withOpacity(0.4),
              blurRadius: 15,
              spreadRadius: 2,
              offset: Offset(0, 10), // changes position of shadow
            ),
          ],
        ),
        child: Center(
          child: IconButton(
            iconSize: 20.0,
            icon: Icon(
              icon,
              color: iconColor,
            ),
            onPressed: press,
          ),
        ),
      ),
    );
  }
}
