import 'package:flutter/material.dart';


class InputPage extends StatefulWidget {
  
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  String _nombre = '';
  String _fecha = '';

  TextEditingController _inputDateEdit = new TextEditingController();

  String _opcionSeleccionada = 'Volar';
  List<String> _listaPoderes = ["Volar", "gritar", "java", "amor", "paz", "amistad", "desafio", "fuerza"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("INPUTS FIELDS")),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        children: <Widget>[
          _crearInputs(),
          Divider(),
          _crear_persona(),
          Divider(),
          _crear_Email(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearDropDown()
        ],
      )
    );
  }

 Widget _crearInputs() {

   return TextField(
     //autofocus: true,
     textCapitalization: TextCapitalization.sentences,
     decoration: InputDecoration(
       border: OutlineInputBorder(),
       counter: Text('Letras ${ _nombre.length }'),
       hintText: 'Ingrese su nombre',
       labelText: 'Nombre',
       helperText: 'Solo es el nombre',
       icon: Icon(Icons.supervised_user_circle)
     ),
     onChanged: (valor){
       setState(() {
         _nombre = valor;
       });
     },
   );

  }

  Widget _crear_persona() {

      return ListTile(
        title : Text("Nombre es: $_nombre"),
        trailing: Text(_opcionSeleccionada),
      );

  }

  Widget _crear_Email() {

    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
       border: OutlineInputBorder(),
       counter: Text('Letras ${ _nombre.length }'),
       hintText: 'Email',
       labelText: 'Email',
       helperText: 'Solo es el Email',
       icon: Icon(Icons.email)
     ),
     onChanged: (valor){
       setState(() {
         _nombre = valor;
       });
     },
   );

  }

 Widget  _crearPassword() {

    return TextField(
      obscureText: true,
      decoration: InputDecoration(
       border: OutlineInputBorder(),
       counter: Text('Letras ${ _nombre.length }'),
       hintText: 'Password',
       labelText: 'Password',
       helperText: 'Solo es el Password',
       icon: Icon(Icons.lock)
     ),
     onChanged: (valor){
       setState(() {
         _nombre = valor;
       });
     },
   );

  }

  Widget _crearFecha(context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputDateEdit,
      decoration: InputDecoration(
       border: OutlineInputBorder(),
       hintText: 'Fecha de nacimiento',
       labelText: 'Fecha',
       icon: Icon(Icons.date_range)
     ),
     onTap: (){
       FocusScope.of(context).requestFocus(new FocusNode());
       _selectDate(context);
     },
   );
  }

  void _selectDate(BuildContext context) async {

    DateTime picked =  await showDatePicker(
      context: context, 
      initialDate: new DateTime.now(), 
      firstDate: new DateTime(1998), 
      lastDate: new DateTime(2025),
      locale: Locale('es', 'ES')
    );

    if(picked != null){
      setState(() {
        _fecha = picked.toString();
        _inputDateEdit.text = _fecha;
      });
    }

  }

  List<DropdownMenuItem<String>> getItemDropDown(){

    List<DropdownMenuItem<String>> lista = new List();

    _listaPoderes.forEach((poder){

      lista.add(DropdownMenuItem(child: Text(poder), value: poder));

    });

    return lista;
  }


  Widget _crearDropDown() {


    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(width: 30.0,),
        DropdownButton(
            value: _opcionSeleccionada,
            items: getItemDropDown(), 
            onChanged: (opt){
              setState(() {
                _opcionSeleccionada = opt;
              });
            }
        )
      ],
    );

  }
}