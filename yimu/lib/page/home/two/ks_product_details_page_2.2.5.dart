import 'package:flutter/material.dart';
import 'package:yimu/module/base/ks_stateful_widget.dart';
import 'package:yimu/module/category/ks_appbar_category.dart';
import 'package:yimu/module/category/ks_listtile_category.dart';

class KSProductDetailsPage extends KSStatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _KSProductDetailsPageState();
  }
}

class _KSProductDetailsPageState extends State<KSProductDetailsPage> {
  String _newPrice = '价格：88元';

  @override
  Widget build(BuildContext context) {
    var arguments = ModalRoute.of(context).settings.arguments as String;

    return Scaffold(
      appBar: KSAppBar.ks_init(title: '商品详情页'),
      body: ListView(
        children: <Widget>[
          KSListTile.ks_init(title: 'iPhone8：' + arguments, onTap: null),
          KSListTile.ks_init(title: '返回值是：' + _newPrice, onTap: null),
          KSListTile.ks_init(
              title: '返回',
              onTap: () {
                Navigator.pop(context, _newPrice);
              })
        ],
      ),
    );
  }
}
