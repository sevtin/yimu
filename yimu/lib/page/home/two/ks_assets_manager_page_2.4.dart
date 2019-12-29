import 'package:flutter/material.dart';
import 'package:yimu/module/base/ks_stateful_widget.dart';
import 'package:yimu/module/category/ks_appbar_category.dart';
import 'package:yimu/module/category/ks_listtile_category.dart';

class KSAsssetsManagerPage extends KSStatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _KSAsssetsManagerPageState();
  }
}

class _KSAsssetsManagerPageState extends State<KSAsssetsManagerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KSAppBar.ks_init(title: widget.pageTitle),
      body: Center(
        child: ListView(
          children: <Widget>[
            Image.asset('assets/images/logo/icon_logo.png'),
            Text('自定义字体',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Norton',
                    fontSize: 36,
                    fontWeight: FontWeight.bold,)),
          ],
        ),
      ),
    );
  }
}
