
import 'package:flutter/material.dart';

class FormTextField extends StatelessWidget {
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final bool obsecure;
  final bool readOnly;
  final VoidCallback? onTap;
  final VoidCallback? onEditingCompleted;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;
  final bool isMulti;
  final bool autofocus;
  final bool enabled;
  final String? errorText;
  final Icon? icon;
  final String? label;
  final Widget? suffix;
  final Widget? prefix;
 

  FormTextField(
      {Key? key,
      this.controller,
      this.validator,
      this.keyboardType = TextInputType.text,
      this.obsecure = false,
      this.onTap,
      this.isMulti = false,
      this.readOnly = false,
      this.autofocus = false,
      this.errorText,
      this.icon,
      @required this.label,
      this.suffix,
      this.prefix,
      this.enabled = true,
      this.onEditingCompleted,
      this.onChanged
      
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.fromLTRB(13, 0.0, 13, 0.0),
      child: TextFormField(
          onChanged: onChanged,
          onEditingComplete: onEditingCompleted,
          autofocus: autofocus,
          minLines: isMulti ? 3 : 1,
          maxLines: isMulti ? null : 1,
          onTap: onTap,
          enabled: enabled,
          readOnly: readOnly,
          obscureText: obsecure,
          keyboardType: keyboardType,
          controller: controller,
          style:Theme.of(context).textTheme.bodyText1,
          decoration: InputDecoration(
            icon: icon,
            errorText: errorText,
            prefixIcon: prefix,
            suffixIcon: suffix    ,//?? buildTextFieldCondition()
          //  focusedBorder: UnderlineInputBorder(
          //                     borderSide: new BorderSide(color: Colors.black),
          //                   ),
            labelText: label,
            hintStyle:Theme.of(context).textTheme.bodyText1,
            contentPadding:const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
           
          ),
          
          validator: validator,
    ),
    );
  }

Container buildTextFieldCondition() {
    return Container(
      width: 10,
      alignment: Alignment.topRight,
      padding: const EdgeInsets.only(right: 5.0),
      child:const Text(
        "*",
        style: TextStyle(color: Colors.red),
      ),
    );
  }

  Container buildTextFieldLabel() {
    return Container(
      alignment: Alignment.centerLeft,
      width: 90,
      height: 40,
      margin: const EdgeInsets.only(right: 10.0),
      padding: const EdgeInsets.only(left: 10.0),
      child: Text(
        label!,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
      ),
    );
  }




}



// labelStyle: TextStyle(fontSize: lableFontSize()),
//  enabledBorder: textFieldfocused(),
//  border: textFieldfocused(),
//             focusedBorder: textFieldfocused(),
//             errorBorder: errorrTextFieldBorder(),
//             focusedErrorBorder: errorrTextFieldBorder(),