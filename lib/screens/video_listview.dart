import 'dart:async';

import 'package:arm_project/models/video_model.dart';
import 'package:arm_project/screens/video_player.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class VideoListView extends StatefulWidget {
  @override
  _VideoListViewState createState() => _VideoListViewState();
}

class _VideoListViewState extends State<VideoListView> {
  //  Explicit
  Firestore firestore = Firestore.instance;
  StreamSubscription<QuerySnapshot> subscription;
  List<DocumentSnapshot> snapshots;
  List<VideoModel> videoModels = [];

  //  Methods
  @override
  void initState() {
    super.initState();
    readFireStore();
  }

  Future<void> readFireStore() async {
    CollectionReference collectionReference = firestore.collection('Video');
    subscription = await collectionReference.snapshots().listen((dataSnapshot) {
      snapshots = dataSnapshot.documents;
      for (var snapshot in snapshots) {
        String nameString = snapshot.data['Name'];
        String detailString = snapshot.data['Detail'];
        String imageString = snapshot.data['PathImage'];
        String videoString = snapshot.data['PathVideo'];

        VideoModel videoModel = VideoModel(
          nameString,
          detailString,
          imageString,
          videoString,
        );

        setState(() {
          videoModels.add(videoModel);
        });

        print('name $nameString');
      }
    });
  }

  Widget showImage(int index) {
    return Container(
      padding: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
      width: MediaQuery.of(context).size.width * 0.5,
      child: Image.network(
        videoModels[index].pathImage,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget showName(int index) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      alignment: Alignment.topLeft,
      child: Text(
        videoModels[index].name,
        style: TextStyle(
          fontSize: 18.0,
        ),
      ),
    );
  }

  Widget showDetail(int index) {
    String detailShort = videoModels[index].detail;

    if (detailShort.length > 50) {
      detailShort = detailShort.substring(0, 50);
      detailShort = '$detailShort ...';
    }

    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      child: Text(detailShort),
    );
  }

  Widget showText(int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        showName(index),
        showDetail(index),
      ],
    );
  }

  Widget showVideoListView() {
    return ListView.builder(
      itemCount: videoModels.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          child: Row(
            children: <Widget>[
              showImage(index),
              showText(index),
            ],
          ),
          onTap: () {
            MaterialPageRoute materialPageRoute = MaterialPageRoute(
              builder: (BuildContext context) => VideoPlayer(
                    videoModel: videoModels[index],
                  ),
            );

            Navigator.of(context).push(materialPageRoute);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return showVideoListView();
  }
}
