import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:luxeride/controller/add_provider.dart';
import 'package:luxeride/controller/bottombar_provider.dart';
import 'package:luxeride/controller/db_provider.dart';
import 'package:luxeride/controller/edit_provider.dart';
import 'package:luxeride/controller/search_provider.dart';
import 'package:luxeride/controller/settings_provider.dart';
import 'package:luxeride/model/car_model/cars_model.dart';
import 'package:luxeride/view/screens/splash.dart';
import 'package:provider/provider.dart';
import 'model/bike_model/bikes_model.dart';
import 'model/bookings_model/bookings_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(CarsModelAdapter().typeId)) {
    Hive.registerAdapter(CarsModelAdapter());
  }
  if (!Hive.isAdapterRegistered(BikesModelAdapter().typeId)) {
    Hive.registerAdapter(BikesModelAdapter());
  }
  if (!Hive.isAdapterRegistered(BookingsModelAdapter().typeId)) {
    Hive.registerAdapter(BookingsModelAdapter());
  }
  await Hive.openBox<CarsModel>('carDb');
  await Hive.openBox<BookingsModel>('bookingsDb');
  await Hive.openBox<BikesModel>('bikeDb');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [ChangeNotifierProvider(create: (context)=>AddProvider()),
    ChangeNotifierProvider(create: (context)=>EditProvider()),
    ChangeNotifierProvider(create: (context)=>SearchProvider()),
    ChangeNotifierProvider(create: (context)=>DbProvider()),
    ChangeNotifierProvider(create: (context)=>BottomBarProvider()),
    ChangeNotifierProvider(create: (context)=>SettingsProvider()),],
      child: MaterialApp(
        home: const SplashScreen(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.black, fontFamily: 'Michroma'),
      ),
    );
  }
}
