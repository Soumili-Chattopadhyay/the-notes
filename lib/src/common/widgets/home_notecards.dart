import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:the_notes/src/core/logic/controller/note_controller.dart';
import 'package:the_notes/src/core/models/note_model.dart';
import 'package:the_notes/src/screens/note_screen.dart';

class HomeNoteCard extends StatefulWidget {
  final NoteModel noteModel;

  HomeNoteCard({
    required this.noteModel,
  
    Key? key,
  }) : super(key: key);

  @override
  State<HomeNoteCard> createState() => _HomeNoteCardState();
}

class _HomeNoteCardState extends State<HomeNoteCard> {
  final NoteController _noteController = Get.find(tag: '_noteController');
  double cardDepth = 10;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Neumorphic(
          style: NeumorphicStyle(
            color: Colors.white.withOpacity(0.0),
            depth: 0,
            shadowDarkColor: Color(0xff220901).withOpacity(0.6),
            shadowLightColor: Color(0xffffffff).withOpacity(0.3),
          ),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width * 0.8,
          ),
        ),
        Positioned(
          bottom: 0.5,
          child: Padding(
            padding: EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 5.0),
            child: Slidable(
              endActionPane: ActionPane(
                motion: const DrawerMotion(),
                children: [
                  SlidableAction(
                    onPressed: ((context) {
                      widget.noteModel.isFav = !widget.noteModel.isFav;
                      _noteController.saveNote(widget.noteModel);
                    }),
                    backgroundColor: Colors.white.withOpacity(0.5),
                    icon: (widget.noteModel.isFav)? Icons.favorite: Icons.favorite_outline,
                    label: 'fav',
                    foregroundColor: Colors.pink,
                    borderRadius: BorderRadius.circular(20.0),

                  ),
                  SlidableAction(
                    onPressed: ((context) {
                      _noteController.deleteNote(widget.noteModel);
                    }),
                    backgroundColor: Colors.amberAccent
                    .withOpacity(0.5),
                    icon: Icons.delete,
                    label: 'del',
                    foregroundColor: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ],
              ),
              child: GestureDetector(
                // onTap: () {
                //   setState(() {
                //     cardDepth = -cardDepth;
                //   });
                // },
                onDoubleTap: () {
                  setState(() {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => NotePad(noteModel: widget.noteModel)));
                  });
                },
                child: Neumorphic(
                  style: NeumorphicStyle(
                    shape: NeumorphicShape.convex,
                    boxShape: NeumorphicBoxShape.roundRect(
                        BorderRadius.circular(12.0)),
                    color: Colors.transparent,
                    depth: cardDepth,
                    shadowDarkColor: Color(0xff220901).withOpacity(0.6),
                    shadowLightColor: Color(0xffffffff).withOpacity(0.8),
                    shadowDarkColorEmboss: Color(0xff220901).withOpacity(0.6),
                    shadowLightColorEmboss: Color(0xffffffff).withOpacity(0.5),
                  ),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.15,
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: Center(
                      child: Text(
                        widget.noteModel.data,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 10.0,
          left: 20.0,
          child: Container(
            height: 35.0,
            width: 150.0,
            decoration: BoxDecoration(
              // color: Colors.pink,
              borderRadius: BorderRadius.circular(12.0),
              gradient: const LinearGradient(
                colors: [
                  // Color(0xffffffff),
                  // Color(0xff97dffc),
                  // Color(0xff4895ef),
                  // Color(0xff4361ee),
                  // Color(0xff354fab),

                  // Color(0xff4a006f)

                  Color(0xffffef00),
                  Color(0xffff6600),
                  Color(0xffff0f7b),
                  Color(0xffd90368),
                  Color(0xff7a0062),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(2.0),
                child: Text(
                  widget.noteModel.title,
                  style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 1.2,
                    fontFamily: 'PaytoneOne',
                  ),
                ),
              ),
            ),
          ),
        ),
        // Positioned(

        //   child: Container(),
        // ),
      ],
    );
  }
}
