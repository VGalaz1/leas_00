import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class MiViaje extends StatefulWidget {
  MiViaje({Key? key}) : super(key: key);

  @override
  _MiViajeState createState() => _MiViajeState();
}

class _MiViajeState extends State<MiViaje> {
  final database = FirebaseDatabase.instance.ref();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
            child: ElevatedButton(
          onPressed: () {
            final User user = _auth.currentUser!;
            final uid = user.uid;
            DateTime now = DateTime.now();
            String currentDate = now.year.toString() +
                '-' +
                now.month.toString() +
                '-' +
                now.day.toString();
            String currentHour = now.hour.toString() +
                ":" +
                now.minute.toString() +
                ":" +
                now.second.toString();
            final dbSurveys =
                database.child('Surveys/$uid/$currentDate/$currentHour');
            dbSurveys.set({
              'description': '2021_12_29_0256',
              'q0001': '1',
              'q0002': '4',
              'q0003': '3'
            });
          },
          child: const Text('Enviar encuesta',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
        ))
      ],
    ));
  }
}
