

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FormDatepickerInput<T> extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final String? label;
  final List<T>? options;
  final T? value;
  final String Function(T)? getLabel;
  final void Function(T)? onChanged;

  FormDatepickerInput({
      this.controller,
    this.hintText = 'Please select date',
     this.label,
    this.options = const [],
    this.getLabel,
    this.value,
   this.onChanged,
  });

 

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(13, 0.0, 13, 0.0),
      child: TextFormField(
       controller:controller ,
       obscuringCharacter: '*',
        decoration: InputDecoration(
           suffixIcon: const Icon(Icons.calendar_today), //icon of text field
         // labelText: "Enter Date", //label text of field
          hintText: hintText,
          // border: OutlineInputBorder(
          //   borderRadius: BorderRadius.all(Radius.circular(0.0)),
            
          // ),
          
          // prefixIcon: buildTextFieldLabel(),
          // suffixIcon: buildTextFieldCondition(),
          focusedBorder: UnderlineInputBorder(
                              borderSide: new BorderSide(color: Colors.black),
                            ),
        ),
      
             readOnly: true,  //set it true, so that user will not able to edit text
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context, initialDate: DateTime.now(),
                      firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                      lastDate: DateTime(2101)
                  );
                if(pickedDate != null ){
                     // print(pickedDate);  //pickedDate output format => 2021-03-10 00:00:00.000
                      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate); 
                    //  print(formattedDate); //formatted date output using intl package =>  2021-03-16
                        //you can implement different kind of Date Format here according to your requirement
                        controller!.text=formattedDate;
                      // setState(() {
                      //    dateinput.text = formattedDate; //set output date to TextField value. 
                      // });
                  }else{
                      print("Date is not selected");
                  }
                }
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
        label!,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
      ),
    );
  }

}







