import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NotificationDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notification Demo"),
      ),
      body: Column(
        children: <Widget>[
          RaisedButton(
            child: Text("Notification Listener"),
            color: Colors.lightBlueAccent,
            textColor: Colors.white,
            onPressed: () {
              Navigator.push(context, new MaterialPageRoute(builder: (context) {
                return new NotificationListenerDemo();
              }));
            },
          ),
          RaisedButton(
            child: Text("My Notification"),
            color: Colors.lightBlueAccent,
            textColor: Colors.white,
            onPressed: () {
              Navigator.push(context, new MaterialPageRoute(builder: (context) {
                return new MyNotificationDemo();
              }));
            },
          ),
        ],
      ),
    );
  }
}

class NotificationListenerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NotificationListener"),
      ),
      body: NotificationListener(
        onNotification: (notification) {
          switch (notification.runtimeType) {
            case ScrollStartNotification:
              print("开始滚动");
              break;
            case ScrollUpdateNotification:
              print("正在滚动");
              break;
            case ScrollEndNotification:
              print("滚动停止");
              break;
            case OverscrollNotification:
              print("滚动到边界");
              break;
          }
          return false;
        },
        child: ListView.builder(
            itemCount: 100,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text("item$index"),
              );
            }),
      ),
    );
  }
}

class MyNotification extends Notification {
  MyNotification(this.msg);

  final String msg;
}

class MyNotificationDemo extends StatefulWidget {
  @override
  _MyNotificationDemoState createState() => _MyNotificationDemoState();
}

class _MyNotificationDemoState extends State<MyNotificationDemo> {
  String _msg = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Notification"),
      ),
      body: NotificationListener<MyNotification>(
        onNotification: (notification) {
          setState(() {
            _msg += notification.msg + "   ";
          });
          return false;
        },
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Builder(
                builder: (context) {
                  return RaisedButton(
                    onPressed: () => MyNotification("Hi").dispatch(context),
                    child: Text("Send Notification"),
                  );
                },
              ),
              Text(_msg),
            ],
          ),
        ),
      ),
    );
  }
}
