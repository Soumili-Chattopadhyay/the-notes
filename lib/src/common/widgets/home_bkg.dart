import 'dart:ui';
import 'package:flutter/material.dart';

class HomeBkg extends StatelessWidget {
  const HomeBkg({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: double.maxFinite,
          width: double.maxFinite,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/b24277412a3de887cc46d4974d2f2877.jpg',
              ),
              fit: BoxFit.cover
            ),
          ),
        ),
        Container(
          height: double.maxFinite,
          width: double.maxFinite,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                // Color(0xff70e000),
                // Color(0xff3259b3).withOpacity(0.8),
                // Color(0xff354fab).withOpacity(0.8),
                // Color(0xff3745a4).withOpacity(0.8),
                // Color(0xff3a3b9c).withOpacity(0.8),
                // Color(0xff3d3195).withOpacity(0.8),
                // Color(0xff3f288d).withOpacity(0.8),
                // Color(0xff421e86).withOpacity(0.8),
                // Color(0xff45147e).withOpacity(0.8),
                // Color(0xff470a77).withOpacity(0.8),
                // Color(0xff4a006f).withOpacity(0.8),

                Color(0xfff6aa1c).withOpacity(0.7),
                Color(0xffbc3908).withOpacity(0.7),
                Color(0xffbc3908).withOpacity(0.7),
                Color(0xff941b0c).withOpacity(0.7),
                Color(0xff621708).withOpacity(0.7),
                Color(0xff220901).withOpacity(0.7),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.35,
          // left: MediaQuery.of(context).size.width,
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                        'assets/images/kisscc0-padma-sacred-lotus-buddhism-buddhist-symbolism-prismatic-lotus-flower-6-5cadeadb524561.359902221554901723337.png'))),
          ),
        ),
        // Positioned(
        //   top: MediaQuery.of(context).size.height * 0.35,
        //   // left: MediaQuery.of(context).size.width*0.03,
        //   child: Container(
        //     height: MediaQuery.of(context).size.height,
        //     width: MediaQuery.of(context).size.width,
        //     decoration: const BoxDecoration(
        //         image: DecorationImage(
        //             image: AssetImage('assets/images/Statue-Buddha-Face.png'))),
        //   ),
        // ),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
          blendMode: BlendMode.plus,
          child: const SizedBox(
            height: double.maxFinite,
            width: double.maxFinite,
          ),
        ),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
          // blendMode: BlendMode.colorDodge,
          child: const SizedBox(
            height: double.maxFinite,
            width: double.maxFinite,
          ),
        ),
      ],
    );
  }
}
