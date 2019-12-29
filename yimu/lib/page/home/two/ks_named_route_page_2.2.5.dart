import 'package:flutter/material.dart';
import 'package:yimu/module/base/ks_stateful_widget.dart';
import 'package:yimu/module/category/ks_appbar_category.dart';
import 'package:yimu/module/category/ks_listtile_category.dart';

class KSNamedRoutePage extends KSStatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _KSNamedRoutePageState();
  }
}

class _KSNamedRoutePageState extends State<KSNamedRoutePage> {
  String _display = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KSAppBar.ks_init(title: widget.pageTitle),
      body: ListView(
        children: <Widget>[
          KSListTile.ks_init(title: '传给下个页面的值是（价格：3399元）', onTap: null),
          KSListTile.ks_init(title: _display, onTap: null),
          KSListTile.ks_init(
              title: '进入下个页面',
              onTap: () async {
                var result = await Navigator.pushNamed(
                    context, 'KSProductDetailsPage',
                    arguments: '价格：3399元');
                if (result != null) {
                  setState(() {
                    _display = result as String;
                  });
                }
              })
        ],
      ),
    );
  }
}
