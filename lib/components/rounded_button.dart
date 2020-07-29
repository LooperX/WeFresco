import 'package:flutter/material.dart';
import 'package:wefresco/constants.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Icon icon;
  final Function press;
  final Color color, textColor, iconColor;
  const RoundedButton({
    Key key,
    this.text,
    this.press,
    this.color = kPrimaryColor,
    this.textColor = Colors.white,
    this.iconColor = Colors.white,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.7,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.5),
            blurRadius: 50,
            offset: Offset(0, 10), //// changes position of shadow
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: FlatButton(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          color: color,
          onPressed: press,
          child: icon != null
              // if has icon, render this
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(
                      width: size.width * 0.01,
                    ),
                    Text(
                      text,
                      style: TextStyle(
                          fontFamily: 'Nunito',
                          color: textColor,
                          fontSize: 20.0),
                    ),
                    icon,
                  ],
                )
              // otherwise, render this
              : Text(
                  text,
                  style: TextStyle(
                      fontFamily: 'Nunito', color: textColor, fontSize: 20.0),
                ),
        ),
      ),
    );
  }
}
