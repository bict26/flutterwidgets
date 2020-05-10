import 'package:flutter/material.dart';
import 'package:flutterwidgets/src/pages/providers/menu_providers.dart';
import 'package:flutterwidgets/src/pages/utils/icon_string_utils.dart';

 
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home'), centerTitle: true,
        ),
        body: _lista(),
    );
  }

  Widget _lista() {

    return FutureBuilder(
    initialData: [],
    future: menuProvider.cargarData(),
    builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot){

        return ListView(

          children: _listItems(snapshot.data, context),

        );
      }, 
    );
  }

 List<Widget> _listItems(List<dynamic> data, BuildContext context) {

    final List<Widget> opciones = [];

    data.forEach((opt){
      
        final widget = ListTile(
          title: Text(opt["texto"]),
          leading: getIcon(opt["icon"]),
          trailing: Icon(Icons.keyboard_arrow_right, color: Colors.blue,),
          onTap: () {
              
            Navigator.pushNamed(context, '/'+opt['ruta']);

             /*final route = MaterialPageRoute(
               builder: (context){
                return AlertPage();
              });
             Navigator.push(context, route);*/

          },
        );


        opciones..add(widget)
                ..add(Divider());

    });

  return opciones;

  }



}