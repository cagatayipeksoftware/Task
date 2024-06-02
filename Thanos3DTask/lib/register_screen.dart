import 'package:flutter/material.dart';
import 'package:thanos3dtask/main.dart';
import 'package:thanos3dtask/user_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:thanos3dtask/auth.dart';


class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _controllerPassword=TextEditingController();
  final TextEditingController _controllerEmail=TextEditingController();
  final TextEditingController _controllerName=TextEditingController();
  final TextEditingController _controllerSurname=TextEditingController();

  void navigateNextPage(BuildContext ctx){
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_){
      return UserScreen(name:_controllerName.text,surname:_controllerSurname.text);
    }));

    
  }
  bool _isObscured=true;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(  resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Text(
                "Create Account",
                style: TextStyle(
                    color: Colors.yellow,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(20, 10, 30, 20),
                  child: TextField( controller: _controllerName,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color.fromARGB(255, 31, 36, 48),
                      hintText: 'Name',
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
                ),Padding(
                  padding: EdgeInsets.fromLTRB(20, 5, 30, 20),
                  child: TextField(controller: _controllerSurname,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color.fromARGB(255, 31, 36, 48),
                      hintText: 'Surname',
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
                  padding: EdgeInsets.fromLTRB(20, 5, 30, 20),
                  child: TextField(
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
              Padding(padding: EdgeInsets.fromLTRB(20, 0, 30, 20),
                child: TextField(
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
              Spacer(),
              Padding(padding: EdgeInsets.only(bottom: 15),
                child: ElevatedButton(
                            onPressed:()=>{navigateNextPage(context)},
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.yellow,
                                minimumSize: Size(350, 55),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            child: const Text(
                              "Create Account",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            )),
              ),
              
              ElevatedButton(
                          onPressed:()=>{Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage()))},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              minimumSize: Size(350, 55),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          child: const Text(
                            "Cancel",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          )),

        ]      ),
            
              )    
        ),
        );
        
      
    
  }
}
