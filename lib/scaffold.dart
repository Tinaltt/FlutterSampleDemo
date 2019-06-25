import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ScaffoldDemo extends StatefulWidget {
  @override
  _ScaffoldDemoState createState() => _ScaffoldDemoState();
}

class _ScaffoldDemoState extends State<ScaffoldDemo>
    with SingleTickerProviderStateMixin {
  int _selectIndex = 1;

  TabController _tabController;
  List tabs = ["新闻", "历史", "图片"];

  void _onBottomTap(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  void _onAdd() {}

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(length: tabs.length, vsync: this);

    _tabController.addListener(() {
      switch (_tabController.index) {
        case 1:
          break;
        case 2:
          break;
        case 3:
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text("Scaffold Demo"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {},
          )
        ],
//        leading: Builder(builder: (context) {
//          return IconButton(
//            icon: Icon(Icons.settings, color: Colors.white), //自定义图标
//            onPressed: () {
//              // 打开抽屉菜单
//              Scaffold.of(context).openDrawer();
//            },
//          );
//        }),
        bottom: TabBar(
            controller: _tabController,
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            tabs: tabs
                .map((e) => Tab(
                      text: e,
                    ))
                .toList()),
      ),
      drawer: new MyDrawer(),
      endDrawer: new MyDrawer(),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              onPressed: null,
            ),
            SizedBox(),
            IconButton(icon: Icon(Icons.business), onPressed: null)
          ],
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//      bottomNavigationBar: BottomNavigationBar(
//        items: <BottomNavigationBarItem>[
//          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text("Home")),
//          BottomNavigationBarItem(
//              icon: Icon(Icons.star_border), title: Text("Star")),
//          BottomNavigationBarItem(
//              icon: Icon(Icons.settings), title: Text("Setting")),
//        ],
//        currentIndex: _selectIndex,
//        fixedColor: Colors.blueAccent,
//        backgroundColor: Colors.grey[200],
//        unselectedItemColor: Colors.black87,
//        onTap: _onBottomTap,
//      ),
      floatingActionButton: FloatingActionButton(
          //悬浮按钮
          child: Icon(Icons.add),
          backgroundColor: Colors.blueAccent,
          onPressed: _onAdd),
      body: TabBarView(
        controller: _tabController,
        children: tabs.map((e) {
          return Container(
            alignment: Alignment.center,
            child: Text(
              e,
              textScaleFactor: 5,
            ),
          );
        }).toList(),
      ),
    );
  }
}

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
//        removeLeft: true,
        removeBottom: true,
        removeRight: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ClipOval(
                      child: Image.asset(
                        "assets/images/avatar.jpg",
                        width: 80,
                      ),
                    ),
                  ),
                  Text(
                    "xxxx",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Expanded(
                child: ListView(
              physics: BouncingScrollPhysics(),
              children: <Widget>[
                ListTile(
                  leading: const Icon(Icons.add),
                  title: const Text("add account"),
                ),
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text("Manage accounts"),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
