import 'package:cloud_firestore/cloud_firestore.dart';

class VeiculoData {

  String category;
  String id;
  String placa;
  String entrada;
  String saida;
  bool veiculoStatus;

  VeiculoData.fromDocuments(DocumentSnapshot snapshot){
    id = snapshot.documentID;
    placa = snapshot.data["placa"];
    entrada = snapshot.data["entrada"];
    saida = snapshot.data["saida"];
    veiculoStatus = snapshot.data["veiculoStatus"];
  }

  Map<String, dynamic> toResumedMap(){
    return {
      'placa': placa,
      'entrada': entrada,
      'saida': saida,
      'veiculoStatus': veiculoStatus
    };
  }


}