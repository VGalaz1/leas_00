import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:leas_01/screens/home/home.dart';
import 'package:leas_01/screens/miviaje.dart';

import '../wrapper.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String? _email, _password;
  FirebaseAuth auth = FirebaseAuth.instance;
  Color? _primaryColor = Colors.red[600];
  Color? _secundaryColor = Colors.redAccent[600];

  login(userEmail, userPassword) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: userEmail, password: userPassword);
      User? currentUser = userCredential.user;
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                Wrapper(), //Pantalla abierta despues del login
          ));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Container(
                              height: 380.0,
                              width: 300.0,
                              color: Colors.transparent,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.2),
                                      spreadRadius: 6,
                                      blurRadius: 7,
                                      offset: const Offset(
                                          -12, 2), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(left: 15),
                                      child: Text(
                                        'Iniciar Sesión',
                                        style: TextStyle(
                                          fontSize: 22.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Divider(
                                      color: _secundaryColor,
                                      thickness: 0.7,
                                      endIndent: 15,
                                      indent: 15,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 40.0, top: 20, right: 40),
                                      child: TextField(
                                        onChanged: (value) {
                                          setState(() {
                                            _email = value.trim();
                                          });
                                        },
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        decoration: InputDecoration(
                                            border: const UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.red)),
                                            enabledBorder:
                                                const UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.red)),
                                            focusedBorder:
                                                const UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.red)),
                                            hintText: 'Correo Electronico',
                                            hintStyle: TextStyle(
                                                color: _primaryColor
                                                    ?.withOpacity(0.6))),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 40.0, top: 20, right: 40),
                                      child: TextField(
                                        onChanged: (value) {
                                          setState(() {
                                            _password = value.trim();
                                          });
                                        },
                                        obscureText: true,
                                        decoration: InputDecoration(
                                            border: const UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.red)),
                                            enabledBorder:
                                                const UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.red)),
                                            focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.red)),
                                            hintText: 'Contraseña',
                                            hintStyle: TextStyle(
                                                color: _primaryColor
                                                    ?.withOpacity(0.6))),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 40,
                                    ),
                                    Center(
                                      child: Container(
                                        width: 240,
                                        height: 42,
                                        child: ElevatedButton(
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        Colors.white),
                                                shape: MaterialStateProperty.all<
                                                        RoundedRectangleBorder>(
                                                    RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                                20.0),
                                                        side: BorderSide(
                                                            width: 3,
                                                            color: Colors.red
                                                                .withBlue(
                                                                    100))))),
                                            onPressed: () {
                                              login(_email, _password);
                                            },
                                            child: Text(
                                              'INGRESAR',
                                              style: TextStyle(
                                                  color: _primaryColor,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                      ),
                                    ),
                                    Container(
                                      height: 100,
                                      width: 400,
                                      decoration: const BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/uai.png'))),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
