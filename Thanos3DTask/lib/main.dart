
import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thanos3dtask/register_screen.dart';
import 'package:thanos3dtask/splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:thanos3dtask/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:thanos3dtask/user_screen.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
  
}

class MyApp extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Page',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        textTheme: GoogleFonts.tienneTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: SplashScreen(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
  String? errorMessage='';
  final TextEditingController _controllerEmail=TextEditingController();
  final TextEditingController _controllerPassword=TextEditingController();
  
  Future<void> signInWithEmailAndPassword() async{
    try{
      await Auth().signInWithEmailAndPassword(email: _controllerEmail.text, password: _controllerPassword.text);
      }
      on FirebaseAuthException catch(e){
        print("$e");
      }
      } 
  bool isChecked = false;
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(children: [
          Positioned.fill(
            child: Image.network(
              'https://github.com/Fukulu/KratosTask/blob/main/Background.png?raw=true', // 
              fit: BoxFit.cover,
            ),
          ),
          Container(
            color: Colors.black.withOpacity(0),
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Image.network(
              "https://github.com/Fukulu/KratosTask/blob/main/Logo.png?raw=true",
              height: 300,
            )
          ]),
          Center(
              child: Padding(
            padding: EdgeInsets.only(top: 380),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 30, 20),
                  child: TextField(controller: _controllerEmail,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color.fromARGB(255, 31, 36, 48),
                      hintText: 'Email Address',
                      hintStyle: TextStyle(
                          color: Color.fromARGB(255, 93, 97, 106),
                          fontWeight: FontWeight.w500),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 30, 20),
                  child: TextField(controller: _controllerPassword,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color.fromARGB(255, 31, 36, 48),
                      hintText: 'Password',
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isObscured
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            _isObscured = !_isObscured;
                          });
                        },
                      ),
                      hintStyle: TextStyle(
                        color: Color.fromARGB(255, 93, 97, 106),
                        fontWeight: FontWeight.w500,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Row(
                  children: [
                    Checkbox(
                      value: isChecked,
                      onChanged: (value) => {
                        setState(() {
                          isChecked = value!;
                        })
                      },
                      activeColor: Colors.green,
                    ),
                    const Text(
                      "Remember me",
                      style: TextStyle(
                          color: Color.fromARGB(255, 93, 97, 106),
                          fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    const TextButton(
                        onPressed: null,
                        child: Text("Forgot password ?",
                            style:
                                TextStyle(color: Colors.yellow, fontSize: 12))),
                  ],
                ),
                Column(
                  children: [
                    ElevatedButton(
                        onPressed:()=>{signInWithEmailAndPassword(),Navigator.push(context, MaterialPageRoute(builder: (context)=> const UserScreen()))},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.yellow,
                            minimumSize: Size(340, 55),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: const Text(
                          "Login Now",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      
                      children: [
                        
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Text(
                            "Don't have an account? $errorMessage",
                            style: TextStyle(color: Colors.blueGrey,fontSize: 18),
                          ),
                          
                        ),
                      Padding(padding: EdgeInsets.only(top: 10,left: 6),child:TextButton(child: Text("Create one",style: TextStyle(color: Colors.yellow,fontSize: 18),),onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=> const RegisterPage()));
                        
                      },
                      )
                      )
                      ],
                    )
                  ],
                )
              ],
            ),
          ))
        ]));
  }
}
