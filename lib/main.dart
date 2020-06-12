import 'package:flutter/material.dart';
import 'package:internship_challenge_t_frontend_flutter/src/pages/home_page.dart';
import 'package:internship_challenge_t_frontend_flutter/src/routes/router.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Internship Flutter',
      theme: ThemeData(
        primaryColor: Colors.blue[900],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      //home: HomePage(),
      initialRoute: '/',
      routes: getApplicationRoutes(),
    );
  }
}
