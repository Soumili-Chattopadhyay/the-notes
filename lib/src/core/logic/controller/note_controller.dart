// ignore_for_file: prefer_final_fields

import 'dart:developer';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:get/get.dart';
import 'package:the_notes/src/core/models/note_model.dart';

class NoteController extends GetxController {
  int i = 0;
 
  RxList<NoteModel> _allNotes = RxList<NoteModel>([]);
  RxList<NoteModel> _favNotes = RxList<NoteModel>([]);

  List<NoteModel> get getAllNotes => _allNotes;
  List<NoteModel> get getFavNotes => _favNotes;
  

  late final CollectionReference _userNoteCollection;
  final User user;

  NoteController({
    required this.user,
  }) {
    _userNoteCollection = FirebaseFirestore.instance.collection(user.uid);

    _userNoteCollection.snapshots().listen((event) {
      // log('event: ${event.docs[0].id}');
      // final noteList =
      // log(noteList.toString());

      _allNotes.value = (event.docs)
          .map((e) => NoteModel.fromJson(json: e.data() as Map, id: e.id))
          .toList();
    }, onError: (error) {
      log('error: $error');
    });


     _userNoteCollection.snapshots().listen((event) {
      _favNotes.value = (event.docs)
          .map((e) => NoteModel.fromJson(json: e.data() as Map, id: e.id))
          .where((element) => element.isFav).toList();
    }, onError: (error) {
      log('error: $error');
    });
    
   
  }

  Future<dynamic> createNote(bool isFav) async {
    await _userNoteCollection.add({
      'title': 'new note',
      'data': '',
      'isFav': isFav,
    });
  }

  Future<bool> saveNote(NoteModel input) async {
    bool hasError = false;
    log(input.noteId);
    await _userNoteCollection.doc(input.noteId).set({
      'title': input.title,
      'data': input.data,
      'isFav': input.isFav,
    }).onError((error, stackTrace) => hasError = true);
    return hasError;
  }

  Future<dynamic> deleteNote(NoteModel input) async {
    await _userNoteCollection.doc(input.noteId).delete();
  }
}
