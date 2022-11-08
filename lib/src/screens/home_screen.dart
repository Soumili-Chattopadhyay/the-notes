import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:the_notes/src/common/widgets/home_bkg.dart';
import 'package:the_notes/src/common/widgets/home_notecards.dart';
import 'package:the_notes/src/core/logic/controller/note_controller.dart';
import 'package:the_notes/src/core/logic/controller/weather_controller.dart';
import 'package:the_notes/src/core/logic/controller/user_controller.dart';
import 'package:the_notes/src/core/models/weaher_model.dart';

class NoteHome extends StatefulWidget {
  // ignore: non_constant_identifier_names
  double? temp_c;
  String? text;
  User user;
  NoteHome({
    // ignore: non_constant_identifier_names
    required this.temp_c,
    required this.text,
    required this.user,
    Key? key,
  }) : super(key: key);

  @override
  State<NoteHome> createState() => _NoteHomeState();
}

class _NoteHomeState extends State<NoteHome> with TickerProviderStateMixin {
  final WeatherController _weatherController =
      Get.find(tag: '_weatherController');
  late final NoteController _noteController;

  late final AnimationController _animationController1;
  late final TabController _tabController;
  @override
  void initState() {
    _noteController =
        Get.put(NoteController(user: widget.user), tag: '_noteController');
    _animationController1 = AnimationController(
      vsync: this,
      duration: const Duration(microseconds: 100),
    );
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
    super.initState();
  }

  static final DateTime today = DateTime.now();
  // static final DateTime today1 = DateTime(today.day, today.month, today.year);

  double tabDepthOn = -10;
  double tabDepthOff = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(onPressed: () async {
      //   _noteController.createNote();
      // }),
      body: Stack(
        children: [
          const HomeBkg(),
          Align(
            alignment: Alignment.centerLeft,
            child: Obx(
              () => Visibility(
                visible: _weatherController.getVisibility,
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.transparent,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      RotatedBox(
                        quarterTurns: 3,
                        child: NeumorphicText(
                          '${today.day}/${today.month}/${today.year}',
                          style: NeumorphicStyle(
                            color: Colors.white.withOpacity(0.7),
                            depth: 5,
                          ),
                          textStyle: NeumorphicTextStyle(
                            fontFamily: 'SigmarOne',
                            fontSize: 25.0,
                          ),
                        ),
                      ),
                      FutureBuilder<WeatherModel>(
                        future: _weatherController.fetchweatherDetails(),
                        builder: ((context, snapshot) {
                          if (snapshot.hasData) {
                            return RotatedBox(
                              quarterTurns: 3,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  NeumorphicText(
                                    '${snapshot.data?.temp_c}°C',
                                    textStyle: NeumorphicTextStyle(
                                      fontFamily: 'SecularOne',
                                      fontSize: 50.0,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: NeumorphicText(
                                      ('${snapshot.data?.text}'),
                                      style: const NeumorphicStyle(
                                        border: NeumorphicBorder(
                                          color: Colors.white,
                                          isEnabled: true,
                                        ),
                                        color: Colors.transparent,
                                      ),
                                      textStyle: NeumorphicTextStyle(
                                        fontFamily: 'PaytoneOne',
                                        fontSize: 25,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        }),
                      ),
                      RotatedBox(
                        quarterTurns: 3,
                        child: NeumorphicText(
                          'Here\'s a random quote for the writer...',
                          style: NeumorphicStyle(
                            // border: NeumorphicBorder(
                            //   color: Colors.white.withOpacity(0.3),
                            //   isEnabled: true,
                            //   width: 1.0,
                            // ),
                            color: Colors.white.withOpacity(0.8),
                            depth: 5,
                          ),
                          textStyle: NeumorphicTextStyle(
                            fontFamily: 'Yellowtail',
                            fontSize: 25.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          AnimatedBuilder(
            animation: _animationController1,
            builder: (context, _) => Transform(
              transform: Matrix4.identity()
                ..scale(1 - (_animationController1.value * 0.2))
                ..translate(_animationController1.value * 200),
              alignment: Alignment.center,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 15.0, vertical: 40.0),
                  child: Neumorphic(
                    style: NeumorphicStyle(
                      boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(20.0)),
                      depth: 20,
                      color: Colors.white.withOpacity(0.4),
                      shadowDarkColor: Color(0xff000000).withOpacity(0.7),
                      shadowLightColor: Color(0xffffffff).withOpacity(0.7),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.06,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Flexible(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.all(0.2),
                                  child: MaterialButton(
                                    shape: const CircleBorder(),
                                    color: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    hoverElevation: 0.0,
                                    elevation: 0.0,
                                    highlightElevation: 0.0,
                                    highlightColor: Colors.transparent,
                                    onPressed: () {
                                      _animationController1.isCompleted
                                          ? _animationController1.reverse()
                                          : _animationController1.forward();
                                      _weatherController.setVisibility =
                                          !_weatherController.getVisibility;
                                    },
                                    child: NeumorphicIcon(
                                      Icons.compare_arrows_rounded,
                                      size: 35.0,
                                      style: NeumorphicStyle(
                                        shape: NeumorphicShape.convex,
                                        color: Colors
                                            .transparent, //const Color(0xff621708)
                                        // .withOpacity(0.1),
                                        border: const NeumorphicBorder(
                                          isEnabled: true,
                                          color: Colors.white,
                                          width: 1.0,
                                        ),
                                        depth: 5,
                                        shadowDarkColor:
                                            const Color(0xff220901)
                                                .withOpacity(0.7),
                                        shadowLightColor:
                                            const Color(0xffffffff),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Flexible(
                                flex: 5,
                                child: Container(),
                              ),
                              Flexible(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.all(0.2),
                                  child: MaterialButton(
                                    shape: const CircleBorder(),
                                    color: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    hoverElevation: 0.0,
                                    elevation: 0.0,
                                    highlightElevation: 0.0,
                                    highlightColor: Colors.transparent,
                                    onPressed: () {
                                      _noteController.createNote(_tabController.index == 1);
                                    },
                                    child: NeumorphicIcon(
                                      Icons.add_rounded,
                                      size: 35.0,
                                      style: NeumorphicStyle(
                                        shape: NeumorphicShape.convex,
                                        color: Colors
                                            .transparent, //(0xff621708).withOpacity(0.1),
                                        border: const NeumorphicBorder(
                                          isEnabled: true,
                                          color: Colors.white,
                                          width: 1.0,
                                        ),
                                        depth: 5,
                                        shadowDarkColor: Color(0xff220901)
                                            .withOpacity(0.7),
                                        shadowLightColor: Color(0xffffffff),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
                          child: TabBar(
                            controller: _tabController,
                            indicatorColor: Colors.transparent,
                            isScrollable: false,
                            labelPadding: EdgeInsets.zero,
                            // onTap: (value) {
                            //   setState(() {
                            //     tabDepthAll = -tabDepthAll;
                            //     tabDepthFav = -tabDepthFav;
                            //   });
                            // },
                            tabs: [
                              Neumorphic(
                                padding: EdgeInsets.all(6),
                                style: NeumorphicStyle(
                                  shape: NeumorphicShape.convex,
                                  boxShape: NeumorphicBoxShape.roundRect(
                                    const BorderRadius.only(
                                      topLeft: Radius.circular(40.0),
                                      bottomLeft: Radius.circular(40.0),
                                      topRight: Radius.circular(0.0),
                                      bottomRight: Radius.circular(0.0),
                                    ),
                                  ),
                                  depth: (_tabController.index == 0)? tabDepthOn:tabDepthOff,
                                  color: Colors.transparent,
                                  shadowDarkColor:
                                      Color(0xff000000).withOpacity(0.5),
                                  shadowDarkColorEmboss:
                                      Color(0xff000000).withOpacity(0.5),
                                  shadowLightColor:
                                      Color(0xffffffff).withOpacity(0.7),
                                  shadowLightColorEmboss:
                                      Color(0xffffffff).withOpacity(0.5),
                                ),
                                child: Center(
                                  child: NeumorphicText(
                                    'All',
                                    style: NeumorphicStyle(
                                      color: const Color(0xff621708)
                                          .withOpacity(0.1),
                                      border: const NeumorphicBorder(
                                        isEnabled: true,
                                        color: Colors.white,
                                        width: 1.0,
                                      ),
                                      depth: 5.0,
                                    ),
                                    textStyle: NeumorphicTextStyle(
                                      fontFamily: 'SigmarOne',
                                      fontSize: 22,
                                    ),
                                  ),
                                ),
                              ),
                              Neumorphic(
                                padding: EdgeInsets.all(6),
                                style: NeumorphicStyle(
                                  shape: NeumorphicShape.convex,
                                  boxShape: NeumorphicBoxShape.roundRect(
                                    const BorderRadius.only(
                                      topRight: Radius.circular(40.0),
                                      bottomRight: Radius.circular(40.0),
                                      topLeft: Radius.circular(0.0),
                                      bottomLeft: Radius.circular(0.0),
                                    ),
                                  ),
                                  depth: (_tabController.index == 1)? tabDepthOn:tabDepthOff,
                                  color: Colors.transparent,
                                  shadowDarkColor:
                                      Color(0xff000000).withOpacity(0.5),
                                  shadowDarkColorEmboss:
                                      Color(0xff000000).withOpacity(0.5),
                                  shadowLightColor:
                                      Color(0xffffffff).withOpacity(0.7),
                                  shadowLightColorEmboss:
                                      Color(0xffffffff).withOpacity(0.5),
                                ),
                                child: Center(
                                  child: NeumorphicText(
                                    'Fav',
                                    style: NeumorphicStyle(
                                      color:
                                          Color(0xffff0f7b).withOpacity(0.3),
                                      border: NeumorphicBorder(
                                        isEnabled: true,
                                        color: Colors.white,
                                        width: 1.0,
                                      ),
                                      depth: 5.0,
                                    ),
                                    textStyle: NeumorphicTextStyle(
                                      fontFamily: 'SigmarOne',
                                      fontSize: 22,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: TabBarView(
                            controller: _tabController,
                              physics: NeverScrollableScrollPhysics(),
                              children: [
                                Obx(
                                  () => SingleChildScrollView(
                                    padding: EdgeInsets.fromLTRB(
                                        0.0, 20.0, 0.0, 10.0),
                                    child: Column(
                                      children: _noteController.getAllNotes
                                          .map((e) => Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 5.0,
                                                    horizontal: 20.0),
                                                child: HomeNoteCard(
                                                    noteModel: e),
                                              ))
                                          .toList(),
                                    ),
                                  ),
                                ),
                                Obx(
                                  () => SingleChildScrollView(
                                    padding: EdgeInsets.fromLTRB(
                                        0.0, 20.0, 0.0, 10.0),
                                    child: Column(
                                      children: _noteController.getFavNotes
                                          .map((e) => Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 5.0,
                                                    horizontal: 20.0),
                                                child: HomeNoteCard(
                                                    noteModel: e),
                                              ))
                                          .toList(),
                                    ),
                                  ),
                                )
                              ]),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
