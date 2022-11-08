import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:the_notes/src/core/logic/controller/user_controller.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final UserController _userController = Get.find(tag: '_userController');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await _userController.login('soumili@arindam.in', 'arindamsoumili');
        },
      ),
      body: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${_userController.user?.email}'),
            Text('${_userController.user?.uid}'),
          ],
        ),
      ),
    );
  }
}
