import 'package:br/models/user_model.dart';
import 'package:br/screens/login_screen.dart';
import 'package:br/tabs/empresas_tab.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class DashboardScreen extends StatelessWidget {
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
            "${model.userData['role']} \n"
            "${model.userData['name']}",
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
        body: EmpresasTab(),
      );
    });
  }
}
