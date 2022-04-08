import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:leas_01/screens/authenticate/loginscreen.dart';
import 'package:leas_01/screens/home/home.dart';
import 'package:leas_01/widgets/multchoice.dart';
import 'package:leas_01/widgets/slider.dart';
import 'package:leas_01/data/questionData.dart';
import 'package:leas_01/services/indexservice.dart';

class Wrapper extends StatefulWidget {
  Wrapper({Key? key}) : super(key: key);
  final database = FirebaseDatabase.instance.ref();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    //Cambiar argumento del Widget a uno de QuestionModel
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red[600],
        ),
        body: IndexedStack(children: [
          Alternatives(
              questions[globalIndex.serviceIndex].question!,
              questions[globalIndex.serviceIndex].answers!,
              globalIndex.serviceIndex),
          SliderQuestion(questions[globalIndex.serviceIndex].question!)
        ]));
  }
}
