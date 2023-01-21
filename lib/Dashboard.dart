import 'dart:io';

import 'package:flutter/material.dart';
import 'package:project_19_jan_2023/create.dart';
import 'package:project_19_jan_2023/delete.dart';
import 'package:project_19_jan_2023/update.dart';

class dashboard extends StatefulWidget {
  const dashboard({Key? key}) : super(key: key);

  @override
  _dashboardState createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("DASHBOARD",),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             SizedBox(width: 170,height: 50,child:  ElevatedButton(
               onPressed: (){

Navigator.push(context, MaterialPageRoute(builder: (context)=>create()));
               },
               style: ElevatedButton.styleFrom(
                   primary: Colors.lightGreenAccent,

                   textStyle: TextStyle(
                       fontSize: 13,
                       fontWeight: FontWeight.bold)),
               child: Text("CREATE "),
             ),),
              SizedBox(height: 30,),
              SizedBox(width: 170,height: 50,child:  ElevatedButton(
                onPressed: (){


                  Navigator.push(context, MaterialPageRoute(builder: (context)=>delete()));

                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.red,

                    textStyle: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold)),
                child: Text("DELETE "),
              ),),
              SizedBox(height: 30,),
              SizedBox(width: 170,height: 50,child:  ElevatedButton(
                onPressed: (){

                  Navigator.push(context, MaterialPageRoute(builder: (context)=>update()));
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.orangeAccent,

                    textStyle: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold)),
                child: Text("UPDATE "),
              ),),
              SizedBox(height: 30,),
              SizedBox(width: 170,height: 50,child:  ElevatedButton(
                onPressed: (){

                  exit(0);
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.black,

                    textStyle: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold)),
                child: Text("EXIT "),
              ),),
            ],
          ),
        ),
      ),
    );
  }
}
