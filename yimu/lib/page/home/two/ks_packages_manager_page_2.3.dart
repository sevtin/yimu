import 'package:flutter/material.dart';
import 'package:yimu/module/base/ks_stateful_widget.dart';
import 'package:ksnotification/ksnotification.dart';
import 'package:yimu/module/category/ks_appbar_category.dart';
import 'package:yimu/module/category/ks_listtile_category.dart';

class KSPackagesManagerPage extends KSStatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _KSPackagesManagerPageState();
  }
}

const String _kPriceChange = 'kPriceChange';

class _KSPackagesManagerPageState extends State<KSPackagesManagerPage> {
  String _price = '';

  @override
  void initState() {
    super.initState();
    /*1、添加监听*/
    KSNotificationCenter.shard()
        .addListener(_kPriceChange, _priceChangeCallback);
  }

  /*2、监听回调*/
  void _priceChangeCallback(dynamic price) {
    setState(() {
      _price = price;
    });
  }

  @override
  void dispose() {
    /*4、移除监听*/
    KSNotificationCenter.shard()
        .removeListener(_kPriceChange, _priceChangeCallback);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String iphone_price = '3889元';
    return Scaffold(
      appBar: KSAppBar.ks_init(title: widget.pageTitle),
      body: ListView(
        children: <Widget>[
          KSListTile.ks_init(title: _price, onTap: null),
          KSListTile.ks_init(
              title: '价格修改为（${iphone_price}）',
              onTap: () {
                /*3、发送消息*/
                KSNotificationCenter.shard().post(_kPriceChange, iphone_price);
              }),
        ],
      ),
    );
  }
}
