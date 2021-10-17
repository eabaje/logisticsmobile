import 'package:flutter/material.dart';
import 'package:logisticsmobile/presentation/screens/home/home_screen.dart';
import 'package:logisticsmobile/presentation/screens/login/login_screen.dart';
import 'package:logisticsmobile/presentation/screens/shipment/list_shipment.dart';


import '../common/constants/route_constants.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoutes(RouteSettings setting) => {
        RouteList.initial: (context) => LoginScreen(),
      //  RouteList.home: (context) => HomeScreen(),
        RouteList.myShipment: (context) => ListShipment(),
        
        // RouteList.myShipment: (context) => MovieDetailScreen(
        //       movieDetailArguments: setting.arguments as MovieDetailArguments,
        //     ),
        // RouteList.watchTrailer: (context) => WatchVideoScreen(
        //       watchVideoArguments: setting.arguments as WatchVideoArguments,
        //     ),
        // RouteList.favorite: (context) => FavoriteScreen(),
      };
}
