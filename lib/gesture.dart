import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GestureDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vessel Demo"),
      ),
      body: new Column(
        children: <Widget>[
          FlatButton(
            child: Text("Tap"),
            color: Colors.pinkAccent,
            textColor: Colors.white,
            onPressed: () {
              Navigator.push(context, new MaterialPageRoute(builder: (context) {
                return new TapTest();
              }));
            },
          ),
          FlatButton(
            child: Text("Drag"),
            color: Colors.blueAccent,
            textColor: Colors.white,
            onPressed: () {
              Navigator.push(context, new MaterialPageRoute(builder: (context) {
                return new DragTest();
              }));
            },
          ),
          FlatButton(
            child: Text("Scale"),
            color: Colors.pinkAccent,
            textColor: Colors.white,
            onPressed: () {
              Navigator.push(context, new MaterialPageRoute(builder: (context) {
                return new ScaleTest();
              }));
            },
          ),
          FlatButton(
            child: Text("Drag Vertical"),
            color: Colors.blueAccent,
            textColor: Colors.white,
            onPressed: () {
              Navigator.push(context, new MaterialPageRoute(builder: (context) {
                return new DragVertical();
              }));
            },
          ),
          FlatButton(
            child: Text("GestureRecognizer"),
            color: Colors.pinkAccent,
            textColor: Colors.white,
            onPressed: () {
              Navigator.push(context, new MaterialPageRoute(builder: (context) {
                return new GestureRecognizerTest();
              }));
            },
          ),
          FlatButton(
            child: Text("手势竞争"),
            color: Colors.blueAccent,
            textColor: Colors.white,
            onPressed: () {
              Navigator.push(context, new MaterialPageRoute(builder: (context) {
                return new BothDirectionTestRoute();
              }));
            },
          ),
          FlatButton(
            child: Text("手势冲突"),
            color: Colors.pinkAccent,
            textColor: Colors.white,
            onPressed: () {
              Navigator.push(context, new MaterialPageRoute(builder: (context) {
                return new GestureConflictTestRouteState();
              }));
            },
          ),
        ],
      ),
    );
  }
}

class TapTest extends StatefulWidget {
  @override
  _TapTestState createState() => _TapTestState();
}

class _TapTestState extends State<TapTest> {
  String _operation = "No Gesture detected!";

  void updateOperation(String op) {
    setState(() {
      _operation = op;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("手势检测（点击、双击、长按）"),
      ),
      body: Center(
        child: GestureDetector(
          child: Container(
            alignment: Alignment.center,
            color: Colors.red,
            width: 200.0,
            height: 200.0,
            child: Text(
              _operation,
              style: TextStyle(color: Colors.white),
            ),
          ),
          onTap: () => updateOperation("Tap"),
          onDoubleTap: () => updateOperation("DoubleTap"),
          onLongPress: () => updateOperation("LongPress"),
        ),
      ),
    );
  }
}

class DragTest extends StatefulWidget {
  @override
  _DragTestState createState() => _DragTestState();
}

class _DragTestState extends State<DragTest> {
  double _top = 0.0; //距顶部的偏移
  double _left = 0.0; //距左边的偏移

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("拖动（任意方向）"),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: _top,
            left: _left,
            child: GestureDetector(
              child: CircleAvatar(
                child: Text("T"),
              ),
              //手指按下时会触发此回调
              onPanDown: (DragDownDetails details) {
                //打印手指按下的位置(相对于屏幕)
                print("用户手指按下：${details.globalPosition}");
              },
              //手指滑动时会触发此回调
              onPanUpdate: (DragUpdateDetails details) {
                //用户手指滑动时，更新偏移，重新构建
                setState(() {
                  _left += details.delta.dx;
                  _top += details.delta.dy;
                });
              },
              onPanEnd: (DragEndDetails details) {
                //打印滑动结束时在x、y轴上的速度
                print(details.velocity);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ScaleTest extends StatefulWidget {
  @override
  _ScaleTestState createState() => _ScaleTestState();
}

class _ScaleTestState extends State<ScaleTest> {
  double _width = 200.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("缩放"),
      ),
      body: Center(
        child: GestureDetector(
          //指定宽度，高度自适应
          child: Image.asset(
            "./assets/images/avatar.jpg",
            width: _width,
          ),
          onDoubleTap: () {
            setState(() {
              _width = 200.0;
            });
          },
          onScaleUpdate: (ScaleUpdateDetails e) {
            setState(() {
              //缩放倍数在0.8到10倍之间
              _width = 200 * e.scale.clamp(.8, 10.0);
            });
          },
        ),
      ),
    );
  }
}

class DragVertical extends StatefulWidget {
  @override
  _DragVerticalState createState() => _DragVerticalState();
}

class _DragVerticalState extends State<DragVertical> {
  double _top = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("单一方向拖动"),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: _top,
            left: 200.0,
            child: GestureDetector(
              child: CircleAvatar(
                child: Text("T"),
              ),
              onVerticalDragUpdate: (DragUpdateDetails e) {
                setState(() {
                  _top += e.delta.dy;
                });
              },
            ),
          )
        ],
      ),
    );
  }
}

class GestureRecognizerTest extends StatefulWidget {
  @override
  _GestureRecognizerTestState createState() => _GestureRecognizerTestState();
}

class _GestureRecognizerTestState extends State<GestureRecognizerTest> {
  bool _toggle = false;
  TapGestureRecognizer _tapGestureRecognizer = new TapGestureRecognizer();

  @override
  void dispose() {
    //用到GestureRecognizer的话一定要调用其dispose方法释放资源
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("点击文本变色"),
      ),
      body: Center(
        child: Text.rich(
          TextSpan(children: [
            TextSpan(text: "学习Flutter"),
            TextSpan(
              text: "点我变色",
              style: TextStyle(
                fontSize: 30.0,
                color: _toggle ? Colors.blue : Colors.red,
              ),
              recognizer: _tapGestureRecognizer
                ..onTap = () {
                  setState(() {
                    _toggle = !_toggle;
                  });
                },
            ),
            TextSpan(text: "Flutter赛高！")
          ]),
        ),
      ),
    );
  }
}

class BothDirectionTestRoute extends StatefulWidget {
  @override
  _BothDirectionTestRouteState createState() => _BothDirectionTestRouteState();
}

class _BothDirectionTestRouteState extends State<BothDirectionTestRoute> {
  double _top = 200.0;
  double _left = 200.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("手势竞争"),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            top: _top,
            left: _left,
            child: GestureDetector(
              child: CircleAvatar(
                child: Text("T"),
              ),
              onVerticalDragUpdate: (DragUpdateDetails e) {
                setState(() {
                  _top += e.delta.dy;
                });
              },
              onHorizontalDragUpdate: (DragUpdateDetails e) {
                setState(() {
                  _left += e.delta.dx;
                });
              },
            ),
          )
        ],
      ),
    );
  }
}

class GestureConflictTestRouteState extends StatefulWidget {
  @override
  _GestureConflictTestRouteStateState createState() =>
      _GestureConflictTestRouteStateState();
}

class _GestureConflictTestRouteStateState
    extends State<GestureConflictTestRouteState> {
  double _left = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("手势竞争"),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            left: _left,
            child: GestureDetector(
              child: CircleAvatar(
                child: Text("T"),
              ),
              onHorizontalDragUpdate: (DragUpdateDetails details) {
                setState(() {
                  _left += details.delta.dx;
                });
              },
              onHorizontalDragEnd: (details) {
                print("onHorizontalDragEnd");
              },
              onTapDown: (details) {
                print("down");
              },
              onTapUp: (details) {
                print("up");
              },
            ),
          ),
          Positioned(
            top: 80.0,
            left: _left,
            child: Listener(
              onPointerDown: (d) {
                print("down");
              },
              onPointerUp: (d) {
                print("up");
              },
              child: GestureDetector(
                child: CircleAvatar(
                  child: Text("L"),
                ),
                onHorizontalDragUpdate: (DragUpdateDetails e) {
                  setState(() {
                    _left += e.delta.dx;
                  });
                },
                onHorizontalDragEnd: (details) {
                  print("onHorizontalDragEnd");
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
