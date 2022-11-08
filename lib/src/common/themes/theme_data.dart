// import 'package:flutter/material.dart';
// // TODO: Choose color for text

// enum NoteTheme {
//   white,
//   black,
//   summer,
//   monsoon,
//   autumn,
//   winter,
//   spring,
// }

// ThemeData getCurrentTheme(NoteTheme currentTheme) {
//   switch (currentTheme) {
//     case NoteTheme.spring:
//       return springTheme();
//     case NoteTheme.summer:
//       return summerTheme();
//     case NoteTheme.monsoon:
//       return monsoonTheme();
//     case NoteTheme.autumn:
//       return autumnTheme();
//     case NoteTheme.winter:
//       return winterTheme();
//     case NoteTheme.white:
//       return whiteTheme();
//     case NoteTheme.black:
//       return balckTheme();
//   }
// }

// ThemeData summerTheme() {
//   return ThemeData(
//     scaffoldBackgroundColor: Colors.amber,
//     appBarTheme: AppBarTheme(
//       backgroundColor: Colors.white.withOpacity(0.5),
//       actionsIconTheme: const IconThemeData(color: Colors.white),
//       centerTitle: false,
//       titleTextStyle: const TextStyle(
//         fontFamily: 'Gemunu Libre',
//         fontWeight: FontWeight.w700,
//         color: Colors.white,
//         letterSpacing: 0.7,
//       ),
//     ),
//     fontFamily: 'Gemunu Libre',
//     textTheme: TextTheme(
//       bodyLarge: const TextStyle(
//         fontFamily: 'Gemunu Libre',
//         fontSize: 2.0,
//       ),
//       bodyMedium: const TextStyle(
//         fontFamily: 'Gemunu Libre',
//         fontSize: 1.0,
//       ),
//       bodySmall:const TextStyle(
//         fontFamily: 'Gemunu Libre',
//         fontSize: 0.5,
//       ),
//       bodyText1: const TextStyle(
//         fontFamily: 'Gemunu Libre',
//       ),
//     ),
//   );
// }

// ThemeData monsoonTheme() {
//   return ThemeData(
//     scaffoldBackgroundColor: Colors.blueGrey,
//     appBarTheme: AppBarTheme(
//       backgroundColor: Colors.white.withOpacity(0.5),
//       actionsIconTheme: const IconThemeData(color: Colors.white),
//       centerTitle: false,
//       titleTextStyle: const TextStyle(
//         fontFamily: 'Gemunu Libre',
//         fontWeight: FontWeight.w700,
//         color: Colors.white,
//         letterSpacing: 0.7,
//       ),
//     ),
//     fontFamily: 'Gemunu Libre',
//     textTheme: TextTheme(
//       bodyLarge: const TextStyle(
//         fontFamily: 'Gemunu Libre',
//         fontSize: 2.0,
//       ),
//       bodyMedium: const TextStyle(
//         fontFamily: 'Gemunu Libre',
//         fontSize: 1.0,
//       ),
//       bodySmall:const TextStyle(
//         fontFamily: 'Gemunu Libre',
//         fontSize: 0.5,
//       ),
//       bodyText1: const TextStyle(
//         fontFamily: 'Gemunu Libre',
//       ),
//     ),
//   );
// }

// ThemeData autumnTheme() {
//   return ThemeData(
//     scaffoldBackgroundColor: Colors.deepPurple,
//     appBarTheme: AppBarTheme(
//       backgroundColor: Colors.white.withOpacity(0.5),
//       actionsIconTheme: const IconThemeData(color: Colors.white),
//       centerTitle: false,
//       titleTextStyle: const TextStyle(
//         fontFamily: 'Gemunu Libre',
//         fontWeight: FontWeight.w700,
//         color: Colors.white,
//         letterSpacing: 0.7,
//       ),
//     ),
//     fontFamily: 'Gemunu Libre',
//     textTheme: TextTheme(
//       bodyLarge: const TextStyle(
//         fontFamily: 'Gemunu Libre',
//         fontSize: 2.0,
//       ),
//       bodyMedium: const TextStyle(
//         fontFamily: 'Gemunu Libre',
//         fontSize: 1.0,
//       ),
//       bodySmall:const TextStyle(
//         fontFamily: 'Gemunu Libre',
//         fontSize: 0.5,
//       ),
//       bodyText1: const TextStyle(
//         fontFamily: 'Gemunu Libre',
//       ),
//     ),
//   );
// }

// ThemeData winterTheme() {
//   return ThemeData(
//     scaffoldBackgroundColor: Colors.indigo,
//     appBarTheme: AppBarTheme(
//       backgroundColor: Colors.white.withOpacity(0.5),
//       actionsIconTheme: const  IconThemeData(color: Colors.white),
//       centerTitle: false,
//       titleTextStyle: const TextStyle(
//         fontFamily: 'Gemunu Libre',
//         fontWeight: FontWeight.w700,
//         color: Colors.white,
//         letterSpacing: 0.7,
//       ),
//     ),
//     fontFamily: 'Gemunu Libre',
//     textTheme: TextTheme(
//       bodyLarge: const TextStyle(
//         fontFamily: 'Gemunu Libre',
//         fontSize: 2.0,
//       ),
//       bodyMedium: const TextStyle(
//         fontFamily: 'Gemunu Libre',
//         fontSize: 1.0,
//       ),
//       bodySmall:const TextStyle(
//         fontFamily: 'Gemunu Libre',
//         fontSize: 0.5,
//       ),
//       bodyText1: const TextStyle(
//         fontFamily: 'Gemunu Libre',
//       ),
//     ),
//   );
// }

// ThemeData springTheme() {
//   return ThemeData(
//     scaffoldBackgroundColor: Colors.pink,
//     appBarTheme: AppBarTheme(
//       backgroundColor: Colors.white.withOpacity(0.5),
//       actionsIconTheme: const IconThemeData(color: Colors.white),
//       centerTitle: false,
//       titleTextStyle: const TextStyle(
//         fontFamily: 'Gemunu Libre',
//         fontWeight: FontWeight.w700,
//         color: Colors.white,
//         letterSpacing: 0.7,
//       ),
//     ),
//     fontFamily: 'Gemunu Libre',
//     textTheme: TextTheme(
//       bodyLarge: const TextStyle(
//         fontFamily: 'Gemunu Libre',
//         fontSize: 2.0,
//       ),
//       bodyMedium: const TextStyle(
//         fontFamily: 'Gemunu Libre',
//         fontSize: 1.0,
//       ),
//       bodySmall:const TextStyle(
//         fontFamily: 'Gemunu Libre',
//         fontSize: 0.5,
//       ),
//       bodyText1: const TextStyle(
//         fontFamily: 'Gemunu Libre',
//       ),
//     ),
//   );
// }

// ThemeData balckTheme() {
//   return ThemeData(
//     scaffoldBackgroundColor: Colors.black,
//     appBarTheme: AppBarTheme(
//       backgroundColor: Colors.white.withOpacity(0.5),
//       actionsIconTheme: const IconThemeData(color: Colors.white),
//       centerTitle: false,
//       titleTextStyle: const TextStyle(
//         fontFamily: 'Gemunu Libre',
//         fontWeight: FontWeight.w700,
//         color: Colors.white,
//         letterSpacing: 0.7,
//       ),
//     ),
//     fontFamily: 'Gemunu Libre',
//     textTheme: TextTheme(
//       bodyLarge: const TextStyle(
//         fontFamily: 'Gemunu Libre',
//         fontSize: 2.0,
//       ),
//       bodyMedium: const TextStyle(
//         fontFamily: 'Gemunu Libre',
//         fontSize: 1.0,
//       ),
//       bodySmall:const TextStyle(
//         fontFamily: 'Gemunu Libre',
//         fontSize: 0.5,
//       ),
//       bodyText1: const TextStyle(
//         fontFamily: 'Gemunu Libre',
//       ),
//     ),
//   );
// }

// ThemeData whiteTheme() {
//   return ThemeData(
//     scaffoldBackgroundColor: Colors.white,
//     appBarTheme: AppBarTheme(
//       backgroundColor: Colors.white.withOpacity(0.5),
//       actionsIconTheme: const IconThemeData(color: Colors.white),
//       centerTitle: false,
//       titleTextStyle: const TextStyle(
//         fontFamily: 'Gemunu Libre',
//         fontWeight: FontWeight.w700,
//         color: Colors.white,
//         letterSpacing: 0.7,
//       ),
//     ),
//     fontFamily: 'Gemunu Libre',
//     textTheme: TextTheme(
//       bodyLarge: const TextStyle(
//         fontFamily: 'Gemunu Libre',
//         fontSize: 2.0,
//       ),
//       bodyMedium: const TextStyle(
//         fontFamily: 'Gemunu Libre',
//         fontSize: 1.0,
//       ),
//       bodySmall:const TextStyle(
//         fontFamily: 'Gemunu Libre',
//         fontSize: 0.5,
//       ),
//       bodyText1: const TextStyle(
//         fontFamily: 'Gemunu Libre',
//       ),
//     ),
//   );
// }