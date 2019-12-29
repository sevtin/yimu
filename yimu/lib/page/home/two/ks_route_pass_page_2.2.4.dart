
import 'package:flutter/material.dart';
import 'package:yimu/module/base/ks_stateful_widget.dart';
import 'package:yimu/module/category/ks_appbar_category.dart';
import 'package:yimu/module/category/ks_listtile_category.dart';

class KSRoutePassPage extends KSStatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _KSRoutePassPageState();
  }
}

class _KSRoutePassPageState extends State<KSRoutePassPage> {
  String _display = '';
  @override
  Widget build(BuildContext context) {
    String _price = '价格：66元';
    return Scaffold(
      appBar: KSAppBar.ks_init(title: widget.pageTitle),
      body: ListView(
        children: <Widget>[
          KSListTile.ks_init(title: '传给下个页面的值是（价格：66元）',onTap: null),
          KSListTile.ks_init(title: _display,onTap: null),
          KSListTile.ks_init(title: '进入下个页面',onTap: () async {
            // 打开`传值显示页面`，并等待返回结果
            var result = await Navigator.push(context, MaterialPageRoute(builder: (context){
              return KSKSRoutePassValuePage(price: _price);
            }));
            setState(() {
              _display = result;
            });
          })
        ],
      ),
    );
  }
}

class KSKSRoutePassValuePage extends StatelessWidget {

  final String price;

  const KSKSRoutePassValuePage({Key key, this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _price = '价格：88元';
    return Scaffold(
      appBar: KSAppBar.ks_init(title: '展示上一个传入的值'),
      body: ListView(
        children: <Widget>[
          KSListTile.ks_init(title: price,onTap: null),
          KSListTile.ks_init(title: '返回（价格：88元）',onTap: (){
            Navigator.pop(context,_price);
          }),
        ],
      ),
    );
  }

}
