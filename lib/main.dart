import 'package:br/screens/dashboard_screen.dart';
import 'package:br/screens/login_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:br/models/user_model.dart';
import 'package:scoped_model/scoped_model.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel<UserModel>(
      model: UserModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home:
            ScopedModelDescendant<UserModel>(builder: (context, child, model) {
          if (!model.isLoggedIn())
            return LoginScreen();
          else
            return DashboardScreen();
        }),
      ),
    );
  }
}
