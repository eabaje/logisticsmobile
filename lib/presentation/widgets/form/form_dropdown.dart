

import 'package:flutter/material.dart';

class FormDropdownInput<T> extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final List<T> options;
  final T? value;
 final String Function(T) getLabel;
  final void Function(T?) onChanged;

  FormDropdownInput({
      this.controller,
    this.hintText = 'Please select an Option',
    this.options = const [],
    required this.getLabel,
     this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(13, 0.0, 13, 0.0),
   child: FormField<T>(
      builder: (FormFieldState<T> state) {
        
        return InputDecorator(
          decoration: InputDecoration(
            
             contentPadding:const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
            
            hintStyle:Theme.of(context).textTheme.bodyText1,

           // labelText: hintText,
            // border:
            //     OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),
          ),
          
          // isEmpty: value == null || value == '',
          child: DropdownButtonHideUnderline(
            child: DropdownButton<T>(
              
              value: value!,
              style: Theme.of(context).textTheme.bodyText1,
             // dropdownColor:Colors.grey ,
              icon: const Icon(Icons.arrow_drop_down),
              isDense: true,
               onChanged:onChanged, 
              
              items: options.map((T value) {
                return DropdownMenuItem<T>(
                  value: value,
                  child: Text(getLabel(value)),
                );
              }).toList(),
            ),
          ),
        );
      },
    ),
  
     );
  
  }
}



//Implemetation example
// AppDropdownInput(
//             hintText: "Gender",
//             options: ["Male", "Female"],
//             value: gender,
//             onChanged: (String value) {
//               setState(() {
//                 gender = value;
//                 // state.didChange(newValue);
//               });
//             },
//             getLabel: (String value) => value,
//           )