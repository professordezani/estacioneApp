import 'package:br/datas/veiculo_data.dart';
import 'package:br/tiles/veiculo_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class VeiculosTile extends StatelessWidget {
  final DocumentSnapshot snapshot;

  VeiculosTile(this.snapshot);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: Firestore.instance
          .collection('empresas')
          .document(snapshot.documentID)
          .collection('veiculos')
          .getDocuments(),
      builder: (contex, snapshot) {
        if(!snapshot.hasData) return Center(child: CircularProgressIndicator(),);
        return Container(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index) {
                return VeiculoTile(VeiculoData.fromDocuments(snapshot.data.documents[index]));
              },
            )
        );
      },
    );
  }
}