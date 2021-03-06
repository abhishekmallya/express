import 'package:Express/screens/draw.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screen_scaler/flutter_screen_scaler.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import '../services/authentication.dart';

class PatientHome extends StatefulWidget {
  PatientHome({this.signOut,this.auth,this.logoutCallback});
  
  final Function signOut;
  final BaseAuth auth;
  final VoidCallback logoutCallback;

  @override
  _PatientHomeState createState() => _PatientHomeState();
}

class _PatientHomeState extends State<PatientHome> {
  FirebaseUser user;
  String userEmail;

  _loadUser() async {
    user = await FirebaseAuth.instance.currentUser();
    userEmail = user.email;
  }

  @override
  void initState() {
    _loadUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenScaler scaler = new ScreenScaler();

    Future<Null> _refresh() async {
      setState(() {});
      return null;
    }

    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: SingleChildScrollView(
          child: SafeArea(
            child: Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  RaisedButton(
                    child: Text('Sign Out'),
                    onPressed: (){
                      widget.signOut();
                    },
                  ),
                  RaisedButton(
                    child: Text('Draw'),
                    onPressed: (){
                      Navigator.push(context, CupertinoPageRoute(builder: (context) => Draw()));
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}