import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:logisticsmobile/presentation/logistics_app.dart';
import 'package:logisticsmobile/presentation/screens/home/home_screen.dart';
import 'package:logisticsmobile/presentation/screens/home/home_screen_one.dart';
import 'package:logisticsmobile/presentation/screens/home/home_screen_two.dart';
import 'package:logisticsmobile/presentation/screens/shipment/request_shipment.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:pedantic/pedantic.dart';
import 'data/tables/movie_table.dart';
import 'di/get_it.dart' as getIt;


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  unawaited(
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]));
  final appDocumentDir = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  Hive.registerAdapter(MovieTableAdapter());
  unawaited(getIt.init());
 // runApp(LogisticsApp());
//  runApp(DashboardPage1());

    runApp(RequestShipmentApp());
    

}
