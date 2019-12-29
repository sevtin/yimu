import 'package:flutter/material.dart';
import 'package:yimu/module/base/ks_stateful_widget.dart';
import 'package:yimu/module/category/ks_appbar_category.dart';
import 'package:yimu/module/category/ks_listtile_category.dart';

class KSRouteHookPage extends KSStatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _KSRouteHookPageState();
  }
}

class _KSRouteHookPageState extends State<KSRouteHookPage> {
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
                    context, 'KSRouteHookChildPage',
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

class KSRouteHookChildPage extends StatelessWidget {
  String _newPrice = '价格：3111元';

  @override
  Widget build(BuildContext context) {
    var arguments = ModalRoute.of(context).settings.arguments as String;

    return Scaffold(
      appBar: KSAppBar.ks_init(title: '路由生成钩子子页面'),
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
