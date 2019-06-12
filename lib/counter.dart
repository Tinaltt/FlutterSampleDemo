import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CounterWidget extends StatefulWidget {
  const CounterWidget({
    Key key,
    this.initValue: 0
  });

  final int initValue;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new CounterState();
  }
}

class CounterState extends State<CounterWidget> {
  int _counter;

  @override
  void initState() {
    // 当Widget第一次插入到Widget树时会被调用，
    // 对于每一个State对象，Flutter framework只会调用一次该回调，
    // 所以，通常在该回调中做一些一次性的操作，如状态初始化、订阅子树的事件通知等
    super.initState();
    _counter = widget.initValue;
    print("initState");
  }

  @override
  Widget build(BuildContext context) {
    // 主要是用于构建Widget子树的，会在如下场景被调用：
    //
    //1.在调用initState()之后。
    //2.在调用didUpdateWidget()之后。
    //3.在调用setState()之后。
    //4.在调用didChangeDependencies()之后。
    //5.在State对象从树中一个位置移除后（会调用deactivate）又重新插入到树的其它位置之后。
    print("build");
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter Widget"),
      ),
      body: Center(
        child: FlatButton(
            onPressed: () => setState(() => ++_counter),
            child: Text('$_counter')),
      ),
    );
  }

  @override
  void didUpdateWidget(CounterWidget oldWidget) {
    // 在widget重新构建时，
    // Flutter framework会调用Widget.canUpdate来检测Widget树中同一位置的新旧节点，
    // 然后决定是否需要更新，如果Widget.canUpdate返回true则会调用此回调。
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
  }

  @override
  void deactivate() {
    // 当State对象从树中被移除时，会调用此回调。
    super.deactivate();
    print("deactivate");
  }

  @override
  void dispose() {
    // 当State对象从树中被永久移除时调用；通常在此回调中释放资源。
    super.dispose();
    print("dispose");
  }

  @override
  void reassemble() {
    //此回调是专门为了开发调试而提供的，在热重载(hot reload)时会被调用，此回调在Release模式下永远不会被调用。
    super.reassemble();
    print("reassemble");
  }

  @override
  void didChangeDependencies() {
    // 当State对象的依赖发生变化时会被调用
    super.didChangeDependencies();
    print("didChangeDependencies");
  }


}

