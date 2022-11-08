import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_notes/src/core/logic/controller/user_controller.dart';

class LogInTextField extends StatefulWidget {
  final String labelText;
  final TextEditingController controller;
  const LogInTextField({
    required this.controller,
    required this.labelText,
    Key? key,
  }) : super(key: key);

  @override
  State<LogInTextField> createState() => _LogInTextFieldState();
}

class _LogInTextFieldState extends State<LogInTextField> {
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 50.0),
      child: Card(
        color: Colors.transparent,
        elevation: 15.0,
        shadowColor: const Color(0xff64dfdf).withOpacity(0.4),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: TextFormField(
          controller: widget.controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white.withOpacity(0.35),
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(20.0),
            ),
            floatingLabelAlignment: FloatingLabelAlignment.start,
            floatingLabelStyle: const TextStyle(color: Colors.transparent),
            labelText: widget.labelText,
            labelStyle: const TextStyle(fontFamily: 'SecularOne'),
          ),
          // cursorColor: Colors.white,
          showCursor: false,
          style: const TextStyle(color: Color(0xffffffff), fontFamily: 'PaytoneOne'),
        ),
      ),
    );
  }
}
