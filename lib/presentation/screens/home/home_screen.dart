import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logisticsmobile/presentation/bloc/driver/driver_cubit.dart';
import 'package:logisticsmobile/presentation/bloc/loading/loading_cubit.dart';
import 'package:logisticsmobile/presentation/bloc/shipment/shipment_cubit.dart';
import 'package:logisticsmobile/presentation/bloc/theme/theme_cubit.dart';
import 'package:logisticsmobile/presentation/bloc/trip/trip_cubit.dart';
import 'package:logisticsmobile/presentation/bloc/vehicle/vehicle_cubit.dart';
import 'package:logisticsmobile/presentation/screens/login/login_screen.dart';
import '../../../di/get_it.dart';
import '../../widgets/app_error_widget.dart';
import '../drawer/navigation_drawer.dart';


class TransactionDetails {
  final String item;
  final String companyName;
  final int ammount;
  final bool income;
  final IconData icon;

  TransactionDetails({
    required this.item,
    required this.ammount,
    required this.companyName,
    required this.income,
    required this.icon,
  });
}

class DashboardPage1 extends StatelessWidget{
  const DashboardPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp( //use MaterialApp() widget like this
      home: HomeScreen() //create new widget class for this 'home' to 
                   // escape 'No MediaQuery widget found' error
    );
  }
}



class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {

  bool isCollapsed = true;
  late double screenWidth, screenHeight;
  final Duration duration = const Duration(milliseconds: 300);
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _menuScaleAnimation;
  late Animation<Offset> _slideAnimation;

  late DriverCubit driverCubit;
  late TripCubit tripCubit;
  late ShipmentCubit shipmentCubit;
  late VehicleCubit vehicleCubit;
   late LoadingCubit _loadingCubit;
  late ThemeCubit _themeCubit;
  //late SearchMovieCubit searchMovieCubit;


 double mainBorderRadius = 0;
  Brightness statusIconColor = Brightness.dark;

  List<TransactionDetails> todayTransactionsList = [
     TransactionDetails(
      item: 'Macbook Pro 15"',
      companyName: 'Apple',
      ammount: 2499,
      income: false,
      icon: Icons.computer,
    ),
     TransactionDetails(
      item: 'Incoming Transfer',
      companyName: 'Upwork',
      ammount: 499,
      income: true,
      icon: Icons.transit_enterexit,
    ),
  ];

  List<TransactionDetails> yesterdayTransactionsList = [
     TransactionDetails(
      item: 'Beats Headphone 2th Gen',
      companyName: 'Apple',
      ammount: 199,
      income: false,
      icon: Icons.headset,
    ),
     TransactionDetails(
      item: 'Cake',
      companyName: 'StarBucks',
      ammount: 19,
      income: false,
      icon: Icons.cake,
    ),
     TransactionDetails(
      item: 'Money Transfer',
      companyName: 'eSewa',
      ammount: 499,
      income: true,
      icon: Icons.transit_enterexit,
    ),
  ];


  @override
  void initState() {
    super.initState();

     _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(_controller);
    _menuScaleAnimation = Tween<double>(begin: 0.5, end: 1).animate(_controller);
    _slideAnimation = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0)).animate(_controller);

   
    tripCubit = getItInstance<TripCubit>();
    driverCubit = getItInstance<DriverCubit>();
    shipmentCubit = getItInstance<ShipmentCubit>();
    vehicleCubit=getItInstance<VehicleCubit>();
     _loadingCubit = getItInstance<LoadingCubit>();
    _themeCubit = getItInstance<ThemeCubit>();
    _themeCubit.loadPreferredTheme();
   
   // movieCarouselCubit.loadCarousel();
  }

  @override
  void dispose() {
    super.dispose();
     _controller.dispose();

     
    tripCubit.close();
    driverCubit.close();
    shipmentCubit.close();
     vehicleCubit.close();
   // searchMovieCubit.close();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => tripCubit,
        ),
        BlocProvider(
          create: (context) => driverCubit,
        ),
        BlocProvider(
          create: (context) => shipmentCubit,
        ),
        BlocProvider(
          create: (context) => vehicleCubit,
        ),
       BlocProvider<LoadingCubit>.value(value: _loadingCubit),
       BlocProvider<ThemeCubit>.value(value: _themeCubit),// BlocProvider.value(
        //   value: searchMovieCubit,
        // ),
      ],
      child: Scaffold(
        drawer: const NavigationDrawer(),
        bottomNavigationBar:bottomBar(),
        body: BlocBuilder<VehicleCubit, VehicleState>(
          builder: (context, state) {
            if (state is SuccessLoadAllVehicleState) {
              return Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  dashboard(context)
                ],
              );
            } else if (state is VehicleError) {
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));

              // return AppErrorWidget(
              //   onPressed: () => vehicleCubit.getAllVehicles(),
              //   errorType: state.errorType,
              // );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }


Widget bottomBar() {
    return Align(
      alignment: Alignment(-1, 1),
      child: Container(
        padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
        height: 70,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black12,
            width: 1,
          ),
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
                flex: 1,
                child: IconButton(
                  highlightColor: Colors.red,
                  splashColor: Colors.greenAccent,
                  icon: Icon(
                    Icons.home,
                    color: Color(0xffa1a5b5),
                  ),
                  iconSize: 28,
                  onPressed: () {},
                )),
            Expanded(
              flex: 1,
              child: IconButton(
                iconSize: 28,
                icon: Icon(
                  Icons.swap_horiz,
                  color: Color(0xffa1a5b5),
                  size: 28,
                ),
                onPressed: () {},
              ),
            ),
            Expanded(
              flex: 1,
              child: IconButton(
                icon: Icon(
                  Icons.show_chart,
                  color: Color(0xffa1a5b5),
                ),
                iconSize: 28,
                onPressed: () {},
              ),
            ),
            Expanded(
              flex: 1,
              child: IconButton(
                iconSize: 28,
                icon: Icon(
                  Icons.notifications_none,
                  color: Color(0xffa1a5b5),
                ),
                onPressed: () {},
              ),
            ),
            Expanded(
              flex: 1,
              child: IconButton(
                iconSize: 28,
                icon: Icon(
                  Icons.person_outline,
                  color: Color(0xffa1a5b5),
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }


  Widget creditCard({
    String? amount,
    String? cardNumber,
    String? cardHolder,
    String? expiringDate,
    String? bankEnding,
    Color? backgroundColor,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      width: MediaQuery.of(context).size.width - 30,
      child: Stack(
        children: <Widget>[
          ListView(
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
            children: <Widget>[
              const Text(
                'Subscription Type',
                style: TextStyle(
                  color: Colors.white70,
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
              Text(
                '\$$amount',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                '**** **** **** $cardNumber',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                  letterSpacing: 1.3,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                    flex: 6,
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Text(
                            'Card Holder',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            '$cardHolder',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Text(
                            'Expires',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            '$expiringDate',
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            right: 25,
            top: 25,
            child: SizedBox(
              // width: 90,
              child: Row(
                children: <Widget>[
                  const Text(
                    'Bank',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '$bankEnding',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 25,
            bottom: 25,
            child: Container(
              child: const Icon(
                Icons.credit_card,
                color: Colors.white70,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget transactionList(
    List<TransactionDetails> transactionList,
    String strDate, {
    bool lastElement= false,
  }) {
    return ListView(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      children: <Widget>[
        Container(
          child:  Text(
            '$strDate',
            style: const TextStyle(
              color: Color(0xffadb2be),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        ListView.builder(
          padding: EdgeInsets.fromLTRB(5, 10, 5, (lastElement) ? 40 : 5),
          physics: const ClampingScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            TransactionDetails _transaction = transactionList[index];
            return Container(
              margin: const EdgeInsets.only(
                bottom: 20,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: const [ 
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 3,
                  )
                ],
              ),
              // padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
              child: ListTile(
                contentPadding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                leading: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      _transaction.icon,
                    ),
                  ],
                ),
                title: Text(
                  "${_transaction.item}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                subtitle: Text(
                  "${_transaction.companyName}",
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                trailing: Text(
                  (_transaction.income)
                      ? "+${_transaction.ammount} \$"
                      : " -${_transaction.ammount} \$",
                  style: TextStyle(
                    fontSize: 18,
                    color: (_transaction.income) ? Colors.green : Colors.red,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            );
          },
          itemCount: transactionList.length,
        ),
      ],
    );
  }






Widget dashboard(context) {
    return AnimatedPositioned(
      duration: duration,
      top: 0,
      bottom: 0,
      left: isCollapsed ? 0 : 0.5 * screenWidth,
      width: screenWidth,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Material(
          borderRadius: BorderRadius.circular(mainBorderRadius),
          animationDuration: duration,
          color: Color(0xfff4faff),
          child: SafeArea(
              child: Stack(
            children: <Widget>[
              ListView(
                padding:const EdgeInsets.all(0),
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(
                      top: 5,
                      bottom: 50,
                    ),
                    decoration:const BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 16, right: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              IconButton(
                                icon: const Icon(
                                  Icons.drag_handle,
                                  color: Colors.black87,
                                ),
                                onPressed: () {
                                  setState(() {
                                    if (isCollapsed) {
                                      mainBorderRadius = 30;
                                      statusIconColor = Brightness.light;
                                      _controller.forward();
                                    } else {
                                      _controller.reverse();
                                      mainBorderRadius = 0;
                                      statusIconColor = Brightness.dark;
                                    }
                                    isCollapsed = !isCollapsed;
                                  });
                                },
                              ),
                              Text(
                                "My Dashboard",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.add_circle_outline,
                                  color: Color(0xff1c7bfd),
                                ),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          height: (MediaQuery.of(context).size.width - 30) *
                              (8 / 16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                          ),
                          child: PageView(
                            controller: PageController(viewportFraction: 0.9),
                            scrollDirection: Axis.horizontal,
                            pageSnapping: true,
                            children: <Widget>[
                              creditCard(
                                amount: '12565.23',
                                cardHolder: 'Bibash Adhikari',
                                cardNumber: '4545',
                                expiringDate: '02/21',
                                bankEnding: 'X',
                                backgroundColor: Colors.deepOrangeAccent,
                              ),
                              creditCard(
                                amount: '1778.23',
                                cardHolder: 'Ram Adhikari',
                                cardNumber: '5045',
                                expiringDate: '02/21',
                                bankEnding: 'Y',
                                backgroundColor: Colors.blueAccent,
                              ),
                              creditCard(
                                amount: '15689556.23',
                                cardHolder: 'Bibash Adhikari',
                                cardNumber: '0545',
                                expiringDate: '02/21',
                                bankEnding: 'PAGAL',
                                backgroundColor: Colors.redAccent,
                              ),
                              creditCard(
                                amount: '1203456.23',
                                cardHolder: 'Bibash Adhikari',
                                cardNumber: '5405',
                                expiringDate: '02/21',
                                bankEnding: 'ONE',
                                backgroundColor: Colors.greenAccent,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: ListView(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      children: <Widget>[
                        SizedBox(height: 15),
                        Container(
                          padding: EdgeInsets.only(
                            bottom: 16,
                            left: 16,
                            right: 16,
                          ),
                          child: ListView(
                            physics: ClampingScrollPhysics(),
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            shrinkWrap: true,
                            children: <Widget>[
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "Transactions",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      Icons.settings,
                                      color: Color(0xffa4a6b8),
                                    ),
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                              transactionList(todayTransactionsList, 'Today'),
                              transactionList(
                                  yesterdayTransactionsList, 'Yesterday',
                                  lastElement: true),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              bottomBar(),
            ],
          )),
        ),
      ),
    );
  }


}





