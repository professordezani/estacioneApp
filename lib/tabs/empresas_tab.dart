import 'package:br/tiles/empresas_tile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class EmpresasTab extends StatefulWidget {
  @override
  _EmpresasTabState createState() => _EmpresasTabState();
}

class _EmpresasTabState extends State<EmpresasTab> {
  bool filtro = false;
  bool checkedValue;

  @override
  Widget build(BuildContext context) {
    return !filtro
        ? Column(
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
                              padding: EdgeInsets.symmetric(
                                  horizontal: 0, vertical: 10),
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
                                onPressed: () {
                                  setState(() {
                                    filtro = true;
                                  });
                                },
                              ),
                            )),
                        SizedBox(width: 10),
                        Expanded(
                            flex: 3,
                            child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 0, vertical: 10),
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
                    future: Firestore.instance
                        .collection("empresas")
                        .getDocuments(),
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
          )
        : ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.arrow_back),
                        iconSize: 30,
                        onPressed: () {
                          setState(() {
                            filtro = false;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Wrap(
                      runSpacing: 5,
                      alignment: WrapAlignment.start,
                      children: <Widget>[
                        SelectedItems("na garagem", true),
                        SelectedItems("entrada", true),
                        SelectedItems("Itamarati", false),
                        SelectedItems("motta", false),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Row(
                      children: <Widget>[
                        Text(
                          "Filtros",
                          style: TextStyle(fontSize: 25),
                        ),
                      ],
                    ),
                  ),
                  Garagem(),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              'Empresa',
                              style: TextStyle(fontSize: 17),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Wrap(
                    runSpacing: 5,
                    spacing: 2,
                    children: <Widget>[
                      FiltroEmpresa("Itamarati", true),
                      FiltroEmpresa("Motta", true),
                      FiltroEmpresa("São Raphael", false),
                      FiltroEmpresa("Santa Luzia", false),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              'Sentido',
                              style: TextStyle(fontSize: 17),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 38),
                    child: Row(
                      children: <Widget>[
                        FiltroEmpresa("Entrada", true),
                        FiltroEmpresa("Saida", false),
                      ],
                    ),
                  )
                ],
              )
            ],
          );
  }
}

//Itens do Filtro que foram selecionados

class SelectedItems extends StatelessWidget {
  String nameSelectedItems;
  bool statusSelectedItems;

  SelectedItems(this.nameSelectedItems, this.statusSelectedItems);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
          color: statusSelectedItems ? Color(0xFF3399ff) : Colors.grey,
          borderRadius: BorderRadius.all(Radius.circular(2))),
      margin: EdgeInsets.only(right: 5),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: 80,
          ),
          child: Text(
            nameSelectedItems,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        ),
      ),
    );
  }
}

//Somente Garagem

class Garagem extends StatefulWidget {
  @override
  _GaragemState createState() => _GaragemState();
}

class _GaragemState extends State<Garagem> {
  bool statusSwitch = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          height: 1,
          color: Colors.grey[300],
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Somente na garagem"),
              GestureDetector(
                onTap: () {
                  setState(() {
                    statusSwitch = !statusSwitch;
                  });
                },
                child: Center(
                  child: FlutterSwitch(
                    height: 20.0,
                    width: 40.0,
                    padding: 4.0,
                    toggleSize: 15.0,
                    borderRadius: 10.0,
                    activeColor: Color(0xFF3399ff),
                    value: statusSwitch,
                    onToggle: (value) {
                      setState(() {
                        statusSwitch = value;
                      });
                    },
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          height: 1,
          color: Colors.grey[300],
        ),
      ],
    );
  }
}

//Item Filtro Empresa

class FiltroEmpresa extends StatefulWidget {
  String name;
  bool checkedValue;

  FiltroEmpresa(this.name, this.checkedValue);

  @override
  _FiltroEmpresaState createState() => _FiltroEmpresaState(name, checkedValue);
}

class _FiltroEmpresaState extends State<FiltroEmpresa> {
  String name;
  bool checkedValue;

  _FiltroEmpresaState(this.name, this.checkedValue);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 110,
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Checkbox(
              value: checkedValue,
              onChanged: (bool value) {
                setState(() {
                  checkedValue = value;
                });
              },
            ),
          ),
          Expanded(
            flex: 6,
            child: Text(name),
          )
        ],
      ),
    );
  }
}


/*Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Checkbox(
          value: checkedValue,
          onChanged: (bool value) {
            setState(() {
              checkedValue = value;
            });
          },
        ),
        Text("name"),
      ],
    )*/