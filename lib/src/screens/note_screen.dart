import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:the_notes/src/core/logic/controller/note_controller.dart';
import 'package:the_notes/src/core/models/note_model.dart';

class NotePad extends StatefulWidget {
  final NoteModel noteModel;
  NotePad({
    required this.noteModel,
    Key? key,
  }) : super(key: key);

  @override
  State<NotePad> createState() => _NotePadState();
}

class _NotePadState extends State<NotePad> {
  final NoteController _noteController = Get.find(tag: '_noteController');
  late final TextEditingController _dataController;
  late final TextEditingController _titleController;
  @override
  void initState() {
    _dataController = TextEditingController.fromValue(
        TextEditingValue(text: widget.noteModel.data));
    _titleController = TextEditingController.fromValue(
        TextEditingValue(text: widget.noteModel.title));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          NoteBkg(),
          CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: Color(0xffc8b6ff),
                elevation: 15.0,
                forceElevated: true,
                shadowColor: Color(0xff5a189a),
                automaticallyImplyLeading: false,
                centerTitle: false,
                expandedHeight: 200.0,
                floating: true,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  expandedTitleScale: 2.5,
                  centerTitle: false,
                  title: Row(
                    children: [
                      Flexible(child: BackButton()),
                      Expanded(
                        flex: 2,
                        child: TextField(
                          onChanged: (value) {
                            widget.noteModel.title = value;
                          },
                          controller: _titleController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            counterText: '',
                          ),
                          maxLength: 10,
                          style: TextStyle(
                            fontFamily: 'PaytoneOne',
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  background: ImageFiltered(
                    imageFilter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                    child: Image(
                      image: AssetImage(
                          'assets/images/rameswaram-temple-history.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, _) {
                    return Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(20.0),
                          child: Container(
                            // width: MediaQuery.of(context).size.width * 0.8,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            // height: 100,
                            constraints: BoxConstraints(
                              minHeight:
                                  MediaQuery.of(context).size.height * 0.6,
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(12.0),
                              child: TextField(
                                onChanged: (value) {
                                  setState(() {
                                    widget.noteModel.data = value;
                                  });
                                },
                                controller: _dataController,
                                maxLines: null,
                                cursorColor: Color(0xff9d0208),
                                cursorWidth: 1.0,
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontFamily: 'SecularOne',
                                ),
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 50.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            gradient: LinearGradient(
                              colors: [
                                Color(0xffffffbd00),
                                Color(0xfffb5607),
                                Color(0xffff006e),
                                Color(0xffdc2f02),
                                Color(0xff9d0208),
                                Color(0xff370617),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: MaterialButton(
                            onPressed: () async {
                              if (await _noteController
                                  .saveNote(widget.noteModel)) {
                                Fluttertoast.showToast(msg: 'Error');
                              } else {
                                Fluttertoast.showToast(msg: 'Success');
                              }
                            },
                            elevation: 0.0,
                            hoverElevation: 0.0,
                            highlightElevation: 0.0,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            color: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            height: 50.0,
                            child: Text(
                              'Save',
                              style: TextStyle(
                                fontFamily: 'PaytoneOne',
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                  childCount: 1,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class NoteBkg extends StatelessWidget {
  const NoteBkg({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: double.maxFinite,
          width: double.maxFinite,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/1_Za3f_uJ4KO1pFziHGrNGmA.png'),
                fit: BoxFit.cover),
          ),
        ),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 10.0),
          child: Container(
            height: double.maxFinite,
            width: double.maxFinite,
            color: Colors.white.withOpacity(0.3),
          ),
        ),
      ],
    );
  }
}
