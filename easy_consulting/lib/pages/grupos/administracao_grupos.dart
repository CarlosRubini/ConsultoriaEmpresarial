import 'package:flutter/material.dart';
import '../menu/drawer_menu.dart';

class AdministracaoGrupos extends StatelessWidget{
  const AdministracaoGrupos({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerMenu(),
      appBar: AppBar(
        centerTitle: true,
        actions: [
          Container(
            padding: const EdgeInsets.only(right: 16),
            child: const Icon(Icons.more_vert),
          )
        ],
        title: const Text('Easy Consulting - Administração Grupos'),
      ),
      body:Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
                    child: Container(
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width * 0.81,
                        height: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: const Offset(
                                    0, 3), // changes position of shadow
                              )
                            ],
                            color: Colors.grey[200],
                            borderRadius: const BorderRadius.all(
                                Radius.circular(15))))))
      );
  }
  
}