
import 'package:flutter/material.dart';
import 'package:yimu/module/base/ks_stateful_widget.dart';
import 'package:yimu/module/category/ks_appbar_category.dart';

class KSSwitchCheckboxPage extends KSStatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _KSSwitchCheckboxPageState();
  }
}

class _KSSwitchCheckboxPageState extends State<KSSwitchCheckboxPage> {
  bool _switchSelected=true; //维护单选开关状态
  bool _checkboxSelected=true;//维护复选框状态

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KSAppBar.ks_init(title: widget.pageTitle),
      body: Column(
        children: <Widget>[
          Switch(
            value: _switchSelected,//当前状态
            onChanged: (value){
              //重新构建页面
              setState(() {
                _switchSelected = value;
              });
            },
          ),
          Row(
            children: <Widget>[
              Checkbox(
                value: _checkboxSelected,
                activeColor: Colors.red,//选中时的颜色
                onChanged: (value){
                  setState(() {
                    _checkboxSelected = value;
                  });
                },
              ),
              Checkbox(
                value: _checkboxSelected,
                activeColor: Colors.red,//选中时的颜色
                onChanged: (value){
                  setState(() {
                    _checkboxSelected = value;
                  });
                },
              )
            ],
          )
        ],
      ),
    );
  }
}