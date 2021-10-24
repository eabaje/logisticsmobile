import 'package:flutter/material.dart';


class FormFieldWidget extends StatelessWidget {
  final Key? textFieldKey;
  final String label;
  final String hintText;
  final bool isPasswordField;
  final TextEditingController controller;

  const FormFieldWidget({
    Key? key,
    required this.label,
    required this.hintText,
    required this.controller,
    this.isPasswordField = false,
    this.textFieldKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(13, 0.0, 13, 0.0),
      child: TextField(
       controller:controller ,
       obscureText: isPasswordField,
        obscuringCharacter: '*',
        decoration: InputDecoration(
          hintText: hintText,
          border: OutlineInputBorder(
            borderRadius:  BorderRadius.all(Radius.circular(0.0)),
          ),
          
          prefixIcon: buildTextFieldLabel(),
          suffixIcon: buildTextFieldCondition(),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.grey,
          )),
        ),
      ),
    );
  }


  Container buildTextFieldCondition() {
    return Container(
      width: 10,
      alignment: Alignment.topRight,
      padding: EdgeInsets.only(right: 5.0),
      child: Text(
        "*",
        style: TextStyle(color: Colors.red),
      ),
    );
  }

  Container buildTextFieldLabel() {
    return Container(
      alignment: Alignment.centerLeft,
      width: 90,
      height: 59,
      margin: EdgeInsets.only(right: 10.0),
      padding: const EdgeInsets.only(left: 10.0),
      child: Text(
        label,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
      ),
    );
  }

}




