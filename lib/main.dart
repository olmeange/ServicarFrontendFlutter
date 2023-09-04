import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:servicarmt/src/pages/appointment.dart';

import 'package:servicarmt/src/pages/home.dart';
import 'package:servicarmt/src/pages/login.dart';
import 'package:servicarmt/src/pages/register.dart';
import 'package:servicarmt/src/providers/login_provider.dart';
import 'package:servicarmt/src/providers/register_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => RegisterProvider()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: 'login',
          routes: {
            'login': (context) => const Login(),
            'register': (context) => const Register(),
            'home': (context) => const Home(),
            'appointment': (context) => const Appointment(),
          }),
    );
  }
}
