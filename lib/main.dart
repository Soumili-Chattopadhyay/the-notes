import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_notes/firebase_options.dart';
import 'package:the_notes/src/core/logic/controller/note_controller.dart';
import 'package:the_notes/src/core/logic/controller/weather_controller.dart';
import 'package:the_notes/src/core/logic/controller/user_controller.dart';
import 'package:the_notes/src/screens/home_screen.dart';
import 'package:the_notes/src/screens/login_screen.dart';
import 'package:the_notes/src/screens/splash_screen.dart';
import 'package:the_notes/src/test_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const TheNotes());
}

class TheNotes extends StatefulWidget {
  const TheNotes({Key? key}) : super(key: key);

  @override
  State<TheNotes> createState() => _TheNotesState();
}

class _TheNotesState extends State<TheNotes> {
  final UserController _userController =
      Get.put(UserController(), tag: '_userController');
  final WeatherController _weatherController = Get.put(
    WeatherController(),
    tag: '_weatherController',
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Obx(() {
        if (_userController.user != null) {
          return NoteHome(
            temp_c: _weatherController.getweatherDetails?.temp_c,
            text: _weatherController.getweatherDetails?.text,
            user: _userController.user!,
          );
        } else {
          return const NoteLogIn();
        }
      }),
    );
  }
}
