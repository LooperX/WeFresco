import 'package:flutter/material.dart';
import 'package:wefresco/constants.dart';

class SmallIconButton extends StatelessWidget {
  final Icon icon;
  final Function press;
  const SmallIconButton({
    Key key, this.icon, this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        width: size.width * 0.08,
        height: size.width * 0.08,
        decoration: BoxDecoration(
          color: kPrimaryColor,
          boxShadow: [
            BoxShadow(
              color: kPrimaryColor.withOpacity(0.4),
              blurRadius: 15,
              spreadRadius: 2,
              offset: Offset(0, 10), //// changes position of shadow
            ),
          ],
        ),
        child: IconButton(
          iconSize: 18.0,
          icon: icon,
          onPressed: press,
        ),
      ),
    );
  }
}