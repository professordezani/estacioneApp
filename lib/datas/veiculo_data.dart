import 'package:cloud_firestore/cloud_firestore.dart';

class VeiculoData {

  String category;
  String id;
  String placa;
  String entrada;
  String saida;
  String tempo;
  bool veiculoStatus;

  VeiculoData.fromDocuments(DocumentSnapshot snapshot){
    id = snapshot.documentID;
    placa = snapshot.data["placa"];
    entrada = snapshot.data["entrada"];
    saida = snapshot.data["saida"];
    tempo = snapshot.data["tempo"];
    veiculoStatus = snapshot.data["veiculoStatus"];
  }

  Map<String, dynamic> toResumedMap(){
    return {
      'placa': placa,
      'entrada': entrada,
      'saida': saida,
      'tempo': tempo,
      'veiculoStatus': veiculoStatus
    };
  }


}