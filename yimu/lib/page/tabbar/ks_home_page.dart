import 'package:flutter/material.dart';
import 'package:yimu/module/base/ks_stateful_widget.dart';
import 'package:yimu/module/category/ks_appbar_category.dart';
import 'package:yimu/module/category/ks_listtile_category.dart';
import 'package:yimu/module/category/ks_navigator_category.dart';
import 'package:yimu/page/home/three/ks_state_lifecycle_page_3.1.6.dart';
import 'package:yimu/page/home/two/ks_assets_manager_page_2.4.dart';
import 'package:yimu/page/home/two/ks_counter_application_page_2.1.dart';
import 'package:yimu/page/home/two/ks_named_route_page_2.2.5.dart';
import 'package:yimu/page/home/two/ks_navigator_example_page_2.2.1.dart';
import 'package:yimu/page/home/two/ks_packages_manager_page_2.3.dart';
import 'package:yimu/page/home/two/ks_route_hook_page_2.2.6.dart';
import 'package:yimu/page/home/two/ks_route_pass_page_2.2.4.dart';

class KSHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _KSHomePageState();
  }
}

class _KSHomePageState extends State<KSHomePage> {
  /*列表数据*/
  List<ListTile> _datas;

  @override
  void initState() {
    super.initState();
    _initChildPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KSAppBar.ks_init(title: '主页'),
      body: ListView.builder(
          itemCount: _datas.length,
          itemBuilder: (BuildContext context, int index) {
            return _datas[index];
          }),
    );
  }

  _initChildPage() {
    var listTiles = [
      KSListTile.ks_init(
          title: '2.1 计数器应用示例', onTap: _enterKSCounterPpplicationPage),
      KSListTile.ks_init(
          title: '2.2.1 一个简单示例', onTap: _enterKSNavigatorExamplePage),
      KSListTile.ks_init(title: '2.2.4 路由传值', onTap: _enterKSRoutePassPage),
      KSListTile.ks_init(title: '2.2.5 命名路由', onTap: _enterKSNamedRoutePage),
      KSListTile.ks_init(title: '2.2.6 路由生成钩子', onTap: _enterKSRouteHookPage),
      KSListTile.ks_init(title: '2.3 包管理', onTap: _enterKSPackagesManagerPage),
      KSListTile.ks_init(title: '2.4 资源管理', onTap: _enterKSAsssetsManagerPage),
      KSListTile.ks_init(title: '3.1.6 State生命周期', onTap: _enterKSStateLifeCyclePage),
    ];

    _datas = [];
    /*倒序*/
    for (int i = (listTiles.length - 1); i >= 0; i--) {
      _datas.add(listTiles[i]);
    }
  }


  /*利用多态实现标题赋值*/
  _push(KSStatefulWidget page, String title) {
    page.pageTitle = title;
    KSNavigator.ks_push(context, page);
  }

  _enterKSStateLifeCyclePage(){
    _push(KSStateLifeCyclePage(initValue: 0), '3.1.6 State生命周期');
  }
  _enterKSAsssetsManagerPage(){
    _push(KSAsssetsManagerPage(), '2.4 资源管理');
  }
  _enterKSPackagesManagerPage(){
    _push(KSPackagesManagerPage(), '2.3 包管理');
  }
  _enterKSRouteHookPage() {
    _push(KSRouteHookPage(), '2.2.6 路由生成钩子');
  }

  _enterKSNamedRoutePage() {
    _push(KSNamedRoutePage(), '2.2.5 命名路由');
  }

  _enterKSRoutePassPage() {
    _push(KSRoutePassPage(), '2.2.4 路由传值');
  }

  _enterKSNavigatorExamplePage() {
    _push(KSNavigatorExamplePage(), '2.2.1 一个简单示例');
  }

  _enterKSCounterPpplicationPage() {
    _push(KSCounterPpplicationPage(), '2.1 计数器应用示例');
  }
}
