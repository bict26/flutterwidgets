import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {

  final opciones = ["Java", "Kotlin", "Python", "Linux", "Go", "Flutter"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Listview"), centerTitle: true,),
      body: ListView(
        children: _crearItems()
      ),
    );
  }

  List<Widget>_crearItems() {

    return opciones.map(( item ){
      return  Column(
        children: <Widget>[
          ListTile(
            title: Text(item + "!"),
            subtitle: Text("Te ha enviado un mensaje."),
            leading: Icon(Icons.verified_user),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {},
          ),
          Divider()
        ],
      );
    }).toList();

  }



}
