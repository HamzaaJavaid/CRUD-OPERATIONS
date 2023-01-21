import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'Dashboard.dart';

class update extends StatefulWidget {
  const update({Key? key}) : super(key: key);

  @override
  _updateState createState() => _updateState();
}

class _updateState extends State<update> {
  final kantrol = TextEditingController();
  final aa_jag = FirebaseFirestore.instance;
  late String name ;
  late String f_name ;
  late String reg_no ;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.deepOrangeAccent,
            title: Text("UPDATE PAGE",),
            centerTitle: true,
          ),
          body: SafeArea(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [






                  Container(
                    color: Colors.white,
                    width: double.maxFinite,
                    height: 80,
                    child: Row(
                      children: [
                        MaterialButton(

                          onPressed: (){
                            setState(() {
                              Navigator.pop(context);

                            });
                          },
                          child: CircleAvatar(radius: 30,
                            backgroundColor: Colors.orangeAccent,
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Expanded(child: Padding(padding: EdgeInsets.all(4),child: TextField(
                            controller: kantrol,
                            onChanged: (value){setState(() {

                            });},
                            decoration: InputDecoration(
                                hintText: "Search the records",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(2)),

                                )
                            )
                        ),),),
                        SizedBox(width: 10,)
                      ],
                    ),
                  ),





                  Expanded(child: StreamBuilder(
                      stream: aa_jag.collection("Live data").snapshots(),
                      builder: (context , AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator(),);
                        }
                        return snapshot.hasData ?
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index)
                          {
                            String name = snapshot.data!.docs[index]['name'];
                            String f_name = snapshot.data!.docs[index]['father'];
                            String reg = snapshot.data!.docs[index]['reg'];

                            if(kantrol.text.isEmpty){
                              // scroll_Controller.jumpTo(scroll_Controller.position.maxScrollExtent);
                              return Padding(padding: EdgeInsets.symmetric(horizontal: 30,vertical: 16),child: ListTile(
                                  tileColor: Colors.lightGreenAccent.withOpacity(0.8),
                                  title: Text("$name"),
                                  subtitle: Text("Father Name: $f_name \nRegistration Number : $reg\n" ),


                                  trailing: GestureDetector(
                                    child: Icon(Icons.edit),
                                    onTap: (){


                                      showModalBottomSheet(
                                          shape: const RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.vertical(top: Radius.circular(25.0))),
                                          backgroundColor: Colors.orange.withOpacity(0.9),
                                          context: context,
                                          isScrollControlled: true,
                                          builder: (context) => Padding(
                                            padding: EdgeInsets.only(top: 20,  right: 20,  left: 20,
                                                bottom: MediaQuery.of(context).viewInsets.bottom),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.min,
                                              children:  [

                                                Padding(padding:EdgeInsets.all(8),child: TextField(
                                                  onChanged: (value){
                                                    setState(() {

                                                      name= value;
                                                    });
                                                  },
                                                  decoration: InputDecoration(
                                                      helperMaxLines: 4,
                                                      hintText: "Enter New Title",
                                                      border: OutlineInputBorder(
                                                          borderRadius: BorderRadius.all(Radius.circular(30))
                                                      )
                                                  ),
                                                ),),
                                                Padding(padding:EdgeInsets.all(8),child: TextField(
                                                  onChanged: (value){
                                                    setState(() {

                                                      f_name= value;
                                                    });
                                                  },
                                                  decoration: InputDecoration(
                                                      helperMaxLines: 4,
                                                      hintText: "Enter father Name",
                                                      border: OutlineInputBorder(
                                                          borderRadius: BorderRadius.all(Radius.circular(30))
                                                      )
                                                  ),
                                                ),),
                                                Padding(padding:EdgeInsets.all(8),child: TextField(
                                                  onChanged: (value){
                                                    setState(() {

                                                      reg_no= value;
                                                    });
                                                  },
                                                  decoration: InputDecoration(
                                                      helperMaxLines: 4,
                                                      hintText: "Enter Registration Number",
                                                      border: OutlineInputBorder(
                                                          borderRadius: BorderRadius.all(Radius.circular(30))
                                                      )
                                                  ),
                                                ),),
                                                MaterialButton(
                                                  onPressed: () {

                                                    aa_jag.collection('Live data').doc(snapshot.data!.docs[index]['Date'].toString()).update({
                                                      "name" : name,
                                                      "father":f_name,
                                                      "reg":reg_no,

                                                    });

                                                    Navigator.pop(context);

                                                  },
                                                  color: Colors.white,
                                                  height: 40,
                                                  minWidth: 180,
                                                  elevation: 12,
                                                  child: Text("Submit Response"),
                                                  shape: OutlineInputBorder(
                                                    borderRadius: BorderRadius.all(Radius.circular(20)),
                                                    borderSide: BorderSide(color: Colors.transparent),
                                                  ),
                                                ),
                                                SizedBox(height: 30,),
                                              ],
                                            ),
                                          ));







                                    },
                                  )
                              ),);


                            }
                            else if(name.toLowerCase().contains(kantrol.text.toLowerCase())){
                              //scroll_Controller.jumpTo(scroll_Controller.position.maxScrollExtent);
                              return Padding(padding: EdgeInsets.symmetric(horizontal: 30,vertical: 16),child: ListTile(
                                  tileColor: Colors.lightGreenAccent.withOpacity(0.8),
                                  title: Text("$name"),
                                  subtitle: Text("Father Name: $f_name \nRegistration Number : $reg\n" ),


                                  trailing: GestureDetector(
                                    child: Icon(Icons.edit),
                                    onTap: (){


                                      showModalBottomSheet(
                                          shape: const RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.vertical(top: Radius.circular(25.0))),
                                          backgroundColor: Colors.orange.withOpacity(0.9),
                                          context: context,
                                          isScrollControlled: true,
                                          builder: (context) => Padding(
                                            padding: EdgeInsets.only(top: 20,  right: 20,  left: 20,
                                                bottom: MediaQuery.of(context).viewInsets.bottom),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.min,
                                              children:  [

                                                Padding(padding:EdgeInsets.all(8),child: TextField(
                                                  onChanged: (value){
                                                    setState(() {

                                                      name= value;
                                                    });
                                                  },
                                                  decoration: InputDecoration(
                                                      helperMaxLines: 4,
                                                      hintText: "Enter New Title",
                                                      border: OutlineInputBorder(
                                                          borderRadius: BorderRadius.all(Radius.circular(30))
                                                      )
                                                  ),
                                                ),),
                                                Padding(padding:EdgeInsets.all(8),child: TextField(
                                                  onChanged: (value){
                                                    setState(() {

                                                      f_name= value;
                                                    });
                                                  },
                                                  decoration: InputDecoration(
                                                      helperMaxLines: 4,
                                                      hintText: "Enter father Name",
                                                      border: OutlineInputBorder(
                                                          borderRadius: BorderRadius.all(Radius.circular(30))
                                                      )
                                                  ),
                                                ),),
                                                Padding(padding:EdgeInsets.all(8),child: TextField(
                                                  onChanged: (value){
                                                    setState(() {

                                                      reg_no= value;
                                                    });
                                                  },
                                                  decoration: InputDecoration(
                                                      helperMaxLines: 4,
                                                      hintText: "Enter Registration Number",
                                                      border: OutlineInputBorder(
                                                          borderRadius: BorderRadius.all(Radius.circular(30))
                                                      )
                                                  ),
                                                ),),
                                                MaterialButton(
                                                  onPressed: () {

                                                    aa_jag.collection('Live data').doc(snapshot.data!.docs[index]['Date'].toString()).update({
                                                      "name" : name,
                                                      "father":f_name,
                                                      "reg":reg_no,

                                                    });

                                                    Navigator.pop(context);

                                                  },
                                                  color: Colors.white,
                                                  height: 40,
                                                  minWidth: 180,
                                                  elevation: 12,
                                                  child: Text("Submit Response"),
                                                  shape: OutlineInputBorder(
                                                    borderRadius: BorderRadius.all(Radius.circular(20)),
                                                    borderSide: BorderSide(color: Colors.transparent),
                                                  ),
                                                ),
                                                SizedBox(height: 30,),
                                              ],
                                            ),
                                          ));







                                    },
                                  )
                              ),);


                            }
                            else{
                              //scroll_Controller.jumpTo(scroll_Controller.position.maxScrollExtent);
                              return Container();
                            }
                          },
                        ) : Container();
                      }
                  ),),
                  SizedBox(height: 20,child: Container(color: Colors.white,),),

                ],
              ),
            ),
          )
      ),

    );
  }
}

