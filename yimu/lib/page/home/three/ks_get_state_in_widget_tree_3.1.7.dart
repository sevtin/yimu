
import 'package:flutter/material.dart';
import 'package:yimu/module/base/ks_stateful_widget.dart';
import 'package:yimu/module/category/ks_appbar_category.dart';

class KSGetStateIntWidgetTreePage extends KSStatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _KSGetStateIntWidgetTreeState();
  }

}

class _KSGetStateIntWidgetTreeState extends State<KSGetStateIntWidgetTreePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KSAppBar.ks_init(title: widget.pageTitle),
      body: Center(
        child: Builder(builder: (context){
          /*
          return RaisedButton(
            onPressed: (){
              // 查找父级最近的Scaffold对应的ScaffoldState对象
              ScaffoldState _state = context.findAncestorStateOfType<ScaffoldState>();
              //调用ScaffoldState的showSnackBar来弹出SnackBar
              _state.showSnackBar(
                SnackBar(
                  content: Text('我是SnackBar01'),
                )
              );
            },
            child: Text('显示SnackBar01'),
          );*/
          return RaisedButton(
            onPressed: (){
              // 直接通过of静态方法来获取ScaffoldState
              ScaffoldState _state = Scaffold.of(context);
              _state.showSnackBar(
                SnackBar(
                  content: Text("我是SnackBar02"),
                ),
              );
            },
            child: Text('显示SnackBar02'),
          );
        }),
      ),
    );
  }

}