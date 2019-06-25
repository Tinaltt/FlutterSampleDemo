import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ScrollableDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scrollable Demo"),
      ),
      body: ListView(
        children: <Widget>[
          RaisedButton(
              child: Text("SingleScrollView"),
              onPressed: () {
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) {
                  return new SingleScrollViewRoute();
                }));
              }),
          RaisedButton(
              child: Text("ListView"),
              onPressed: () {
                Navigator.push(context,
                    new MaterialPageRoute(builder: (context) {
                  return new ListViewRouter();
                }));
              }),
        ],
      ),
    );
  }
}

class SingleScrollViewRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String str = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    return Scaffold(
      appBar: AppBar(
        title: Text("SingleChildScrollView Route"),
      ),
      body: Scrollbar(
        child: SingleChildScrollView(
//            reverse: true,
            padding: EdgeInsets.all(16.0),
            physics: BouncingScrollPhysics(),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: str
                    .split("")
                    .map((c) => Text(
                          c,
                          textScaleFactor: 2.0,
                        ))
                    .toList(),
              ),
            )),
      ),
    );
  }
}

class ListViewRouter extends StatefulWidget {
  @override
  _ListViewRouterState createState() => _ListViewRouterState();
}

class _ListViewRouterState extends State<ListViewRouter> {
  static const loadingTag = "##loading##";
  var _words = <String>[loadingTag];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _retrieveData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView Demo"),
      ),
      body: Column(
        children: <Widget>[
          ListTile(
            title: Text(
              "I'm a title",
              style: TextStyle(color: Colors.redAccent),
            ),
            subtitle: Text("I'm a subtitle"),
          ),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  if (_words[index] == loadingTag) {
                    if (_words.length - 1 < 100) {
                      _retrieveData();
                      return Container(
                        padding: const EdgeInsets.all(16.0),
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: 24.0,
                          height: 24.0,
                          child: CircularProgressIndicator(
                            strokeWidth: 2.0,
                          ),
                        ),
                      );
                    } else {
                      return Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          "没有更多了",
                          style: TextStyle(color: Colors.grey),
                        ),
                      );
                    }
                  }
                  return ListTile(
                    title: Text(_words[index]),
                  );
                },
                separatorBuilder: (context, index) => Divider(
                      height: 0,
                      indent: 16.0,
                      color: Colors.grey[200],
                    ),
                itemCount: _words.length),
          ),
        ],
      ),
    );
  }

  void _retrieveData() {
    Future.delayed(Duration(seconds: 2)).then((e) {
      _words.insertAll(_words.length - 1,
          generateWordPairs().take(20).map((e) => e.asPascalCase).toList());
      setState(() {});
    });
  }
}
