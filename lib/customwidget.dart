import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class CustomWidgetDemo extends StatelessWidget {
  onTap(){
    print("button click");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("自定义Widget"),
      ),
      body: Column(
        children: <Widget>[
          GradientButton(
//            colors: [Colors.orange,Colors.red],
            height: 50.0,
            child: Text("Submit"),
            onTap:onTap ,
          ),
          GradientButton(
            height: 50.0,
            colors: [Colors.lightGreen, Colors.green[700]],
            child: Text("Submit"),
            onTap: onTap,
          ),
          GradientButton(
            height: 50.0,
            colors: [Colors.lightBlue[300], Colors.blueAccent],
            child: Text("Submit"),
            onTap: onTap,
          ),
        ],
      ),
    );
  }
}

class GradientButton extends StatelessWidget {
  GradientButton(
      {this.colors, this.width, this.height, this.onTap, @required this.child});

  final List<Color> colors;
  final double width;
  final double height;
  final Widget child;

  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    List<Color> _colors = colors ??
        [theme.primaryColor, theme.primaryColorDark ?? theme.primaryColor];

    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: _colors),
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          splashColor: _colors.last,
          highlightColor: Colors.transparent,
          onTap: onTap,
          child: ConstrainedBox(
            constraints: BoxConstraints.tightFor(height: height, width: width),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: DefaultTextStyle(
                    style: TextStyle(fontWeight: FontWeight.bold),
                    child: child),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
