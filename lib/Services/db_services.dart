import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:playbeat/Models/category_model.dart';
import 'package:playbeat/Models/song_model.dart';
import 'package:playbeat/Models/user_model.dart';
import 'package:playbeat/Utilities/overlays_widgets.dart';

class DBServices {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  static String songs = 'songs';
  static String categories = 'categories';
  static String users = 'users';

  Future<void> createUser(UserModel userModel) async {
    try {
      await firestore.collection(users).doc(userModel.userId).set(
            userModel.toJson(),
          );
    } catch (e) {
      errorOverlay(e.toString());
    }
  }

  Future<UserModel> getUser(String userID) async {
    try {
      final retrval = await firestore
          .collection(users)
          .doc(userID)
          .get()
          .then((DocumentSnapshot doc) {
        UserModel data = UserModel();
        data = UserModel.fromFirestore(doc);
        return data;
      });
      return retrval;
    } catch (e) {
      Get.snackbar('User failed', e.toString());
      rethrow;
    }
  }

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
