import 'package:flutter/material.dart';
import 'package:leas_01/screens/authenticate/loginscreen.dart';
import 'package:leas_01/screens/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';

//asldaksldjlaskjd
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'MiViaje',
        theme: ThemeData(primaryColor: Colors.red[600]),
        home: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: Colors.red[600],
          ),
          body: Login(),
        ));
  }
}
