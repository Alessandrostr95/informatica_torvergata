import 'package:flutter/material.dart';
import 'package:mobile_app/models/Info.dart';

import 'package:mobile_app/screens/HomePage.dart';
import 'package:provider/provider.dart';

void main() {
  // runApp(ChangeNotifierProvider(
  //     create: (context) => CourseInfo(),
  //     child: const InformaticaTorVergataApp())
  // );
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CourseInfo()),
        // ChangeNotifierProvider(create: (context) => NewsNotifier())
      ],
      child: const InformaticaTorVergataApp())
  );
}

class InformaticaTorVergataApp extends StatelessWidget {
  const InformaticaTorVergataApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Informatica Tor Vergata',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      initialRoute: HomePage.PAGE_ROUTE,
      routes: <String, WidgetBuilder>{
        HomePage.PAGE_ROUTE: (context) => const HomePage(),
      },
    );
  }
}
