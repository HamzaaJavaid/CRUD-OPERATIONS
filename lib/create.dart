import 'dart:io';

import 'package:flutter/material.dart';
import 'package:project_19_jan_2023/Dashboard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class create extends StatefulWidget {
  const create({Key? key}) : super(key: key);

  @override
  _createState createState() => _createState();
}

class _createState extends State<create> {
  late String name;
  final aag_jag = FirebaseFirestore.instance;
  late String f_name;
  late String reg_no;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightGreenAccent,
          title: Text("CREATE PAGE",),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                SizedBox(height: 60,),
                Text("CREATE A RECORD",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.green
                  ),),
                SizedBox(height: 30,),
                Padding(padding: EdgeInsets.all(20),child: TextField(
                    onChanged: (value){
                      setState(() {
                        name=value;
                      });
                    },
                    decoration: InputDecoration(
                        hintText: "Enter Your Name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(2)),
                        )
                    )
                ),),
                SizedBox(height: 10,),
                Padding(padding: EdgeInsets.all(20),child: TextField(
                    onChanged: (value){
                      setState(() {
                        f_name=value;
                      });
                    },
                    decoration: InputDecoration(
                        hintText: "Enter Your Father Name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(2)),
                        )
                    )
                ),),
                SizedBox(height: 30,),
                Padding(padding: EdgeInsets.all(20),child: TextField(
                    onChanged: (value){
                      setState(() {
                        reg_no=value;
                      });
                    },
                    decoration: InputDecoration(
                        hintText: "Enter Your Registration Number",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(2)),
                        )
                    )
                ),),
                SizedBox(height: 30,),
                Row(
                  children: [
                    SizedBox(width: 27,),
                    SizedBox(width: 170,height: 50,child:  ElevatedButton(
                      onPressed: (){

                        Navigator.push(context, MaterialPageRoute(builder: (context)=>dashboard()));
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.lightGreenAccent,

                          textStyle: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold)),
                      child: Text("Back To Menu ",style: TextStyle(color: Colors.black),),
                    ),),
                    SizedBox(width: 27,),
                    SizedBox(width: 170,height: 50,child:  ElevatedButton(

                      onPressed: (){

                        String date = DateTime.now().millisecondsSinceEpoch.toString();
                        aag_jag.collection('Live data').doc(date).set({

                          "name" : name,
                          "father":f_name,
                          "reg":reg_no,
                          "Date":date,

                        });
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>dashboard()));
                      },
                      style: ElevatedButton.styleFrom(
                          primary: Colors.lightGreenAccent,

                          textStyle: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold)),
                      child: Text("SUBMIT ",style: TextStyle(color: Colors.black),),
                    ),),
                  ],
                ),
SizedBox(height: 80,),
              ],
            ),
          ),
        )
      ),

    );
  }
}
