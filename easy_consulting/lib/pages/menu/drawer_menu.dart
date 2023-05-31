import 'package:flutter/material.dart';

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
            leading: const Icon(Icons.edit),
            title: const Text("Cadastros"),
            onTap: () {
              Navigator.pop(context);
              //Navegar para outra página
            },
          ),
          ListTile(
            leading: const Icon(Icons.group),
            title: const Text("Meus Grupos"),
            onTap: () {
              Navigator.pop(context);
              //Navegar para outra página
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
