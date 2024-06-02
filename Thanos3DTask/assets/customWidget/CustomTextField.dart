import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  const CustomTextField(
      {super.key, required this.hintText,});
  @override
  Widget build(BuildContext context) {
    return TextField(
                  decoration: InputDecoration(
                filled: true,
                fillColor: Color.fromARGB(255, 31,36,48),
                hintText: '$hintText',
                hintStyle: TextStyle(color: Color.fromARGB(255,93,97,106),),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide.none,
                ),
                
              ));
  }
}
