import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

TextEditingController _controllerAlcool = TextEditingController();
TextEditingController _controllerGasolina = TextEditingController();
String _textoResultado = "";

void _calcular(){

  double precoAlcool = double.tryParse( _controllerAlcool.text);
  double precoGasolina = double.tryParse( _controllerGasolina.text);
  

  if( precoAlcool == null || precoGasolina == null ){
    setState(() {
       _textoResultado = "Número inválido, digite números maiores que 0 utlizando (.)";
    });
  }else{
   
    if(precoAlcool / precoGasolina >= 0.7){
      setState(() {
        _textoResultado = "Melhor abastecer com gasolina";
      });
    }else{
      setState(() {
        _textoResultado = "Melhor abastecer com Alcool";
      });
    }
      _limparCampos();
  }

} 

void _limparCampos(){
  _controllerGasolina.text ="";
  _controllerAlcool.text = "";
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: Text("Álcool ou Gasolina"),
      backgroundColor: Colors.deepPurple,
    ) ,
    body: Container(
      
      //SingleChildScrollView para scrolar
      child:SingleChildScrollView(
        padding: EdgeInsets.all(32),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 32),
            child: Image.asset(
              "image/logo.png",
              width: 100,
              height: 200,
              ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 5),
            child: Text(
              "Saiba qual a melhor opção para abastecer seu carro.",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold

              ),
              ),
          ),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Preço Alcool, ex: 1.59"
            ),
            style: TextStyle(
              fontSize: 22
            ),
            controller: _controllerAlcool,
          ),
           TextField(
             keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: "Preço Gasolina, ex: 2.59"
            ),
            style: TextStyle(
              fontSize: 22
            ),
            controller: _controllerGasolina,
           ),
           
           Padding(
             padding: EdgeInsets.only(top: 10),
             child: RaisedButton(
               color: Colors.blue,
               textColor:Colors.white,
               padding: EdgeInsets.all(15),
               child: Text(
                 "Calcular",
                 style: TextStyle(
                   fontSize: 20,
                   fontWeight: FontWeight.bold
                 ),
                 ),
               onPressed: _calcular,
             ),
           ),
           Padding(
             padding: EdgeInsets.only(top: 20),
             child: Text( _textoResultado,
             style: TextStyle(
               fontSize: 22,
               fontWeight: FontWeight.bold
             ),
             ),
           )
        ],
      ),
      ) ,
    ),
    );
  }
}