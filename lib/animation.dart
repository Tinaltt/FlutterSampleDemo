import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AnimationDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animation Demo"),
      ),
      body: Column(
        children: <Widget>[
          RaisedButton(
            child: Text("ScaleAnimation"),
            onPressed: () {
              Navigator.push(context,
                  new CupertinoPageRoute(builder: (context) {
                return new ScaleAnimationRouter();
              }));
            },
          ),
          RaisedButton(
            child: Text("PageRouterAnimation"),
            onPressed: () {
              Navigator.push(
                  context,
                  new PageRouteBuilder(
                      transitionDuration: Duration(milliseconds: 500),
                      pageBuilder: (BuildContext context, Animation animation,
                          Animation secondaryAnimation) {
                        return new FadeTransition(
                          opacity: animation,
                          child: new ScaleAnimationRouter(),
                        );
                      }));
            },
          ),
          RaisedButton(
            child: Text("Hero Router Animation"),
            onPressed: () {
              Navigator.push(context,
                  new CupertinoPageRoute(builder: (context) {
                return new HeroAnimationRouter();
              }));
            },
          ),
          RaisedButton(
            child: Text("Stagger Animation"),
            onPressed: () {
              Navigator.push(context, new MaterialPageRoute(builder: (context) {
                return new StaggerDemo();
              }));
            },
          )
        ],
      ),
    );
  }
}

class ScaleAnimationRouter extends StatefulWidget {
  @override
  _ScaleAnimationRouterState createState() => _ScaleAnimationRouterState();
}

//需要继承TickerProvider，如果有多个AnimationController，则应该使用TickerProviderStateMixin。
class _ScaleAnimationRouterState extends State<ScaleAnimationRouter>
    with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.bounceIn);
    animation = new Tween(begin: 0.0, end: 300.0).animate(animation);
//      ..addListener(() {
//        print("animation value:${animation.value}");
//        setState(() {});
//      });
    animation.addStatusListener((status) {
      switch (status) {
        //动画在起始点停止
        case AnimationStatus.dismissed:
          print("dismissed");
          //动画恢复到初始状态时执行动画（正向）
          animationController.forward();
          break;
        //动画正在正向执行
        case AnimationStatus.forward:
          print("forward");
          break;
        //动画正在反向执行
        case AnimationStatus.reverse:
          print("reverse");
          break;
        //动画在终点停止
        case AnimationStatus.completed:
          print("completed");
          //动画执行结束时反向执行动画
          animationController.reverse();
          break;
      }
    });
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scale Animation"),
      ),
      body: Column(
        children: <Widget>[
//          Image.asset(
//            "assets/images/avatar.jpg",
//            width: animation.value,
//            height: animation.value,
//          ),
//          new AnimationImage(
//            animation: animation,
//          ),
          GrowTransition(
            child: Image.asset("assets/images/avatar.jpg"),
            animation: animation,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}

class AnimationImage extends AnimatedWidget {
  AnimationImage({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return new Center(
      child: Image.asset(
        "assets/images/avatar.jpg",
        width: animation.value,
        height: animation.value,
      ),
    );
  }
}

class GrowTransition extends StatelessWidget {
  GrowTransition({this.child, this.animation});

  final Widget child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context, Widget child) {
          return new Container(
            child: child,
            height: animation.value,
            width: animation.value,
          );
        },
        child: child,
      ),
    );
  }
}

class HeroAnimationRouter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hero Demo"),
      ),
      body: Container(
          alignment: Alignment.topCenter,
          child: InkWell(
            child: Hero(
              tag: "avatar",
              child: ClipOval(
                child: Image.asset(
                  "assets/images/avatar.jpg",
                  width: 50.0,
                ),
              ),
            ),
            onTap: () {
              Navigator.push(context, PageRouteBuilder(pageBuilder:
                  (BuildContext context, Animation animation,
                      Animation secondaryAnimation) {
                return new FadeTransition(
                  opacity: animation,
                  child: HeroAnimationRouterB(),
//                  Scaffold(
//                    appBar: AppBar(
//                      title: Text("原图"),
//                    ),
//                    body: HeroAnimationRouterB(),
//                  ),
                );
              }));
            },
          )),
    );
  }
}

class HeroAnimationRouterB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("原图"),
      ),
      body: InkWell(
        child: Center(
          child: Hero(
            tag: "avatar",
            child: Image.asset("assets/images/avatar.jpg"),
          ),
        ),
        onTap: () => Navigator.pop(context),
      ),
    );
  }
}

// ignore: must_be_immutable
class StaggerAnimation extends StatelessWidget {
  final Animation<double> controller;
  Animation<double> height;
  Animation<Color> color;
  Animation<EdgeInsets> padding;

  StaggerAnimation({Key key, this.controller}) : super(key: key) {
    height = Tween<double>(begin: 0.0, end: 300.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.0, 0.6, //间隔，前60%的动画时间
            curve: Curves.ease),
      ),
    );
    color = ColorTween(begin: Colors.green, end: Colors.red).animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.0, 0.6, //间隔，前60%的动画时间
            curve: Curves.ease),
      ),
    );
    padding = Tween<EdgeInsets>(
            begin: EdgeInsets.only(left: .0), end: EdgeInsets.only(left: 100.0))
        .animate(
      CurvedAnimation(
        parent: controller,
        curve: Interval(0.6, 1.0, //间隔，后40%的动画时间
            curve: Curves.ease),
      ),
    );
  }

  Widget _buildWidget(BuildContext context, Widget child) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: padding.value,
      child: Container(
        color: color.value,
        width: 50.0,
        height: height.value,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: _buildWidget,
    );
  }
}

class StaggerDemo extends StatefulWidget {
  @override
  _StaggerDemoState createState() => _StaggerDemoState();
}

class _StaggerDemoState extends State<StaggerDemo>
    with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
  }

  Future<Null> _animationPlay() async {
    try {
      await _controller.forward().orCancel;
      await _controller.reverse().orCancel;
    } on TickerCanceled {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stagger Demo"),
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          _animationPlay();
        },
        child: Center(
          child: Container(
            width: 300.0,
            height: 300.0,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.1),
              border: Border.all(
                color: Colors.black.withOpacity(0.5),
              ),
            ),
            child: StaggerAnimation(
              controller: _controller,
            ),
          ),
        ),
      ),
    );
  }
}
