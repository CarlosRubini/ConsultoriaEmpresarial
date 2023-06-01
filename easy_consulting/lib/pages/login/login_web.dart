import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../menu/menu.dart';

class LoginWeb extends StatefulWidget {
  const LoginWeb({super.key});

  @override
  LoginWebState createState() => LoginWebState();
}

class LoginWebState extends State<LoginWeb> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(0),
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/background.jpg"), fit: BoxFit.cover),
      ),
      child: Center(
          child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.1),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // changes position of shadow
          )
        ], borderRadius: BorderRadius.circular(10), color: Colors.white),
        width: 350,
        height: 280,
        child: Stack(
          children: [
            Positioned(
                left: 0,
                top: 0,
                child: Row(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.vertical(
                              top: Radius.circular(10), bottom: Radius.zero)),
                      height: 60,
                      width: 350,
                      child: const Text(
                        'Bem Vindo',
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                )),
            Positioned(
                right: 0,
                left: 0,
                top: 70,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        width: 300,
                        padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                        child: const TextField(
                          decoration: InputDecoration(
                            hintText: 'Email',
                            filled: true,
                            fillColor: Color.fromRGBO(241, 241, 241, 1),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 0.5,
                                    color: Color.fromRGBO(241, 241, 241, 1))),
                          ),
                        )),
                    Container(
                        width: 300,
                        padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                        child: const TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Senha',
                            filled: true,
                            fillColor: Color.fromRGBO(241, 241, 241, 1),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                                    width: 0.5,
                                    color: Color.fromRGBO(241, 241, 241, 1))),
                          ),
                        )),
                    Container(
                      width: 300,
                      padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                      child: ElevatedButton(
                        onPressed: _navigateToMainPage,
                        child: const Text("Entrar",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            )),
                      ),
                    ),
                    Container(
                      width: 300,
                      padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text("Criar Conta",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            )),
                      ),
                    )
                  ],
                ))
          ],
        ),
      )),
    );
  }

  _navigateToMainPage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Menu()),
    );
  }
}
