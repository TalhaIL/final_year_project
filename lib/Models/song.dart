import 'package:cloud_firestore/cloud_firestore.dart';

class SongModel {
  String? songId;
  String? title;
  String? singer;
  String? writer;
  DateTime? uploadedDate;
  String? category;
  String? imageUrl;
  String? songUrl;

  SongModel({
    this.songId,
    this.title,
    this.singer,
    this.writer,
    this.uploadedDate,
    this.category,
    this.imageUrl,
    this.songUrl,
  });

  SongModel.fromFirestore(DocumentSnapshot doc) {
    songId = doc.get('songId');
    title = doc.get('title');
    singer = doc.get('singer');
    writer = doc.get('writer');
    uploadedDate = doc.get('uploadedDate');
    category = doc.get('category');
    imageUrl = doc.get('imageUrl');
    songUrl = doc.get('songUrl');
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['songId'] = songId;
    data['title'] = title;
    data['singer'] = singer;
    data['writer'] = writer;
    data['uploadedDate'] = uploadedDate;
    data['category'] = category;
    data['imageUrl'] = imageUrl;
    data['songUrl'] = songUrl;
    return data;
  }
}
