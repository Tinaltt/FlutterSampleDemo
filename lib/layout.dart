import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Layout Demo"),
      ),
      body: new Column(
        children: <Widget>[
          FlatButton(
            child: Text("线性布局"),
            color: Colors.pinkAccent,
            textColor: Colors.white,
            onPressed: () {
              Navigator.push(context, new MaterialPageRoute(builder: (context) {
                return new LinearLayoutWidget();
              }));
            },
          ),
          FlatButton(
            child: Text("线性布局2"),
            color: Colors.blueAccent,
            textColor: Colors.white,
            onPressed: () {
              Navigator.push(context, new MaterialPageRoute(builder: (context) {
                return new LayoutWidget();
              }));
            },
          ),
          FlatButton(
            child: Text("弹性布局"),
            color: Colors.pinkAccent,
            textColor: Colors.white,
            onPressed: () {
              Navigator.push(context, new MaterialPageRoute(builder: (context) {
                return new FlexLayoutWidget();
              }));
            },
          ),
          FlatButton(
            child: Text("流式布局"),
            color: Colors.blueAccent,
            textColor: Colors.white,
            onPressed: () {
              Navigator.push(context, new MaterialPageRoute(builder: (context) {
                return new WrapLayoutWidget();
              }));
            },
          ),
          FlatButton(
            child: Text("Flow"),
            color: Colors.pinkAccent,
            textColor: Colors.white,
            onPressed: () {
              Navigator.push(context, new MaterialPageRoute(builder: (context) {
                return new TestFlowWidget();
              }));
            },
          ),
          FlatButton(
            child: Text("Stack & Positioned"),
            color: Colors.blueAccent,
            textColor: Colors.white,
            onPressed: () {
              Navigator.push(context, new MaterialPageRoute(builder: (context) {
                return new StackWidget();
              }));
            },
          ),
        ],
      ),
    );
  }
}

//------------------------- 线性布局 ----------------------------------
class LinearLayoutWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("线性布局"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("sssss"),
                Text("hhhhh"),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("sssss"),
                Text("hhhhh"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              textDirection: TextDirection.rtl,
              children: <Widget>[
                Text("sssss"),
                Text("hhhhh"),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              verticalDirection: VerticalDirection.up,
              children: <Widget>[
                Text(
                  "sssss",
                  style: TextStyle(fontSize: 30.0),
                ),
                Text("hhhhh"),
              ],
            ),
          ],
        ));
  }
}

class LayoutWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("线性布局"),
      ),
      body: Container(
        color: Colors.green,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max, //有效，外层Colum高度为整个屏幕
            children: <Widget>[
              Container(
                color: Colors.red,
                child: Column(
                  mainAxisSize: MainAxisSize.max, //无效，内层Colum高度为实际高度
                  children: <Widget>[
                    Text("hello world "),
                    Text("I am Jack "),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.pink,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center, //垂直方向居中对齐
                    children: <Widget>[
                      Text("hello world "),
                      Text("I am Jack "),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class FlexLayoutWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("弹性布局"),
      ),
      body: Column(
        children: <Widget>[
          Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  height: 30.0,
                  color: Colors.red,
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  height: 30.0,
                  color: Colors.green,
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: SizedBox(
              height: 100.0,
              child: Flex(
                direction: Axis.vertical,
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 30.0,
                      color: Colors.red,
                    ),
                  ),
                  Spacer(
                    flex: 1,
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 30.0,
                      color: Colors.green,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class WrapLayoutWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("流式布局"),
      ),
      body: Wrap(
        spacing: 8.0, // 主轴(水平)方向间距
        runSpacing: 4.0, // 纵轴（垂直）方向间距
        alignment: WrapAlignment.center, //沿主轴方向居中
        children: <Widget>[
          new Chip(
            avatar:
                new CircleAvatar(backgroundColor: Colors.red, child: Text('A')),
            label: new Text('Hamilton'),
          ),
          new Chip(
            avatar: new CircleAvatar(
                backgroundColor: Colors.blue, child: Text('M')),
            label: new Text('Lafayette'),
          ),
          new Chip(
            avatar: new CircleAvatar(
                backgroundColor: Colors.blue, child: Text('H')),
            label: new Text('Mulligan'),
          ),
          new Chip(
            avatar: new CircleAvatar(
                backgroundColor: Colors.blue, child: Text('J')),
            label: new Text('Laurens'),
          ),
          new Chip(
            avatar: new CircleAvatar(
                backgroundColor: Colors.blue, child: Text('W')),
            label: new Text('Tina'),
          ),
        ],
      ),
    );
  }
}

class TestFlowWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flow"),
      ),
      body: Flow(
        delegate: TestFlowDelegate(margin: EdgeInsets.all(10.0)),
        children: <Widget>[
          new Container(
            width: 80.0,
            height: 80.0,
            color: Colors.red,
          ),
          new Container(
            width: 80.0,
            height: 80.0,
            color: Colors.green,
          ),
          new Container(
            width: 80.0,
            height: 80.0,
            color: Colors.blue,
          ),
          new Container(
            width: 80.0,
            height: 80.0,
            color: Colors.yellow,
          ),
          new Container(
            width: 80.0,
            height: 80.0,
            color: Colors.brown,
          ),
          new Container(
            width: 80.0,
            height: 80.0,
            color: Colors.purple,
          ),
        ],
      ),
    );
  }
}

class TestFlowDelegate extends FlowDelegate {
  EdgeInsets margin = EdgeInsets.zero;

  TestFlowDelegate({this.margin});

  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;
    //计算每一个子widget的位置
    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i).width + x + margin.right;
      if (w < context.size.width) {
        context.paintChild(i,
            transform: new Matrix4.translationValues(x, y, 0.0));
        x = w + margin.left;
      } else {
        x = margin.left;
        y += context.getChildSize(i).height + margin.top + margin.bottom;
        //绘制子widget(有优化)
        context.paintChild(i,
            transform: new Matrix4.translationValues(x, y, 0.0));
        x += context.getChildSize(i).width + margin.left + margin.right;
      }
    }
  }

  @override
  getSize(BoxConstraints constraints) {
    //指定Flow的大小
    return Size(double.infinity, 200.0);
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}

class StackWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Stack & Positioned"),
      ),
      body: ConstrainedBox(
        constraints: BoxConstraints.expand(),
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: <Widget>[
            Container(child: Text("Hello world",style: TextStyle(color: Colors.white)),
              color: Colors.red,
            ),
            Positioned(
              left: 18.0,
              child: Text("I am Jack"),
            ),
            Positioned(
              top: 18.0,
              child: Text("Your friend"),
            )
          ],
        ),
      ),
    );
  }
}
