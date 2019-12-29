import 'package:flutter/material.dart';
import 'package:yimu/module/base/ks_stateful_widget.dart';
import 'package:yimu/module/category/ks_appbar_category.dart';
import 'package:yimu/module/category/ks_listtile_category.dart';

class KSNavigatorExamplePage extends KSStatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _KSNavigatorExamplePageState();
  }
}

class _KSNavigatorExamplePageState extends State<KSNavigatorExamplePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KSAppBar.ks_init(title: widget.pageTitle),
      body: ListView(
        children: <Widget>[
          KSListTile.ks_init(title: '这是简单路由首页', onTap: null),
          KSListTile.ks_init(
              title: '跳转到下一页',
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) {
                          return KSNavigatorExampleNewPage();
                          /*
              fullscreenDialog表示新的路由页面是否是一个全屏的模态对话框，在iOS中，如果fullscreenDialog为true，新页面将会从屏幕底部滑入（而不是水平方向）。
               */
                        },
                        fullscreenDialog: true));
              }),
        ],
      ),
    );
  }
}

class KSNavigatorExampleNewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: KSAppBar.ks_init(title: '简单路由的新页面'),
      body: ListView(
        children: <Widget>[
          KSListTile.ks_init(
              title: 'KSNavigatorExamplePage -> this', onTap: null),
          KSListTile.ks_init(
              title: '返回上一页',
              onTap: () {
                Navigator.pop(context);
              }),
        ],
      ),
    );
  }
}
