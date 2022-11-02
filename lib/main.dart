import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sql_netcore/providers/usuario_provider.dart';
import 'package:sql_netcore/route/route_generator.dart';

import 'package:sql_netcore/screens/loginscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Usuario_provider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        initialRoute: '/',
        onGenerateRoute: RouteGenerator.generateRoute,
        home: const LoginScreen(),
      ),
    );
  }
}
