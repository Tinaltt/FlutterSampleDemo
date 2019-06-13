//------------------------- Text ----------------------------------

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WidgetDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Widget Demo"),
      ),
      body: new Column(
        children: <Widget>[
          FlatButton(
            child: Text("Text"),
            color: Colors.lightBlueAccent,
            textColor: Colors.white,
            onPressed: () {
              Navigator.push(context, new MaterialPageRoute(builder: (context) {
                return new TextWidget();
              }));
            },
          ),
          FlatButton(
            child: Text("Button"),
            color: Colors.lightBlueAccent,
            textColor: Colors.white,
            onPressed: () {
              Navigator.push(context, new MaterialPageRoute(builder: (context) {
                return new ButtonWidget();
              }));
            },
          ),
        ],
      ),
    );
  }
}

class TextWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Text Widget"),
      ),
      body: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text.rich(TextSpan(children: [
            TextSpan(text: "Tina's Github:"),
            TextSpan(
              text: "https://github.com/Tinaltt",
              style: TextStyle(color: Colors.redAccent),
            ),
          ])),
          Text(
            "Hello world",
            textAlign: TextAlign.center,
          ),
          Text(
            "Hello world! I'm Jack. " * 6,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            "Hello world " * 8, //字符串重复六次
            textAlign: TextAlign.center,
          ),
          Text(
            "Hello world",
            textScaleFactor: 1.2,
          ),
          Text(
            "Hello world",
            style: TextStyle(
                color: Colors.blue,
                fontSize: 18.0,
                height: 1.2,
                fontFamily: "Courier",
                background: new Paint()..color = Colors.yellow,
                decoration: TextDecoration.underline,
                decorationStyle: TextDecorationStyle.wavy),
          ),
          DefaultTextStyle(
            style: TextStyle(
              fontSize: 15.0,
              color: Colors.lightBlueAccent,
            ),
            textAlign: TextAlign.center,
            child: Column(
              children: <Widget>[
                Text("text 1"),
                Text("text 2"),
                Text(
                  "text 4",
                  style: TextStyle(
                    inherit: false,
                    fontSize: 20.0,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Button Widget"),
      ),
      body: new Wrap(
        verticalDirection: VerticalDirection.down,
        spacing: 10.0,
        children: <Widget>[
          RaisedButton(
            child: Text("RaisedBtn"),
            color: Colors.blue,
            textColor: Colors.white,
            onPressed: () => {},
          ),
          FlatButton(
            child: Text("FlatBtn"),
            color: Colors.red,
            textColor: Colors.white,
            onPressed: () => {},
          ),
          OutlineButton(
            child: Text("OutlineBtn"),
            color: Colors.blue,
            textColor: Colors.white,
            borderSide: BorderSide(
              width: 2.0,
              color: Colors.yellowAccent,
            ),
            onPressed: () => {},
          ),
          IconButton(
            icon: Icon(Icons.thumb_up),
            color: Colors.red,
            onPressed: () => {},
          ),
          FlatButton(
            child: Text("CustomBtn"),
            color: Colors.blue,
            highlightColor: Colors.blue[700],
            colorBrightness: Brightness.dark,
            splashColor: Colors.grey,
            textColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            onPressed: () => {},
          )
        ],
      ),
    );
  }
}

