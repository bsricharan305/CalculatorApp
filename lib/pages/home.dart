import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:core';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}




class _HomeState extends State<Home> {
  double num1 = 0.00;
  double num2 =0.0;
  String result = '0.0';
  String _res = '';
  String operand ='';
  String operation = '';

  calculate(String buttonText){
    //print("Started " + buttonText);
    if (buttonText == "CLEAR"){
      num1 = 0.0;
      num2 =0.0;
      _res = "";
      result ="0.0";
      print("Cleared");


    }
    else if (buttonText == '+' || buttonText == '-' || buttonText == '*' || buttonText == '/'){
      num1 = double.parse(result);
      print("num1 =  " + num1.toString());
      operand = buttonText;
      _res = '0';
    }
    else if (buttonText =='.'){
      if (_res.contains(".")){
        print("already contains a decimal");
        return;
      }
    }
    else if (buttonText == '='){
      num2 = double.parse(result);
      if (operand == "+"){
        _res = (num1 + num2).toString();
        }
      if (operand == "-"){
        _res = (num1 - num2).toString();
      }
      if (operand == "/"){
        _res = (num1 / num2).toString();
      }
      if (operand == "*"){
        _res = (num1 * num2).toString();
      }


      num1 =0.0;
      num2=0.0;
      operand ='';
    }
    else {
      _res = _res + buttonText;
    }
    print("_res : " + _res);

    setState(() {
      (buttonText != "CLEAR" && buttonText != "=")?operation += buttonText : operation = '';
      result =  _res;
      print("result = " + result);

    });

  }

  Widget keyButton(String num){

    return Expanded(
        child: OutlineButton(

          onPressed: (){
            calculate(num);
          },
          child: Text(num,
            style: TextStyle(
              //fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),),
        ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),

      ),
      body: SafeArea(
        child: Container(

          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text("$operation",
              style: TextStyle(
                fontSize: 50.0,
                backgroundColor: Colors.grey[400],
                fontWeight: FontWeight.bold,
              ),),
              SizedBox(height: 6.0,),
              Text("$result",
                style: TextStyle(
                  fontSize: 60.0,
                  backgroundColor: Colors.grey[400],
                  fontWeight: FontWeight.bold,
                ),),
              //SizedBox(height: 6.0,),

              Row(

                children: <Widget>[
                  keyButton("7"),
                  keyButton("8"),
                  keyButton("9"),
                  keyButton("+"),
              ]
              ),
              Row(
                children: <Widget>[
                  keyButton("4"),
                  keyButton("5"),
                  keyButton("6"),
                  keyButton("-"),

                ],
              ),
              Row(
                children: <Widget>[
                  keyButton("1"),
                  keyButton("2"),
                  keyButton("3"),
                  keyButton("*"),
                ],
              ),
              Row(
                children: <Widget>[
                  keyButton("."),
                  keyButton("0"),
                  keyButton("00"),
                  keyButton("/"),
                  ]
              ),
              Row(
                children: <Widget>[
                  keyButton("CLEAR"),
                  keyButton("="),
                ],
              )

            ],


          ),
        ),
      ),

      );

  }
}
