import 'package:br/models/user_model.dart';
import 'package:br/tabs/empresas_tab.dart';
import 'package:br/tabs/log_tab.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  bool page = true;


  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<UserModel>(builder: (context, child, model) {
      return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.grey[850],
            leading: Container(
              padding: EdgeInsets.fromLTRB(5, 5, 0, 5),
              child: Image.network(
                  'https://firebasestorage.googleapis.com/v0/b/appcatraca-75f27.appspot.com/o/user.png?alt=media&token=f5350349-726e-4a01-af20-58a6d783ef57'),
            ),
            title: Text(
              "${model.currentUser.role} \n"
              "${model.currentUser.name}",
              style: TextStyle(fontSize: 15),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.exit_to_app),
                onPressed: () {
                  model.signOut();
                  /*Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => LoginScreen()));*/
                },
              ),
            ],
          ),
          body: page ? EmpresasTab() : LogTab(),
          bottomNavigationBar: Container(
            color: Color(0xFF3399ff),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                              top: BorderSide(
                                  color: Color(page ? 0xFF2e7dcd : 0xFF2a89e7d6), width: 4
                              ))),
                      child: FlatButton(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          child: Icon(
                            Icons.compare_arrows,
                            color: Colors.white,
                            size: 35,
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            page = true;
                          });
                        },
                      ),
                    )),
                Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                              top: BorderSide(color: Color(!page ? 0xFF2e7dcd : 0xFF2a89e7d6), width: 4))),
                      child: FlatButton(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          child: Icon(
                            Icons.timer,
                            color: Colors.white,
                            size: 35,
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            page = false;
                          });
                        },
                      ),
                    )),
              ],
            ),
          )
      );
    });
  }
}
