import 'package:flutter/material.dart';
import 'package:wefresco/constants.dart';

class BackButtonCustom extends StatelessWidget {
  const BackButtonCustom({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(kBorderRadiusValue),
      child: Container(
        color: kGreyLight200,
        child: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: kBlackLight,
          ),
          iconSize: 20,
          padding: EdgeInsets.all(15),
          onPressed:(){
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}