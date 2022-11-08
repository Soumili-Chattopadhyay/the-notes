import 'package:flutter/material.dart';

class NoteSpalsh extends StatelessWidget {
  const NoteSpalsh({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff13505b), Color(0xff000000)],
            begin: Alignment.topLeft,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.note_alt_outlined,
              color: Colors.white,
              size: MediaQuery.of(context).size.height * 0.2,
            ),
            const Text(
              '"If your diary is your HDD,\nhere is your SSD..."',
              textScaleFactor: 1.5,
              style: TextStyle(
                fontFamily: 'Yellowtail',
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
