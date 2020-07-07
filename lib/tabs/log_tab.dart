import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:speech_bubble/speech_bubble.dart';

class LogTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: FutureBuilder<QuerySnapshot>(
        future: Firestore.instance.collection("log").getDocuments(),
        builder: (context, snapshot){
          if(!snapshot.hasData)
            return Center(
              child: CircularProgressIndicator(),
            );
          else
            return ListView(
              children: snapshot.data.documents.map((doc) => LogTile(doc)).toList(),
            );
        },
      ),
    );
  }
}


class LogTile extends StatelessWidget {

  final DocumentSnapshot snapshot;
  LogTile(this.snapshot);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              width: 1,
              height: 30,
              color: Colors.grey,
            ),
            Container(
              alignment: Alignment.center,
              height: 15,
              width: 15,
              decoration: BoxDecoration(
                color: Color(0xFF3197fd),
                shape: BoxShape.circle,
              ),
            ),
            Container(
              width: 1,
              height: 30,
              color: Colors.grey,
            ),
          ],
        ),
        SizedBox(
          width: 10,
        ),
        Container(
          child: SpeechBubble(
              color: Colors.white,
              nipLocation: NipLocation.LEFT,
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 10, 10),
                child: Row(
                  children: <Widget>[
                    Icon(
                      snapshot.data['entrada'] ? Icons.arrow_right : Icons.arrow_left,
                      color: snapshot.data['entrada'] ? Colors.green : Colors.red,
                      size: 35,
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          Text(
                            snapshot.data['dia'],
                            style: TextStyle(fontSize: 10),
                          ),
                          Text(
                            snapshot.data['hora'],
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      width: 80,
                      child: Column(
                        children: <Widget>[
                          Text(
                            snapshot.data['placa'],
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            snapshot.data['empresa'],
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
        ),
        Expanded(
          child: Container(),
        ),
        Row(
          children: <Widget>[
            Container(
              child: Image.network(
                  'https://firebasestorage.googleapis.com/v0/b/appcatraca-75f27.appspot.com/o/user.png?alt=media&token=f5350349-726e-4a01-af20-58a6d783ef57'),
              width: 20,
            ),
            Text(
              "Ottoniel Matheus",
              style: TextStyle(fontSize: 11),
            )
          ],
        ),
        Expanded(
          child: Container(),
        ),
        Expanded(
          child: Container(),
        ),
      ],
    );
  }
}