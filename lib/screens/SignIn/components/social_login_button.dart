import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wefresco/constants.dart';

class SocialLoginButton extends StatelessWidget {
  final press;
  final socialMethod;
  const SocialLoginButton({
    Key key,
    this.press,
    this.socialMethod,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(kBorderRadiusValue),
      child: Container(
        color: kGreyLight200,
        child: IconButton(
            icon: socialMethod == "google"
                ? SvgPicture.asset("assets/icons/google_login.svg")
                : SvgPicture.asset("assets/icons/facebook_login.svg"),
            iconSize: size.height * 0.04,
            padding: EdgeInsets.all(size.height * 0.02),
            onPressed: press),
      ),
    );
  }
}
