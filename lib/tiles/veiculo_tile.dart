import 'package:br/datas/veiculo_data.dart';
import 'package:flutter/material.dart';

class VeiculoTile extends StatelessWidget {
  final VeiculoData veiculo;

  VeiculoTile(this.veiculo);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        children: <Widget>[
          Icon(
            veiculo.veiculoStatus ? Icons.arrow_left : Icons.arrow_right,
            color: veiculo.veiculoStatus ? Colors.red : Colors.green,
            size: 35,
          ),
          Container(
            child: Column(
              children: <Widget>[
                Text(
                  veiculo.entrada,
                  style: TextStyle(fontSize: 10),
                ),
                Text(
                  veiculo.saida,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
