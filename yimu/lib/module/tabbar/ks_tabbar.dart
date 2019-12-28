import 'package:flutter/material.dart';
import 'package:yimu/page/tabbar/ks_home_page.dart';
import 'package:yimu/page/tabbar/ks_my_page.dart';

class KSTabBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _KSTabBarState(); //整个函数等价于：_KSTabBarState createState() => _KSTabBarState()
  }
}

/*_下划线开头为私有，外界无法访问*/
class _KSTabBarState extends State<KSTabBar> {
  final _defaultColor = Colors.grey;
  final _activeColor = Colors.blue;
  int _currentIndex = 0;
  List<Widget> pages = List();

  final PageController _controller = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    /*初始化底部导航栏*/
    pages..add(KSHomePage())..add(KSMyPage());
  }

  @override
  Widget build(BuildContext context) {
    /*
    Scaffold
    Material Design布局结构的基本实现。此类提供了用于显示drawer、snackbar和底部sheet的API。
     */
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          _cunstomNavBarItem(Icons.home, '首页', _currentIndex == 0 ? _activeColor : _defaultColor),
          _cunstomNavBarItem(Icons.home, '我的', _currentIndex == 1 ? _activeColor : _defaultColor),
        ],
        currentIndex: _currentIndex,
        onTap: (int index){
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
      ),
    );
  }

  /*自定义tabbar按钮*/
  BottomNavigationBarItem _cunstomNavBarItem(
      IconData icon, String title, Color textColor) {
    return BottomNavigationBarItem(
        icon: Icon(
          icon,
          color: _defaultColor,
        ),
        activeIcon: Icon(
          icon,
          color: _activeColor,
        ),
        title: Text(
          title,
          style: TextStyle(color: textColor),
        ));
  }
}
