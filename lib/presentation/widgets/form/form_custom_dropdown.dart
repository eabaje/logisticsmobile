import 'package:flutter/material.dart';

class ServiceDropdown extends StatefulWidget {
  final String label;

  const ServiceDropdown(this.label);

  @override
  _ServiceDropdownState createState() => _ServiceDropdownState();
}

class _ServiceDropdownState extends State<ServiceDropdown> {
  var dropDownValue = "LTL";

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            width: 130,
            margin: const EdgeInsets.fromLTRB(0, 25.0, 13, 0.0),
            child: Text(
              widget.label,
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
        DropdownButtonHideUnderline(
          child: Container(
            color: Color(0xffe0e0e0),
            margin: const EdgeInsets.fromLTRB(13, 6.0, 13, 0.0),
            padding: const EdgeInsets.only(left: 10.0),
            width: 150,
            child: ButtonTheme(
              alignedDropdown: true,
              child: buildDropdownButton(),
            ),
          ),
        ),
      ],
    );
  }

  DropdownButton<String?> buildDropdownButton() {
    return DropdownButton<String?>(
        value: dropDownValue,
        onChanged: (String? newValue) {
          setState(() {
            dropDownValue = newValue!;
          });
        },
        items: <String>["LTL", "SelectOne...", "SelectDate..."]
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
            //  style: TextStyle(fontWeight: FontWeight.bold),
            ),
          );
        }).toList());
  }
}
