import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'Dashboard.dart';

class delete extends StatefulWidget {
  const delete({Key? key}) : super(key: key);

  @override
  _deleteState createState() => _deleteState();
}

class _deleteState extends State<delete> {
  final aa_jag = FirebaseFirestore.instance;

  final kantrol = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.redAccent,
            title: Text("DELETE PAGE",),
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
                            backgroundColor: Colors.redAccent,
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
                                    child: Icon(Icons.delete),
                                    onTap: ()async{
                                      await aa_jag.collection('Live data').doc(snapshot.data!.docs[index]['Date'].toString()).delete().then((value) => print("Deleted"))
                                          .catchError((error) => print('Delete failed: $error'));
                                      print("Deleted");
                                      print("Deleted");
                                    },
                                  )
                              ),);


                            }
                            else if(name.toLowerCase().contains(kantrol.text.toLowerCase())){
                              //scroll_Controller.jumpTo(scroll_Controller.position.maxScrollExtent);
                              return Padding(padding: EdgeInsets.symmetric(horizontal: 30,vertical: 16),child: ListTile(
                                  tileColor: Colors.greenAccent.withOpacity(0.5),
                                  title: Text("$name"),
                                  subtitle: Text("Father Name: $f_name \nRegistration Number : $reg\n" ),


                                  trailing: GestureDetector(
                                    child: Icon(Icons.delete),
                                    onTap: ()async{
                                      await aa_jag.collection('Live data').doc(snapshot.data!.docs[index]['Date'].toString()).delete().then((value) => print("Deleted"))
                                          .catchError((error) => print('Delete failed: $error'));
                                      print("Deleted");
                                      print("Deleted");
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
