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
          FlatButton(
            child: Text("Image"),
            color: Colors.lightBlueAccent,
            textColor: Colors.white,
            onPressed: () {
              Navigator.push(context, new MaterialPageRoute(builder: (context) {
                return new ImageWidget();
              }));
            },
          ),
          FlatButton(
            child: Text("Icon"),
            color: Colors.lightBlueAccent,
            textColor: Colors.white,
            onPressed: () {
              Navigator.push(context, new MaterialPageRoute(builder: (context) {
                return new IconWidget();
              }));
            },
          ),
          FlatButton(
            child: Text("CheckBox & Switch"),
            color: Colors.lightBlueAccent,
            textColor: Colors.white,
            onPressed: () {
              Navigator.push(context, new MaterialPageRoute(builder: (context) {
                return new SwitchAndCheckBoxWidget();
              }));
            },
          ),
        ],
      ),
    );
  }
}

//------------------------- Text ----------------------------------
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

//------------------------- Button ----------------------------------
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

//------------------------- Image ----------------------------------
class ImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Widget"),
      ),
      body: new Wrap(
        spacing: 10.0,
        runSpacing: 10.0,
        children: <Widget>[
          Image(
            image: AssetImage("assets/images/avatar.jpg"),
            width: 100.0,
          ),
          Image.asset(
            "assets/images/avatar-webp.webp",
            width: 100.0,
          ),
          Image(
            image: NetworkImage(
                "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4"),
            width: 100.0,
          ),
          Image.network(
            "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4",
            width: 100.0,
          ),
          Image(
            image: AssetImage("assets/images/avatar.jpg"),
            width: 100.0,
            color: Colors.blue,
            colorBlendMode: BlendMode.difference,
          ),
          Image(
            image: AssetImage("assets/images/avatar.jpg"),
            width: 100.0,
            fit: BoxFit
                .contain, //这是图片的默认适应规则，图片会在保证图片本身长宽比不变的情况下缩放以适应当前显示空间，图片不会变形。
          ),
          Image(
            image: AssetImage("assets/images/avatar.jpg"),
            width: 100.0,
            fit: BoxFit.cover, //会按图片的长宽比放大后居中填满显示空间，图片不会变形，超出显示空间部分会被剪裁。
          ),
          Image(
            image: AssetImage("assets/images/avatar.jpg"),
            width: 100.0,
            fit: BoxFit.fill, //会拉伸填充满显示空间，图片本身长宽比会发生变化，图片会变形。
          ),
          Image(
            image: AssetImage("assets/images/avatar.jpg"),
            width: 100.0,
            fit: BoxFit
                .fitHeight, //图片的高度会缩放到显示空间的高度，宽度会按比例缩放，然后居中显示，图片不会变形，超出显示空间部分会被剪裁。
          ),
          Image(
            image: AssetImage("assets/images/avatar.jpg"),
            width: 100.0,
            fit: BoxFit
                .fitWidth, //图片的宽度会缩放到显示空间的宽度，高度会按比例缩放，然后居中显示，图片不会变形，超出显示空间部分会被剪裁。
          ),
          Image(
            image: AssetImage("assets/images/avatar.jpg"),
            width: 100.0,
            fit: BoxFit.none, //图片没有适应策略，会在显示空间内显示图片，如果图片比显示空间大，则显示空间只会显示图片中间部分。
          ),
          Image(
            image: AssetImage("assets/images/avatar.jpg"),
            width: 100.0,
            fit: BoxFit.scaleDown,
          ),
          Image(
            image: AssetImage("assets/images/avatar.jpg"),
            width: 100.0,
            height: 200.0,
            repeat: ImageRepeat.repeatY,
          ),
        ],
      ),
    );
  }
}

//------------------------- Icon ----------------------------------
class IconWidget extends StatelessWidget {
  String icons = "\uE914" + " \uE000" + " \uE90D";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Icon Widget"),
      ),
      body: new Wrap(
        spacing: 10.0,
        runSpacing: 10.0,
        children: <Widget>[
          Text(
            icons,
            style: TextStyle(
              fontFamily: "MaterialIcons",
              fontSize: 32.0,
              color: Colors.blue,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.accessible,
                color: Colors.green,
                size: 32.0,
              ),
              Icon(
                Icons.error,
                color: Colors.green,
                size: 32.0,
              ),
              Icon(
                Icons.fingerprint,
                color: Colors.green,
                size: 32.0,
              ),
            ],
          )
        ],
      ),
    );
  }
}

//------------------------- Checkbox ----------------------------------
class SwitchAndCheckBoxWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _SwitchAndCheckBoxState();
  }
}

class _SwitchAndCheckBoxState extends State<SwitchAndCheckBoxWidget> {
  bool _switchSelected = true; //维护单选开关状态
  bool _checkboxSelected = true; //维护复选框状态

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Switch & Checkbox"),
      ),
      body: new Column(
        children: <Widget>[
          Switch(
            value: _switchSelected,
            onChanged: (value) {
              setState(() {
                _switchSelected = value;
              });
            },
          ),
          Checkbox(
            value: _checkboxSelected,
            activeColor: Colors.lightBlueAccent,
            onChanged: (value) {
              setState(() {
                _checkboxSelected = value;
              });
            },
          )
        ],
      ),
    );
  }
}
