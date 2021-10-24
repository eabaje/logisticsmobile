import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:logisticsmobile/presentation/screens/shipment/ProgressBar.dart';
import 'package:logisticsmobile/presentation/screens/shipment/ServiceDropdown.dart';
import 'package:logisticsmobile/presentation/widgets/form/form_datepicker.dart';
import 'package:logisticsmobile/presentation/widgets/form/form_dropdown.dart';
import 'package:logisticsmobile/presentation/widgets/form/form_text_input.dart';

class AddDriverForm extends StatefulWidget {
  const AddDriverForm({ Key? key }) : super(key: key);

  @override
  _AddDriverFormState createState() => _AddDriverFormState();
}

class _AddDriverFormState extends State<AddDriverForm> {
  late TextEditingController? _driverName, _company,
   _email,_phone,_address,_city,_country,
   _licensed,_licenseUrl,_rating,_driverDocs,_picUrl
   
   ;
  bool enableSignIn = false;
  String _currentItemSelected="Select Load Type";
  String _currentUnitSelected="Kg";
  
 final _formKey = GlobalKey<FormState>();

  Map<String, bool> services = {
    "Equipment": true,
    "Courier Service": false,
    "Drayage Site": false,
    "Dropped Trailer": false,
    "Inside Service": false,
  };

  @override
  void initState() {
    super.initState();
    _driverName = TextEditingController();
    _company = TextEditingController();
     _email = TextEditingController();
    _phone = TextEditingController();

 _address = TextEditingController();
    _city = TextEditingController();

 _country = TextEditingController();
_licensed = TextEditingController();
_licenseUrl = TextEditingController();
_rating = TextEditingController();
_driverDocs = TextEditingController();
_picUrl = TextEditingController();


    // _shipper?.addListener(() {
    //   setState(() {
    //     enableSignIn = (_shipper?.text.isNotEmpty ?? false) &&
    //         (_shipper?.text.isNotEmpty ?? false);
    //   });
    // });
   
   
  }

  @override
  void dispose() {
    _phone?.dispose();
    _company?.dispose();
    super.dispose();
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Form(
          key: _formKey ,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                appHeader(),
                ProgressBar(),
                buildInfoMsg(),
                FormTextField(
                controller: _driverName!,
                label:"Driver Name" ,
                suffix:const Icon(Icons.person, textDirection: TextDirection.rtl),
                validator:(value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
           
                ),
                FormTextField(
                controller: _company!,
                label:"Company Name" ,
                suffix:const Icon(Icons.corporate_fare),
                validator:RequiredValidator(errorText: "Required"),
                ),
                
              // const SizedBox( height: 30 ),

             Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
               Expanded(
                 flex:6,
       
              
                 child:  FormTextField(
                  controller: _email!,
                  label:"Email" ,
                //  suffix:const Icon(Icons.luggage),
                  validator:RequiredValidator(errorText: "Required"),
                  ),
               ),
            
               Expanded(
                 flex:4,
       
              
                 child:  FormTextField(
                  controller: _phone!,
                  label:"Phone" ,
                //  suffix:const Icon(Icons.luggage),
                  validator:RequiredValidator(errorText: "Required"),
                  ),
               ),
                
              //  const  SizedBox( height: 30),
                
            
            ]
            ),
               
                 
             //  const SizedBox( height: 30),
                 
              
            
            
                





              //  const SizedBox( height: 30),
             Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
               
            
               Expanded(
                 flex:5,
       
              
                 child:  FormTextField(
                controller: _address!,
                label:"Address" ,
               //  suffix:const Icon(Icons.production_quantity_limits),
                validator:RequiredValidator(errorText: "Required"),
                ),
               ),
                
              //  const  SizedBox( height: 30),
                 Expanded(
                 flex:5,
       
              
                 child:  FormTextField(
                controller: _city!,
                label:"City" ,
               //  suffix:const Icon(Icons.production_quantity_limits),
                validator:RequiredValidator(errorText: "Required"),
                ),
               ),
                
            
            ]
            ),
                
             
            //  const SizedBox( height: 30),

               FormTextField(
                controller: _country!,
                label:"Country" ,
                isMulti:true ,
                 suffix:const Icon(Icons.more),
                validator:RequiredValidator(errorText: "Required"),
                ),

            
            
           //  const SizedBox( height: 30),
            

            // const SizedBox( height: 30),

             Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
               
            
               Expanded(
                 flex:5,
       
              
                 child:   FormTextField(
                controller: _pickUpLocation!,
                label:"PickUp Location" ,
                // icon:const Icon(Icons.location_city),
                 suffix:const Icon(Icons.location_city) ,
                validator:RequiredValidator(errorText: "Required"),
                ),
               ),
                
              //  const  SizedBox( height: 30),
                 Expanded(
                 flex: 5,
                
                   child:     FormDatepickerInput(
                  controller:_expectedPickUpDate,
                  label: "Expected PickUp Date",



                ),
                 ),
            
            ]
            ),
                

                 Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
               
            
               Expanded(
                 flex:5,
       
              
                 child:   FormTextField(
                controller: _deliveryLocation!,
                label:"Delivery Location" ,
                // icon:const Icon(Icons.location_city),
                 suffix:const Icon(Icons.location_city) ,
                validator:RequiredValidator(errorText: "Required"),
                ),
               ),
                
              //  const  SizedBox( height: 30),
                 Expanded(
                 flex: 5,
                
                   child:     FormDatepickerInput(
                  controller:_expectedDeliveryDate,
                  label: "Expected Delivery Date",



                ),
                 ),
            
            ]
            ),
              
                buildServiceField("Service Mode", "Transit Service"),
                buildPickupServicesHeader(),
                buildPickupServices(),
                buildServiceField("Date Pickup Requested", "Date Pickup \nActual"),
                buildNavigationButtons()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column buildPickupServices() {
    return Column(
      children: services.keys.map((String key) {
        return CheckboxListTile(
          value: services[key],
          title: Text(key),
          activeColor: Colors.green,
          controlAffinity: ListTileControlAffinity.leading,
          onChanged: (bool? val) {
            setState(() {
              services[key] = val!;
            });
          },
        );
      }).toList(),
    );
  }

  Container buildPickupServicesHeader() => Container(
        alignment: Alignment.bottomLeft,
        padding: EdgeInsets.fromLTRB(20.0, 25.0, 0.0, 0.0),
        child: Text(
          "Pickup Services",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      );

  Row buildNavigationButtons() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          buildButton("Back", Colors.white, Colors.blue),
          buildButton("Next", Colors.black, Colors.white),
        ],
      );

  Container buildButton(String label, Color bgColor, Color textColor) =>
      Container(
        padding: EdgeInsets.only(top: 26.0, bottom: 26.0),
        width: 140,
        child: FlatButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: Text(
            label,
            style: TextStyle(color: textColor),
          ),
          color: bgColor,
          splashColor: Colors.grey,
          onPressed: () {
            debugPrint(label);
          },
        ),
      );

  Row buildServiceField(String label1, String label2) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[ServiceDropdown(label1), ServiceDropdown(label2)],
      );

  Container buildInfoMsg() {
    return Container(
      padding: EdgeInsets.all(18.0),
      child: RichText(
        text: TextSpan(
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            children: <TextSpan>[
              TextSpan(
                text: "* ",
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: "Indicates Required Field",
              ),
            ]),
      ),
    );
  }

  Container appHeader() {
    return Container(
      height: 80.0,
      color: Color(0xffe0e0e0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(11.5, 15.0, 0.0, 1.0),
            child: Text("Create Shipment", style: TextStyle(fontSize: 28.0)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 13.0),
            child:
                Text("Step 1 of 6 - Shipper", style: TextStyle(fontSize: 14.0)),
          )
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0.0,
      leading: Icon(Icons.menu, color: Colors.black),
      title: Container(
          alignment: Alignment.center,
          child: Image.asset("assets/images/s_icon.png")),
      actions: <Widget>[
        Container(
            child: Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 8.0, 2.0, 8.0),
          child: CircleAvatar(
            backgroundImage: AssetImage("assets/images/doll_icon.jpg"),
            radius: 20,
          ),
        )),
        Padding(
          padding: const EdgeInsets.only(right: 5.0),
          child: Icon(
            Icons.arrow_drop_down,
            color: Colors.black,
          ),
        )
      ],
    );
  }
}