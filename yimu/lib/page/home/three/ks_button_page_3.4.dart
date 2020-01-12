import 'package:flutter/material.dart';
import 'package:yimu/module/base/ks_stateful_widget.dart';
import 'package:yimu/module/category/ks_appbar_category.dart';

class KSButtonPage extends KSStatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _KSButtonPageState();
  }
}

class _KSButtonPageState extends State<KSButtonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: KSAppBar.ks_init(title: widget.pageTitle),
        body: Column(
          children: <Widget>[
            FlatButton(
              child: Text("普通按钮"),
              onPressed: () {},
            ),
            RaisedButton(
              child: Text('漂浮 按钮'),
              onPressed: () {},
            ),
            OutlineButton(
              child: Text("边框按钮"),
              onPressed: () {},
              highlightedBorderColor: Colors.red,
            ),
            IconButton(
              icon: Icon(Icons.thumb_up),
              onPressed: () {},
            ),
            RaisedButton.icon(
              icon: Icon(Icons.send),
              label: Text("发送"),
              onPressed: () {},
            ),
            OutlineButton.icon(
              icon: Icon(Icons.add),
              label: Text("添加"),
              onPressed: () {},
            ),
            FlatButton.icon(
              icon: Icon(Icons.info),
              label: Text("详情"),
              onPressed: () {},
            ),
            FlatButton(
              color: Colors.blue,
              highlightColor: Colors.blue[700],
              colorBrightness: Brightness.dark,
              splashColor: Colors.grey,
              child: Text("Submit"),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              onPressed: () {},
            ),
            RaisedButton(
              color: Colors.blue,
              highlightColor: Colors.blue[700],
              colorBrightness: Brightness.dark,
              splashColor: Colors.grey,
              child: Text("Submit"),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              onPressed: () {},
              elevation:2.0,//正常状态下的阴影
              highlightElevation: 8.0,//按下时的阴影
              disabledElevation: 0.0,// 禁用时的阴影
            )
          ],
        )
        /*
      ListView(
        children: <Widget>[
          FlatButton(
            child: Text("普通按钮"),
            onPressed: () {},
          ),
          RaisedButton(
            child: Text('漂浮 按钮'),
            onPressed: () {},
          ),
        ],
      ),*/
        );
  }
}
