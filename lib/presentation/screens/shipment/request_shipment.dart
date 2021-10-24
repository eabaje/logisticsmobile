import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:logisticsmobile/presentation/screens/shipment/ProgressBar.dart';
import 'package:logisticsmobile/presentation/screens/shipment/ServiceDropdown.dart';
import 'package:logisticsmobile/presentation/widgets/form/form_datepicker.dart';
import 'package:logisticsmobile/presentation/widgets/form/form_dropdown.dart';
import 'package:logisticsmobile/presentation/widgets/form/form_text_input.dart';

class RequestShipmentApp extends StatelessWidget {
  const RequestShipmentApp({ Key? key }) : super(key: key);


   @override
  Widget build(BuildContext context) {
    return MaterialApp( //use MaterialApp() widget like this
      home: RequestShipment() //create new widget class for this 'home' to 
                   // escape 'No MediaQuery widget found' error
    );
  }
}



class RequestShipment extends StatefulWidget {
  @override
  _RequestShipmentAppState createState() => _RequestShipmentAppState();



}

class _RequestShipmentAppState extends State<RequestShipment> {

   late TextEditingController? _shipper, _company,
   _loadType,_loadcategory,_loadWeight,_loadUnit,_qty,
   _description,_pickUpLocation,_deliveryLocation,_expectedPickUpDate,_expectedDeliveryDate,
   _requestForShipment,_assignedShipment,_shipmentDate
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
    _shipper = TextEditingController();
    _company = TextEditingController();
     _loadType = TextEditingController();
    _loadcategory = TextEditingController();

 _loadWeight = TextEditingController();
    _loadUnit = TextEditingController();

 _qty = TextEditingController();
_description = TextEditingController();
_pickUpLocation = TextEditingController();
_deliveryLocation = TextEditingController();
_expectedPickUpDate = TextEditingController();
_expectedDeliveryDate = TextEditingController();
_requestForShipment = TextEditingController();
 _assignedShipment = TextEditingController();
_shipmentDate = TextEditingController();

    // _shipper?.addListener(() {
    //   setState(() {
    //     enableSignIn = (_shipper?.text.isNotEmpty ?? false) &&
    //         (_shipper?.text.isNotEmpty ?? false);
    //   });
    // });
   
   
  }

  @override
  void dispose() {
    _shipper?.dispose();
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
                controller: _shipper!,
                label:"Shipper Name" ,
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
                 flex: 6,
                
                   child:  FormDropdownInput(
                  controller:_loadType ,
                 // hintText: "Load Type",
                  options: const ["Select Load Type","FullContainer", "PartContainer", "Item"],
                  value:_currentItemSelected,
                  onChanged: (String? newvalue) {
                    setState(() {
                            _currentItemSelected = newvalue!;
                // state.didChange(newValue);
                        });
                    },
                 getLabel: (String value) => value,
                ),
                 ),
            
               Expanded(
                 flex:4,
       
              
                 child:  FormTextField(
                  controller: _loadWeight!,
                  label:"Weight" ,
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
                 flex:6,
       
              
                 child:  FormTextField(
                controller: _qty!,
                label:"Qty" ,
               //  suffix:const Icon(Icons.production_quantity_limits),
                validator:RequiredValidator(errorText: "Required"),
                ),
               ),
                
              //  const  SizedBox( height: 30),
                 Expanded(
                 flex: 4,
                
                   child: FormDropdownInput(
                  controller:_loadUnit ,
                 // hintText: "Load Type",
                  options: const ["Ton","Kg"],
                  value:_currentUnitSelected,
                  onChanged: (String? newvalue) {
                    setState(() {
                            _currentUnitSelected = newvalue!;
                // state.didChange(newValue);
                        });
                    },
                 getLabel: (String value) => value,
                ),
                 ),
            
            ]
            ),
                
             
            //  const SizedBox( height: 30),

               FormTextField(
                controller: _description!,
                label:"Load Description" ,
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
