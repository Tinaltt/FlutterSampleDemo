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
          FlatButton(
            child: Text("TextField"),
            color: Colors.lightBlueAccent,
            textColor: Colors.white,
            onPressed: () {
              Navigator.push(context, new MaterialPageRoute(builder: (context) {
                return new TextFieldWidget();
              }));
            },
          ),
          FlatButton(
            child: Text("Form"),
            color: Colors.lightBlueAccent,
            textColor: Colors.white,
            onPressed: () {
              Navigator.push(context, new MaterialPageRoute(builder: (context) {
                return new ForumWidget();
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

//------------------------- TextField ----------------------------------
class TextFieldWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new TextFieldWidgetState();
  }
}

class TextFieldWidgetState extends State<TextFieldWidget> {
  TextEditingController _textEditingController = new TextEditingController();

  FocusNode focusNode1 = new FocusNode();
  FocusNode focusNode2 = new FocusNode();
  FocusScopeNode focusScopeNode;

  @override
  void initState() {
    super.initState();
    _textEditingController.text = "I'm default text!";
    _textEditingController.selection = TextSelection(
        baseOffset: 2, extentOffset: _textEditingController.text.length);

    _textEditingController.addListener(() {
      print(_textEditingController.text);
    });
    focusNode1.addListener(() {
      print("focusNode1 focus:${focusNode1.hasFocus}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TextField Widget"),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              labelText: "用户名：",
              hintText: "用户名或邮箱",
              prefixIcon: Icon(Icons.person),
            ),
            controller: _textEditingController,
            autofocus: true,
            focusNode: focusNode1, //关联focusNode1
          ),
          TextField(
            decoration: InputDecoration(
              labelText: "密码：",
              hintText: "您的登录密码",
              prefixIcon: Icon(Icons.lock),
            ),
            obscureText: true,
            onChanged: (v) {
              print("onChange:$v");
            },
            focusNode: focusNode2, //关联focusNode2
          ),
          Builder(
            builder: (ctx) {
              return Column(
                children: <Widget>[
                  RaisedButton(
                    child: Text("移动焦点"),
                    onPressed: () {
                      //将焦点从第一个TextField移到第二个TextField
                      // 这是一种写法 FocusScope.of(context).requestFocus(focusNode2);
                      // 这是第二种写法
                      if (null == focusScopeNode) {
                        focusScopeNode = FocusScope.of(context);
                      }
                      focusScopeNode.requestFocus(focusNode2);
                    },
                  ),
                  RaisedButton(
                    child: Text("隐藏键盘"),
                    onPressed: () {
                      // 当所有编辑框都失去焦点时键盘就会收起
                      focusNode1.unfocus();
                      focusNode2.unfocus();
                    },
                  )
                ],
              );
            },
          ),
          Theme(
            data: Theme.of(context).copyWith(
                hintColor: Colors.grey[200],
                inputDecorationTheme: InputDecorationTheme(
                  labelStyle: TextStyle(color: Colors.lightBlueAccent),
                  hintStyle: TextStyle(color: Colors.grey[400], fontSize: 12.0),
                )),
            child: Column(
              children: <Widget>[
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    labelText: "Email",
                    hintText: "电子邮件地址",
                  ),
                ),
                TextField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.phone),
                    labelText: "Phone",
                    hintText: "手机号码",
                  ),
                ),
                Container(
                  child: TextField(
                      keyboardType: TextInputType.datetime,
                      decoration: InputDecoration(
                          labelText: "生日",
                          hintText: "出生日期",
                          prefixIcon: Icon(Icons.calendar_today),
                          border: InputBorder.none //隐藏下划线
                          )),
                  decoration: BoxDecoration(
                      // 下滑线浅灰色，宽度1像素
                      border: Border(
                          bottom:
                              BorderSide(color: Colors.grey[200], width: 1.0))),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//------------------------- Form ----------------------------------
class ForumWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new ForumWidgetState();
  }
}

class ForumWidgetState extends State<ForumWidget> {
  TextEditingController _userNameController = new TextEditingController();
  TextEditingController _pwdController = new TextEditingController();
  GlobalKey _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forum Widget"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  autofocus: true,
                  controller: _userNameController,
                  decoration: InputDecoration(
                    labelText: "用户名",
                    hintText: "用户名或邮箱",
                    icon: Icon(Icons.person),
                  ),
                  validator: (v) {
                    return v.trim().length > 0 ? null : "用户名不能为空";
                  },
                ),
                TextFormField(
                  controller: _pwdController,
                  decoration: InputDecoration(
                    labelText: "密码",
                    hintText: "您的登录密码",
                    icon: Icon(Icons.lock),
                  ),
                  obscureText: true,
                  validator: (v) {
                    return v.trim().length > 5 ? null : "密码不能少于6位";
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 28.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: RaisedButton(
                            padding: EdgeInsets.all(15.0),
                            child: Text("登录"),
                            color: Theme.of(context).primaryColor,
                            textColor: Colors.white,
                            onPressed: () {
                              if ((_formKey.currentState as FormState)
                                  .validate()) {
                                print("验证通过，提交数据");
                                print("用户名：${_userNameController.text}");
                                print("密码：${_pwdController.text}");
                              }
                            }),
                      ),
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
