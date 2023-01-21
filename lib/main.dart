import 'package:flutter/material.dart';
import 'package:project_19_jan_2023/Dashboard.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
 await  Firebase.initializeApp();
  runApp( MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late String email;
  late String pass ;
  final authentic = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context)=>Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.purpleAccent,
                  child: Icon(Icons.login,size: 40,),

                ),
                SizedBox(height: 30,),
                Padding(padding: EdgeInsets.all(20),child: TextField(
                  onChanged: (value){
                    setState(() {
                      email = value;
                    });
                  },
                    decoration: InputDecoration(
                        hintText: "Enter Email",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(2)),
                        )
                    )
                ),),
                SizedBox(height: 10,),
                Padding(padding: EdgeInsets.all(20),child: TextField(
                  onChanged: (value){
                    setState(() {
                      pass = value;
                    });
                  },
                    obscureText: true,
                    decoration: InputDecoration(

                        hintText: "Enter Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(2)),
                        )
                    )
                ),),
                SizedBox(height: 30,),
                ElevatedButton(
                  onPressed: ()async{




                    final log_user = await authentic.signInWithEmailAndPassword(email: email, password: pass);
                    if(log_user!=null){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>dashboard()));
                    }
                    else{
                      print("Some Error");
                    }




                  },
                  child: Text("LOGIN"),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}


