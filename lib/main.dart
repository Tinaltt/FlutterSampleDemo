import 'dart:io';

import 'package:flutter/material.dart';

import 'package:english_words/english_words.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo_app/counter.dart';
import 'package:flutter_demo_app/scaffold.dart';
import 'package:flutter_demo_app/scrollable.dart';
import 'package:flutter_demo_app/statemanager.dart';
import 'package:flutter_demo_app/vessel.dart';
import 'package:flutter_demo_app/widget.dart';

import 'layout.dart';

void main() {
  runApp(MyApp());
  if (Platform.isAndroid) {
    //设置Android头部的导航栏透明
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.pink,
      ),
      routes: {
        "new_page": (context) => NewRoute(),
      },
      //注册路由表
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: ListView(
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          children: <Widget>[
            Center(
              child: Text(
                'You have pushed the button this many times:',
              ),
            ),
            Center(
              child: Text(
                '$_counter',
                style: Theme.of(context).textTheme.display1,
              ),
            ),
            Center(
              child: RandomWordsWidget(),
            ),
            FlatButton(
              child: Text("打开路由"),
              color: Colors.redAccent,
              textColor: Colors.white,
              onPressed: () {
//                Navigator.pushNamed(context, "new_page");
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) {
                  return new EchoRoute("传递的参数呀～");
                }));
              },
            ),
            FlatButton(
              child: Text("计数页面"),
              color: Colors.lightBlueAccent,
              textColor: Colors.white,
              onPressed: () {
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) {
                  return new CounterWidget();
                }));
              },
            ),
            FlatButton(
              child: Text("TapboxA"),
              color: Colors.redAccent,
              textColor: Colors.white,
              onPressed: () {
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) {
                  return new TapboxA();
                }));
              },
            ),
            FlatButton(
              child: Text("TapboxB"),
              color: Colors.lightBlueAccent,
              textColor: Colors.white,
              onPressed: () {
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) {
                  return new ParentWidget();
                }));
              },
            ),
            FlatButton(
              child: Text("TapboxC"),
              color: Colors.redAccent,
              textColor: Colors.white,
              onPressed: () {
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) {
                  return new ParentWidgetC();
                }));
              },
            ),
            FlatButton(
              child: Text("Widget"),
              color: Colors.lightBlueAccent,
              textColor: Colors.white,
              onPressed: () {
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) {
                  return new WidgetDemo();
                }));
              },
            ),
            FlatButton(
              child: Text("Layout"),
              color: Colors.redAccent,
              textColor: Colors.white,
              onPressed: () {
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) {
                  return new LayoutDemo();
                }));
              },
            ),
            FlatButton(
              child: Text("Vessel"),
              color: Colors.lightBlueAccent,
              textColor: Colors.white,
              onPressed: () {
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) {
                  return new VesselDemo();
                }));
              },
            ),
            FlatButton(
              child: Text("Scaffold"),
              color: Colors.redAccent,
              textColor: Colors.white,
              onPressed: () {
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) {
                  return new ScaffoldDemo();
                }));
              },
            ),
            FlatButton(
              child: Text("Scrollable"),
              color: Colors.lightBlueAccent,
              textColor: Colors.white,
              onPressed: () {
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) {
                  return new ScrollableDemo();
                }));
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class NewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("路由"),
      ),
      body: Center(
        child: Text("这是个路由"),
      ),
    );
  }
}

class EchoRoute extends StatelessWidget {
  EchoRoute(this.tip);

  final String tip;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Echo Route"),
      ),
      body: Center(
        child: Text(tip),
      ),
    );
  }
}

class RandomWordsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final wordPair = new WordPair.random();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Text(wordPair.toString()),
    );
  }
}
