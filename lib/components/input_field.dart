import 'package:flutter/material.dart';
import 'package:wefresco/constants.dart';

class InputField extends StatefulWidget {
  final textPlaceHolder;
  final isPassword;
  final Function onChanged;
  final Function(String) callback;

  const InputField({
    Key key,
    this.textPlaceHolder,
    this.isPassword = false,
    this.onChanged,
    this.callback,
  }) : super(key: key);

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    String textValue = '';

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
            labelText: widget.textPlaceHolder,
            labelStyle: TextStyle(color: Color(0xFFADB5BD), fontSize: 15.0),
            focusColor: kGreyLight200,
            border: InputBorder.none,
            fillColor: kGreyLight200,
          ),
          obscureText: widget.isPassword ? true : false,
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(
            fontFamily: kPrimaryFontName,
          ),
          onChanged: (val) {
            setState(() {
              textValue = val;
              widget.callback(textValue);
            });
          },
        ),
      ),
    );
  }
}
