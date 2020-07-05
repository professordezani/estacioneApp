import 'package:bubble_showcase/bubble_showcase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:speech_bubble/speech_bubble.dart';

class LogTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.fromLTRB(20, 30, 0, 20),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Container(
                    height: 15,
                    width: 15,
                    decoration: BoxDecoration(
                      color: Color(0xFF3197fd),
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
              LogContainer(),
              Row(
                children: <Widget>[
                  SizedBox(
                    width: 7,
                  ),
                  Container(width: 1,height: 10, color: Colors.grey,),
                ],
              ),
              LogContainer(),
              Row(
                children: <Widget>[
                  Container(
                    height: 15,
                    width: 15,
                    decoration: BoxDecoration(
                      color: Color(0xFF3197fd),
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}

class LogContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(width: 1,height: 30, color: Colors.grey,),
            Container(
              alignment: Alignment.center,
              height: 15,
              width: 15,
              decoration: BoxDecoration(
                color: Color(0xFF3197fd),
                shape: BoxShape.circle,
              ),
            ),
            Container(width: 1,height: 30, color: Colors.grey,),
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
                      Icons.arrow_left,
                      color: Colors.red,
                      size: 35,
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          Text(
                            '05/07',
                            style: TextStyle(fontSize: 10),
                          ),
                          Text(
                            '03:41',
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
                      child: Column(
                        children: <Widget>[
                          Text(
                            'ABC-123',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Itamarati #12345',
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


/*Row(
children: <Widget>[
SizedBox(
width: 8,
),
Dash(
direction: Axis.vertical,
length: 50,
dashLength: 100,
dashColor: Colors.grey),
],
),*/