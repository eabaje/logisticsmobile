import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import '../../common/constants/size_constants.dart';
import '../../common/constants/translation_constants.dart';
import '../../common/extensions/size_extensions.dart';
import '../../common/extensions/string_extensions.dart';
import 'button.dart';

class ContryList extends StatelessWidget {
  // final String title, description, buttonText;
   
  final  void Function(CountryCode)? onChanged;
  const ContryList({
    Key? key,
   this.onChanged
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: Sizes.dimen_4.h,
        left: Sizes.dimen_16.w,
        right: Sizes.dimen_16.w,
      ),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor,
            blurRadius: Sizes.dimen_16,
          ),
        ],
      ),
      child: CountryCodePicker(
    initialSelection: 'NG',
    showCountryOnly: false,
     showOnlyCountryWhenClosed: true,
     favorite:['',''], // optional. Shows phone code before the country name.
     enabled:true,
     hideMainText:true,
     showFlagMain:true,
     showFlag:true,
     hideSearch:false,
     showFlagDialog:false,
    alignLeft:true,
    padding:const EdgeInsets.all(16.0),
    onChanged: onChanged
      
    )
  );
    
  }
}
