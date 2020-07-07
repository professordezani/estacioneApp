import 'dart:async';
import 'package:intl/intl.dart';
import 'package:br/models/vehicle.dart';
import '../endpoints/vehicle_api.dart';
import 'package:flutter/material.dart';

class VeiculoTile extends StatefulWidget {
  final String nomeEmpresa;
  final Vehicle veiculo;

  VeiculoTile(this.nomeEmpresa, this.veiculo);

  @override
  _VeiculoTileState createState() => _VeiculoTileState(nomeEmpresa, veiculo);
}

class _VeiculoTileState extends State<VeiculoTile> {
  final String nomeEmpresa;
  final Vehicle _veiculo;
  Duration _current;
  var vehicleApi = VehicleApi();
  
  _VeiculoTileState(this.nomeEmpresa, this._veiculo);

  void register() {
    setState(() async {
      try {
        if (!_veiculo.lastRecord.onGarage) {
          var moment = await vehicleApi.arrival(_veiculo.id);
          _veiculo.lastRecord.moment = moment;
          _veiculo.lastRecord.onGarage = true;
        } else {
          var moment = await vehicleApi.departure(_veiculo.id);
          _veiculo.lastRecord.moment = moment;
          _veiculo.lastRecord.onGarage = false;
        }
      } catch (ex) {}
    });
  }

  void startTimer() {
    new Timer.periodic(Duration(seconds: 1), 
      (Timer timer) => setState(() {
          _current = DateTime.now().difference(_veiculo.lastRecord.moment);
        },
      ),
    );
  }

  String _printDuration(Duration duration) {
    if (duration != null) {
      String twoDigits(int n) => n.toString().padLeft(2, "0");
      String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
      String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
      return "$twoDigitMinutes:$twoDigitSeconds";
    }
    return "";
  }

  @override
  void initState() {
    super.initState();
    startTimer();
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
                _veiculo.lastRecord.onGarage ? Icons.arrow_right : Icons.arrow_left,
                color: _veiculo.lastRecord.onGarage ? Colors.green : Colors.red,
                size: 35,
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Text(
                      new DateFormat('dd/MM').format(_veiculo.lastRecord.moment), // dia e mes
                      style: TextStyle(fontSize: 10),
                    ),
                    Text(
                      new DateFormat('hh:mm').format(_veiculo.lastRecord.moment), // horário e minuto
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
                      _veiculo.licensePlate,
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      nomeEmpresa,
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(),
              ),
              Opacity(
                  opacity: _veiculo.lastRecord.onGarage ? 1 : 0,
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
                                  _printDuration(_current),
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
                          !_veiculo.lastRecord.onGarage ? 'Entrada' : 'Saida',
                          style: TextStyle(fontSize: 13),
                        ),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                      onPressed: register),
                ),
              ),
            ],
          ),
        ));
  }
}
