import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class VesselDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vessel Demo"),
      ),
      body: new Column(
        children: <Widget>[
          FlatButton(
            child: Text("Padding"),
            color: Colors.pinkAccent,
            textColor: Colors.white,
            onPressed: () {
              Navigator.push(context, new MaterialPageRoute(builder: (context) {
                return ;
              }));
            },
          ),
        ],
      ),
    );
  }
}

class PaddingVessel extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
}