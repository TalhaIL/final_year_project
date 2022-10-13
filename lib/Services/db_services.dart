import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:playbeat/Models/category.dart';
import 'package:playbeat/Models/song.dart';

class DBServices {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  static String songs = 'songs';
  static String categories = 'categories';

  Future<void> uploadSong(SongModel songModel) async {
    final id = firestore.collection(songs).doc().id;
    songModel.songId = id;
    await firestore.collection(songs).doc(id).set(songModel.toJson());
  }

  Future<void> addCategory(CategoryModel categoryModel) async {
    final id = firestore.collection(categories).doc().id;
    categoryModel.categoryId = id;
    await firestore.collection(categories).doc(id).set(categoryModel.toJson());
  }
}
