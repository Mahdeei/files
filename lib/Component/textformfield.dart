import 'package:flutter/material.dart';
import 'package:stubbbb/Other/SizeConfig.dart';

class InputTextForm extends StatelessWidget {
  final String lable;
  Color errColor = Colors.red;
  var validate;
  final obscure;
  final controller;
  final Color color;
  final Color textColor;
  final lableColor;
  final onSaved;
  var maxLine;
  InputTextForm({
    this.maxLine,
    this.errColor,
    this.lable,
    this.validate,
    this.obscure,
    this.controller,
    this.color,
    this.textColor,
    this.lableColor,
    this.onSaved,
    // this.hint
  });
  @override
  Widget build(BuildContext context) {
    return new TextFormField(
      maxLines: maxLine,
      controller: controller,
      validator: validate,
      onSaved: onSaved,
      obscureText: obscure,
      cursorColor: color,
      style: TextStyle(color: color,fontSize: SizeConfig.heightMultiplier*2.3),

      decoration: InputDecoration(
        errorStyle: TextStyle(color: errColor,fontSize: SizeConfig.textMultiplier*1.7),

          // hintText: hint,
          // // prefixIcon: Icon(
          //   iconData,
          //   color: Colors.white,
          // ),
          labelText: lable,
          labelStyle: TextStyle(color: lableColor,fontSize: SizeConfig.textMultiplier*2.3),
          border:
              UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          fillColor: color,
          focusColor: color,
          hoverColor: color,
          enabledBorder:
              UnderlineInputBorder(borderSide: BorderSide(color: color))),
    );
  }
}
