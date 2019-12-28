import 'package:flutter/material.dart';
import 'package:yimu/module/base/ks_stateful_widget.dart';
import 'package:yimu/module/category/ks_appbar_category.dart';
import 'package:yimu/module/category/ks_listtile_category.dart';
import 'package:yimu/module/category/ks_navigator_category.dart';
import 'package:yimu/page/home/two/ks_counter_application_page_2.1.dart';

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
          itemExtent: 40,
          itemBuilder: (BuildContext context, int index) {
            return _datas[index];
          }),
    );
  }

  _initChildPage(){
    var listTiles = [
        KSListTile.ks_init(title: '2.1 计数器应用示例',onTap: _enterKSCounterPpplicationPage),
    ];

    _datas = [];
    /*倒序*/
    for (int i = (listTiles.length - 1); i >= 0; i--) {
      _datas.add(listTiles[i]);
    }
  }

  /*利用多态实现标题赋值*/
  _push(KSStatefulWidget page,String title){
    page.pageTitle = title;
    KSNavigator.ks_push(context, page);
  }

  _enterKSCounterPpplicationPage(){
    _push(KSCounterPpplicationPage(), '2.1 计数器应用示例');
  }

}
