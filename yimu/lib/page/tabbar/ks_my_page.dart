import 'package:flutter/material.dart';
import 'package:yimu/module/category/ks_appbar_category.dart';

class KSMyPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _KSMyPageState();
  }
}

class _KSMyPageState extends State<KSMyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KSAppBar.ks_init(title: '我的'),
      body: Center(
        child: Text('开发中……'),
      ),
    );
  }
}
