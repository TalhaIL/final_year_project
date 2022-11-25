import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:playbeat/Models/song_model.dart';
import 'package:playbeat/Services/player_service.dart';
import 'package:playbeat/Utilities/global_variables.dart';
import 'package:playbeat/pages/Widgets/music_container.dart';
import 'package:playbeat/pages/Widgets/player_ui.dart';
// ignore: depend_on_referenced_packages
import 'package:rxdart/rxdart.dart' as rx;
import '../../Constants/global_var.dart';
import '../../Services/player_common.dart';

class SongView extends StatefulWidget {
  final String? categoryId;
  final bool isAdmin;
  final bool? isAllSongs;
  final bool userUploads;
  const SongView(
      {Key? key,
      this.categoryId,
      this.isAllSongs,
      required this.isAdmin,
      required this.userUploads})
      : super(key: key);

  @override
  State<SongView> createState() => _SongViewState();
}

class _SongViewState extends State<SongView> {
  late AudioPlayer _player;
  @override
  void initState() {
    super.initState();
    _player = AudioPlayer();
  }

  @override
  void dispose() {
    currentAudioText.value = '';
    isPlaying.value = false;
    _player.dispose();
    super.dispose();
  }

  Stream<PositionData> get _positionDataStream =>
      rx.Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
          _player.positionStream,
          _player.bufferedPositionStream,
          _player.durationStream,
          (position, bufferedPosition, duration) => PositionData(
              position, bufferedPosition, duration ?? Duration.zero));

  Future<List<SongModel>> getAdminSongsData() async {
    FirebaseFirestore fireStore = FirebaseFirestore.instance;
    return await fireStore
        .collection('songs')
        .where('status', isEqualTo: 'Pending')
        .get()
        .then((snapshot) {
      List<SongModel> retVal = [];
      for (var doc in snapshot.docs) {
        retVal.add(SongModel.fromFirestore(doc));
      }
      return retVal;
    });
  }

  Future<List<SongModel>> getUserUploadSongsData() async {
    FirebaseFirestore fireStore = FirebaseFirestore.instance;
    return await fireStore
        .collection('songs')
        .where('uploadedBy', isEqualTo: userID.value)
        .get()
        .then((snapshot) {
      List<SongModel> retVal = [];
      for (var doc in snapshot.docs) {
        retVal.add(SongModel.fromFirestore(doc));
      }
      return retVal;
    });
  }

  Future<List<SongModel>> getUserSongsData() async {
    FirebaseFirestore fireStore = FirebaseFirestore.instance;
    return await fireStore
        .collection('songs')
        .where('category', isEqualTo: widget.categoryId)
        .where('status', isEqualTo: 'approved')
        .get()
        .then((snapshot) {
      List<SongModel> retVal = [];
      for (var doc in snapshot.docs) {
        retVal.add(SongModel.fromFirestore(doc));
      }
      return retVal;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.isAllSongs == true ||
              widget.isAdmin == true ||
              widget.userUploads == true
          ? null
          : AppBar(
              title: Text(widget.categoryId.toString()),
            ),
      backgroundColor: Colors.white,
      extendBody: false,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
        child: FutureBuilder<List<SongModel>>(
          future: widget.isAdmin == true
              ? getAdminSongsData()
              : widget.userUploads == true
                  ? getUserUploadSongsData()
                  : getUserSongsData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.requireData.length,
                itemBuilder: (context, index) {
                  final data = snapshot.requireData[index];
                  return GestureDetector(
                    onTap: () async {
                      isAudioLoading.value = true;
                      final playlist =
                          PlayerService().buildAudios(snapshot.requireData);
                      await PlayerService()
                          .buildPlayer(_player, playlist, initialIndex: index);
                    },
                    child: MusicContainer(
                      isUserUpload: widget.userUploads,
                      status: data.status.toString(),
                      isAdmin: widget.isAdmin,
                      songId: data.songId ?? '',
                      title: data.title,
                      singer: data.singer,
                      writer: data.writer,
                      category: data.category,
                      uploadedDate: data.uploadedDate,
                      imageUrl: data.imageUrl,
                    ),
                  );
                },
              );
            } else {
              if (snapshot.hasError) {
                log(snapshot.error.toString());
                return Text(snapshot.error.toString());
              }
              log('error');
              return const Text('Error');
            }
          },
        ),
      ),
      bottomNavigationBar: Obx(
        () => isPlaying.value
            ? PlayerUi(player: _player, positionDataStream: _positionDataStream)
            : const SizedBox(),
      ),
    );
  }
}
