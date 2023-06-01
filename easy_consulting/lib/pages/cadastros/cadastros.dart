import 'package:flutter/material.dart';

import '../menu/drawer_menu.dart';

class Cadastros extends StatefulWidget {
  const Cadastros({super.key});

  @override
  State<Cadastros> createState() => CadastrosState();
}

class CadastrosState extends State<Cadastros>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

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
          title: const Text('Easy Consulting - Administração Cadastros'),
        ),
        body: Container(
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
                  decoration: const BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: DefaultTabController(
                    length: 3,
                    child: Scaffold(
                      appBar: AppBar(
                        toolbarHeight: 0,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(10),
                          ),
                        ),
                        bottom: TabBar(
                          controller: _tabController,
                          isScrollable: true,
                          labelStyle: const TextStyle(fontSize: 14),
                          tabs: const <Widget>[
                            Tab(
                              text: "Processos",
                            ),
                            Tab(
                              text: "Perguntas",
                            ),
                            Tab(
                              text: "Respostas",
                            ),
                          ],
                        ),
                      ),
                      body: Container(
                        color: Colors.green,
                      ),
                    ),
                  )),
            )));
  }
}
