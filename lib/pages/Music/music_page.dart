import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:playbeat/Models/song.dart';
import 'package:playbeat/Utilities/overlays_widgets.dart';
import 'package:playbeat/pages/Widgets/music_container.dart';

class SongView extends StatelessWidget {
  final String? categoryId;
  final bool? isAllSongs;
  const SongView({Key? key, this.categoryId, this.isAllSongs})
      : super(key: key);

  Future getSongsData() async {
    try {
      FirebaseFirestore fireStore = FirebaseFirestore.instance;
      QuerySnapshot snapshot = await fireStore.collection('songs').get();
      return snapshot.docs;
    }
    
     catch (e) {
      errorOverlay(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: isAllSongs == true
          ? null
          : AppBar(
              title: Text(categoryId.toString()),
            ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
        child: FutureBuilder(
          future: getSongsData(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot data = snapshot.data[index];
                  if (categoryId == data['category'] || isAllSongs == true) {
                    return MusicContainer(
                      isAdmin: false,
                      title: data['title'],
                      singer: data['singer'],
                      writer: data['writer'],
                      uploadedDate: data['uploadedDate'],
                      imageUrl: data['imageUrl'],
                    );
                  } else {
                    return Container();
                  }
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
    );
  }
}

class PlayerHome extends StatelessWidget {
  final SongModel? song;
  const PlayerHome({super.key, this.song});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
