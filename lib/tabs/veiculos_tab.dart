import '../models/vehicle.dart';
import '../models/company.dart';
import '../endpoints/company_api.dart';
import 'package:br/tiles/veiculo_tile.dart';
import 'package:flutter/material.dart';

class VeiculosTile extends StatelessWidget {
  final Company company;
  Future<List<Vehicle>> vehicles;

  VeiculosTile(this.company) {
    vehicles = CompanyApi().getFleet(company.id);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Vehicle>>(
      future: vehicles,
      builder: (contex, snapshot) {
        if(!snapshot.hasData) return Center(child: CircularProgressIndicator(),);
        return Container(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return VeiculoTile(company.name, snapshot.data[index]);
              },
            )
        );
      },
    );
  }
}