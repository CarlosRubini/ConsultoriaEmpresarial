import 'package:easy_consulting/pages/cadastros/cadastros.dart';
import 'package:easy_consulting/pages/menu/menu.dart';
import 'package:flutter/material.dart';

import '../grupos/administracao_grupos.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const UserAccountsDrawerHeader(
            accountEmail: Text("cadu.rubini@gmail.com"),
            accountName: Text("Cadu Rubini"),
            currentAccountPicture: CircleAvatar(
              child: Text("CR"),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.menu),
            title: const Text("Menu"),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Menu()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text("Cadastros"),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const Cadastros()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.group),
            title: const Text("Meus Grupos"),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const AdministracaoGrupos()),
              );
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout_rounded),
            title: const Text("Sair"),
            onTap: () {
              Navigator.pop(context);
              //Navegar para outra página
            },
          ),
        ],
      ),
    );
  }
}
