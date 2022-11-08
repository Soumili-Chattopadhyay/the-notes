import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_notes/src/common/widgets/login_input.dart';
// import 'package:the_notes/src/common/themes/mode_data.dart';
import 'package:the_notes/src/core/logic/controller/mode_controller.dart';
import 'package:the_notes/src/core/logic/controller/user_controller.dart';
import 'package:the_notes/src/screens/home_screen.dart';

class NoteLogIn extends StatefulWidget {
  const NoteLogIn({Key? key}) : super(key: key);

  @override
  State<NoteLogIn> createState() => _NoteLogInState();
}

class _NoteLogInState extends State<NoteLogIn> {
  final UserController _userController = Get.find(tag: '_userController');
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _mailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            height: double.maxFinite,
            width: double.maxFinite,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/blurry-50e9d4414e-1200x675.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            height: double.maxFinite,
            width: double.maxFinite,
            color: Colors.black.withOpacity(0.6),
          ),
          Container(
            height: double.maxFinite,
            width: double.maxFinite,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color(0xff07beb8).withOpacity(0.5),
                  const Color(0xff13505b).withOpacity(0.5),
                  const Color(0xff1c2541).withOpacity(0.7),
                  const Color(0xff0b132b).withOpacity(0.7),
                ],
                begin: Alignment.topLeft,
              ),
            ),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const <Padding>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(5.0, 100.0, 0.0, 100.0),
                      child: Text(
                        'Hello',
                        style: TextStyle(
                          fontFamily: 'PaytoneOne',
                          color: Colors.white,
                          fontSize: 70.0,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0.0, 80.0, 5.0, 50.0),
                      child: Text(
                        'Writer',
                        style: TextStyle(
                          fontFamily: 'CedarvilleCursive',
                          color: Colors.white,
                          fontSize: 50.0,
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        for (int i = 0; i < 3; i++)
                          LogInTextField(
                            labelText: ((i == 0)
                                ? 'Name'
                                : ((i == 1) ? 'Mail ID' : 'Password')),
                            controller: ((i == 0)
                                ? _nameController
                                : ((i == 1)
                                    ? _mailController
                                    : _passwordController)),
                          ),
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 0.0),
                          child: Card(
                            color: Colors.transparent,
                            elevation: 15.0,
                            shadowColor: Colors.black,
                            // const Color(0xff64dfdf).withOpacity(0.4),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Container(
                              height: 60,
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                                gradient: LinearGradient(
                                  colors: [
                                    const Color(0xfffffe3a).withOpacity(1.0),
                                    const Color(0xff6fffe9).withOpacity(0.9),
                                    const Color(0xff00ffff).withOpacity(0.8),
                                    const Color(0xff00d4ff).withOpacity(0.7),
                                    // const Color(0xff13505b).withOpacity(0.6),
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomCenter,
                                ),
                              ),
                              child: MaterialButton(
                                onPressed: () {
                                  _userController.login(_mailController.text,
                                      _passwordController.text);
                                },
                                hoverColor: Colors.transparent,
                                hoverElevation: 0.0,
                                highlightElevation: 0.0,
                                elevation: 0.0,
                                color: Colors.transparent,
                                child: const Text(
                                  'LogIn',
                                  style: TextStyle(
                                    fontFamily: 'PaytoneOne',
                                    fontSize: 15.0,
                                    color: Color(0xff1c2541),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}





// ...



// Card(
//                                 color: Colors.transparent,
//                                 clipBehavior: Clip.antiAlias,
//                                 elevation: 15.0,
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(100.0),
//                                 ),
//                                 child: Container(
//                                   height: double.maxFinite,
//                                   width: double.maxFinite,
//                                   decoration: BoxDecoration(
//                                     gradient: const LinearGradient(
//                                       colors: [
//                                         Color(0xfffffe3a),
//                                         Color(0xff6fffe9),
//                                         Color(0xff00ffff),
//                                         Color(0xff00d4ff),
//                                       ],
//                                       begin: Alignment.topLeft,
//                                       end: Alignment.bottomCenter,
//                                     ),
//                                     borderRadius: BorderRadius.circular(100.0),
//                                   ),
//                                   child: Container(
//                                     height: double.maxFinite,
//                                     width: double.maxFinite,
//                                     color: Colors.white.withOpacity(0.2),
//                                     child: MaterialButton(
//                                       onPressed: () {},
//                                       child: const Icon(
//                                         Icons.edit_note_rounded,
//                                         size: 35.0,
//                                         color: Color(0xff13505b),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ),
