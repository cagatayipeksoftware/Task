import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:thanos3dtask/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:thanos3dtask/main.dart';
import 'firebase_options.dart';

class UserScreen extends StatelessWidget {
  
  Future<void> signOut() async{
    try{
      await Auth().signOut();
      }
      on FirebaseAuthException catch(e){
        print("$e");
      }
      } 
  const UserScreen({super.key,this.name,this.surname});
  final String? name;
  final String? surname;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Spacer(),
        Center(
          child: Text(
            "$name,$surname",
            style: TextStyle(
                color: Colors.yellow,
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
        ),
        Spacer(),
        Padding(padding: EdgeInsets.only(bottom: 50),
          child: ElevatedButton(
                          onPressed:()=>{signOut(),Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage()))},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.yellow,
                              minimumSize: Size(350, 55),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          child: const Text(
                            "Logout",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          )),
        )
      ]),
    );
  }
}
