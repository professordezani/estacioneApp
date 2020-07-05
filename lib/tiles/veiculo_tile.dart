import 'package:br/datas/veiculo_data.dart';
import 'dart:async';
import 'package:flutter/material.dart';

class VeiculoTile extends StatefulWidget {
  final VeiculoData veiculo;

  VeiculoTile(this.veiculo);

  @override
  _VeiculoTileState createState() => _VeiculoTileState(veiculo);
}

class _VeiculoTileState extends State<VeiculoTile> {
  final VeiculoData veiculo;

  _VeiculoTileState(this.veiculo);

  bool _isStart = true;
  String _stopwatchText = '00:00';
  final _stopWatch = new Stopwatch();
  final _timeout = const Duration(seconds: 1);

  void _startTimeout() {
    new Timer(_timeout, _handleTimeout);
  }

  void _handleTimeout() {
    if (_stopWatch.isRunning) {
      _startTimeout();
    }
    setState(() {
      _setStopwatchText();
    });
  }

  void _startStopButtonPressed() {
    setState(() {
      if (_stopWatch.isRunning) {
        _isStart = true;
        _stopWatch.stop();
      } else {
        _isStart = false;
        _stopWatch.start();
        _startTimeout();
      }
    });
  }

  void _resetButtonPressed() {
    if (_stopWatch.isRunning) {
      _startStopButtonPressed();
    }
    setState(() {
      _stopWatch.reset();
      _setStopwatchText();
    });
  }

  void _setStopwatchText() {
    _stopwatchText =
        (_stopWatch.elapsed.inMinutes % 60).toString().padLeft(2, '0') +
            ':' +
            (_stopWatch.elapsed.inSeconds % 60).toString().padLeft(2, '0');
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final clock =
        Stream<DateTime>.periodic(const Duration(seconds: 1), (count) {
      return now.add(Duration(seconds: count));
    });
    return Card(
        elevation: 3,
        child: Padding(
          padding: EdgeInsets.fromLTRB(0, 10, 10, 10),
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
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Expanded(child: Container(),),
              Container(
                child: Column(
                  children: <Widget>[
                    Text(
                      veiculo.placa,
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      veiculo.empresa,
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(),
              ),
              Opacity(
                  opacity: veiculo.veiculoStatus ? 1 : 0,
                  child: Row(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(11),
                        decoration: BoxDecoration(
                          color: Colors.blueAccent,
                          borderRadius: new BorderRadius.only(
                            topLeft: const Radius.circular(5),
                            bottomLeft: const Radius.circular(5),
                          ),
                        ),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.access_time,
                              color: Colors.white,
                              size: 14,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            StreamBuilder<DateTime>(
                              stream: clock,
                              builder: (context, snapshot) {
                                return Text(
                                  _stopwatchText,
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.white),
                                );
                              },
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  child: FlatButton(
                      color: Colors.lightBlueAccent,
                      textColor: Colors.white,
                      padding: EdgeInsets.all(0),
                      child: Center(
                        child: Text(
                          !veiculo.veiculoStatus ? 'Entrada' : 'Saida',
                          style: TextStyle(fontSize: 13),
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                      onPressed: _startStopButtonPressed),
                ),
              ),
            ],
          ),
        ));
  }
}
