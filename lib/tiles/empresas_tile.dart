import '../tabs/veiculos_tab.dart';
import '../models/company.dart';
import 'package:flutter/material.dart';

class EmpresasTile extends StatelessWidget {

  final Company company;

  EmpresasTile(this.company);

  @override
  Widget build(BuildContext context) {

    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        child:
        Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(right: 5),
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: new DecorationImage(
                          fit: BoxFit.fill,
                          image: new NetworkImage(company.thumbnail)
                      )
                  ),
                ),
                Text(company.name)
              ],
            ),
            VeiculosTile(company)
          ],)
    );
  }

}
