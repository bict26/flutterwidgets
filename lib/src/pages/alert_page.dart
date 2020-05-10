import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Alert Page"), centerTitle: true),
        body: Center(
          child: RaisedButton(
            onPressed: () => _mostrtarAlerta(context), 
            child: Text("Mostrar alerta"),
            textColor: Colors.white,
            color: Colors.blue,
            shape: StadiumBorder(),
          ),
        ),
        floatingActionButton: FloatingActionButton(onPressed: (){
          Navigator.pop(context);
        }, child: Icon(Icons.backspace),),
    );
  }


  void _mostrtarAlerta(context){
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context){
        return AlertDialog(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
            title: Text("Titulo"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text("Este es el contenido de la alerta."),
                SizedBox(height: 15.0),
                FlutterLogo(size: 100.0,)
              ],
            ),
            actions: <Widget>[
                FlatButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text("Cancelar")
                ),
                FlatButton(
                  onPressed: () {},
                  child: Text("Aceptar")
                ),

            ],
        );
      }
    );
  }


}