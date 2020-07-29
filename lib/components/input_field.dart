import 'package:flutter/material.dart';
import 'package:wefresco/constants.dart';

class InputField extends StatelessWidget {
  final textPlaceHolder;
  const InputField({
    Key key, this.textPlaceHolder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kGreyLight200,
        borderRadius: new BorderRadius.circular(kBorderRadiusValue),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: TextFormField(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 8),
            labelText: textPlaceHolder,
            labelStyle:
            TextStyle(color: Color(0xFFADB5BD), fontSize: 15.0),
            focusColor: kGreyLight200,
            border: InputBorder.none,
            fillColor: kGreyLight200,
          ),
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(
            fontFamily: kPrimaryFontName,
          ),
        ),
      ),
    );
  }
}
