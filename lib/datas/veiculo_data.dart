import 'package:cloud_firestore/cloud_firestore.dart';

class VeiculoData {

  String category;
  String id;
  String placa;
  String entrada;
  String saida;
  String tempo;
  String empresa;
  bool veiculoStatus;

  VeiculoData.fromDocuments(DocumentSnapshot snapshot){
    id = snapshot.documentID;
    placa = snapshot.data["placa"];
    entrada = snapshot.data["entrada"];
    saida = snapshot.data["saida"];
    empresa = snapshot.data["empresa"];
    tempo = snapshot.data["tempo"];
    veiculoStatus = snapshot.data["veiculoStatus"];
  }

  Map<String, dynamic> toResumedMap(){
    return {
      'placa': placa,
      'entrada': entrada,
      'saida': saida,
      'empresa': empresa,
      'tempo': tempo,
      'veiculoStatus': veiculoStatus
    };
  }


}