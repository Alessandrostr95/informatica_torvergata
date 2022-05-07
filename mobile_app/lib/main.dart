import 'package:flutter/material.dart';
import 'package:mobile_app/screens/ContactPage.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

import 'package:mobile_app/models/Info.dart';
import 'package:mobile_app/screens/ClassPage.dart';
import 'package:mobile_app/screens/HomePage.dart';
import 'package:mobile_app/screens/InfoPage.dart';

void main() {
  // runApp(ChangeNotifierProvider(
  //     create: (context) => CourseInfo(),
  //     child: const InformaticaTorVergataApp())
  // );
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => CourseInfo()),
    // ChangeNotifierProvider(create: (context) => NewsNotifier())
  ], child: const InformaticaTorVergataApp()));
}

class InformaticaTorVergataApp extends StatelessWidget {
  const InformaticaTorVergataApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      title: 'Informatica Tor Vergata',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: HomePage.PAGE_ROUTE,
      routes: <String, WidgetBuilder>{
        HomePage.PAGE_ROUTE: (context) => const HomePage(),
        ClassPage.PAGE_ROUTE: (context) => const ClassPage(),
        InfoPage.PAGE_ROUTE: (context) => const InfoPage(),
        ContactPage.PAGE_ROUTE:(context) => const ContactPage()
      },
    );
  }
}