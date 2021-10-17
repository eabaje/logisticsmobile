import 'package:flutter/material.dart';

class BuildFormField extends StatefulWidget {
  final String hintText;
  final String label;

  BuildFormField(this.hintText, this.label);

  @override
  _FormFieldState createState() => _FormFieldState();
}

class _FormFieldState extends State<BuildFormField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(13, 0.0, 13, 0.0),
      child: TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          hintText: widget.hintText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(0.0)),
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
        widget.label,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
      ),
    );
  }
}
