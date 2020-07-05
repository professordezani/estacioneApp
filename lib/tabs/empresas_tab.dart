import 'package:br/tiles/empresas_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EmpresasTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            height: 60,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 3,
                    child: Container(),
                  ),
                  Expanded(
                      flex: 1,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                        child: OutlineButton(
                          padding: EdgeInsets.all(0),
                          color: Colors.red,
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(5)),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Icon(
                                  Icons.filter_list,
                                  size: 17,
                                ),
                              ),
                              Expanded(
                                  child: Center(
                                child: Text(
                                  '1',
                                  style: TextStyle(fontSize: 12),
                                ),
                              ))
                            ],
                          ),
                          onPressed: () {},
                        ),
                      )),
                  SizedBox(width: 10),
                  Expanded(
                      flex: 3,
                      child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                    width: 1, color: Colors.grey[300])),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                      child: TextField(
                                          decoration: InputDecoration(
                                              border: InputBorder.none)),
                                    margin: EdgeInsets.all(5),
                                  ),
                                  flex: 3,
                                ),
                                Expanded(
                                  child: Icon(Icons.search),
                                  flex: 1,
                                )
                              ],
                            ),
                          ))),
                ],
              ),
            )),
        Expanded(
            flex: 8,
            child: FutureBuilder<QuerySnapshot>(
              future: Firestore.instance.collection("empresas").getDocuments(),
              builder: (context, snapshot) {
                if (!snapshot.hasData)
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                else
                  return ListView(
                    children: snapshot.data.documents
                        .map((doc) => EmpresasTile(doc))
                        .toList(),
                  );
              },
            )),
      ],
    );
  }
}
