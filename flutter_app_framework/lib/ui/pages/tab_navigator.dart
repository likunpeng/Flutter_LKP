import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterappframework/generated/l10n.dart';
import 'package:flutterappframework/manager/resource_mananger.dart';
import 'package:flutterappframework/ui/pages/goods_page.dart';
import 'package:flutterappframework/ui/pages/mine_page.dart';
import 'category_page.dart';
import 'home_page.dart';

List<Widget> pages = <Widget>[
  HomePage(),
  CategoryPage(),
  GoodsPage(),
  MinePage()
];

class TabNavigator extends StatefulWidget {
  TabNavigator({Key key}) : super(key: key);

  @override
  _TabNavigatorState createState() => _TabNavigatorState();
}

class _TabNavigatorState extends State<TabNavigator> {
  var _pageController = PageController();
  int _selectedIndex = 0;
  var tabImages;
  DateTime _lastPressed;
  var appBarTitles;

  /*
   * 根据选择获得对应的normal或是press的icon
   */
  Image getTabIcon(int curIndex) {
    if (curIndex == _selectedIndex) {
      return tabImages[curIndex][1];
    }
    return tabImages[curIndex][0];
  }

  Image getTabImage(path) {
    return Image.asset(ImageHelper.wrapAssets(path), width: 25.0, height: 25.0);
//    return new Image.asset(path, width: 25.0, height: 25.0);
  }

  /*
   * 获取bottomTab的颜色和文字
   */
  Text getTabTitle(int curIndex) {
    if (curIndex == _selectedIndex) {
      return new Text(appBarTitles[curIndex],
          style: new TextStyle(fontSize: 13.0, color: Colors.black));
    } else {
      return new Text(appBarTitles[curIndex],
          style: new TextStyle(fontSize: 13.0, color: Colors.black));
    }
  }

  void initData() {
    tabImages = [
      [
        getTabImage('tab/ico-tab-shouye.png'),
        getTabImage('tab/ico-tab-shouye-xz.png')
      ],
      [
        getTabImage('tab/ico-tab-pinlei.png'),
        getTabImage('tab/ico-tab-pinlei-xz.png')
      ],
      [
        getTabImage('tab/ico-tab-gouwuche.png'),
        getTabImage('tab/ico-tab-gouwuche-xz.png')
      ],
      [
        getTabImage('tab/ico-tab-wode.png'),
        getTabImage('tab/ico-tab-wode-xz.png')
      ]
    ];
  }

  @override
  Widget build(BuildContext context) {
    appBarTitles = [S.of(context).tabHome, S.of(context).tabCategory, S.of(context).tabGoods, S.of(context).tabMine];
    initData();
    final List<BottomNavigationBarItem> bottomTabs = [
      BottomNavigationBarItem(icon: getTabIcon(0), title: getTabTitle(0)),
      BottomNavigationBarItem(icon: getTabIcon(1), title: getTabTitle(1)),
      BottomNavigationBarItem(icon: getTabIcon(2), title: getTabTitle(2)),
      BottomNavigationBarItem(icon: getTabIcon(3), title: getTabTitle(3))
    ];
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          if (_lastPressed == null ||
              DateTime.now().difference(_lastPressed) > Duration(seconds: 1)) {
            //两次点击间隔超过1秒则重新计时
            _lastPressed = DateTime.now();
            return false;
          }
          return true;
        },
        child: PageView.builder(
          itemBuilder: (ctx, index) => pages[index],
          itemCount: pages.length,
          controller: _pageController,
          physics: NeverScrollableScrollPhysics(),
          onPageChanged: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: bottomTabs,
        currentIndex: _selectedIndex,
        onTap: (index) {
          _pageController.jumpToPage(index);
        },
      ),
    );
  }

  @override
  void initState() {
//    checkAppUpdate(context);
    super.initState();
  }
}
