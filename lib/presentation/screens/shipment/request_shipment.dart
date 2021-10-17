import 'package:flutter/material.dart';
import 'package:logisticsmobile/presentation/screens/shipment/BuildFormField.dart';
import 'package:logisticsmobile/presentation/screens/shipment/ProgressBar.dart';
import 'package:logisticsmobile/presentation/screens/shipment/ServiceDropdown.dart';

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
  Map<String, bool> services = {
    "Construction Site": true,
    "Courier Service": false,
    "Drayage Site": false,
    "Dropped Trailer": false,
    "Inside Service": false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            appHeader(),
            ProgressBar(),
            buildInfoMsg(),
            BuildFormField("Company Name", "Shipper"),
            BuildFormField("Address", "Location"),
            BuildFormField("Optional", "BOL#"),
            buildServiceField("Service Mode", "Transit Service"),
            buildPickupServicesHeader(),
            buildPickupServices(),
            buildServiceField("Date Pickup Requested", "Date Pickup \nActual"),
            buildNavigationButtons()
          ],
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
