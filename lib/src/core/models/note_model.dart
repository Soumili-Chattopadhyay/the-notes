class NoteModel {
  String noteId, title, data;
  bool isFav;

  NoteModel({
    required this.noteId,
    required this.title,
    required this.data,
    this.isFav = false,
  });

  factory NoteModel.fromJson({required Map json, required String id}) {
    return NoteModel(
      noteId: id,
      title: json['title'],
      data: json['data'],
      isFav: json['isFav'],
    );
  }
}
