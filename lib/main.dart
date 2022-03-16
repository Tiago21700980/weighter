import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weighter/pages/details/details.dart';
import 'package:weighter/pages/form/form_screen.dart';

import 'pages/home/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.immersive); //Tira a barra de notificações lá em cima
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weighter',
      theme: ThemeData(
        fontFamily: 'Roboto',
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 14,
            color: Colors.black,
            fontWeight: FontWeight.w900,
          ),
          headline2: TextStyle(
            fontSize: 12,
            color: Colors.black87,
            fontWeight: FontWeight.w500,
          )
        )
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context) => HomePage(),
        '/details': (context) => DetailsPage(),
        '/form': (context) => FormScreen(),
      },
      initialRoute: '/',
      );
  }
}
