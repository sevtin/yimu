import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yimu/module/base/ks_stateful_widget.dart';
import 'package:yimu/module/category/ks_appbar_category.dart';

class KSTextFieldPage extends KSStatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _KSTextFieldPageState();
  }
}

class _KSTextFieldPageState extends State<KSTextFieldPage> {
  //focusNode：用于控制TextField是否占有当前键盘的输入焦点。它是我们和键盘交互的一个句柄（handle）。
  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  FocusScopeNode focusScopeNode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: KSAppBar.ks_init(title: widget.pageTitle),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextField(
                autocorrect: true, //autofocus: 是否自动获取焦点。
                focusNode: focusNode1, //关联focusNode1
                decoration: InputDecoration(
                    labelText: 'Input1',
                    prefixIcon: Icon(Icons.account_balance),
                    // 未获得焦点下划线设为灰色
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.green)),
                    //获得焦点下划线设为蓝色
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue))),
              ),
              TextField(
                autocorrect: true,
                focusNode: focusNode2,
                decoration: InputDecoration(
                    labelText: 'Input2', prefixIcon: Icon(Icons.mail)),
              ),
              Builder(builder: (ctx) {
                return Column(
                  children: <Widget>[
                    RaisedButton(
                      child: Text('移动焦点'),
                      onPressed: () {
                        // 将焦点从第一个TextField移到第二个TextField
                        // 这是一种写法 FocusScope.of(context).requestFocus(focusNode2);
                        // 这是第二种写法
                        if (focusScopeNode == null) {
                          focusScopeNode = FocusScope.of(context);
                        }
                        focusScopeNode.requestFocus(focusNode2);
                      },
                    ),
                    RaisedButton(
                      child: Text('隐藏键盘'),
                      onPressed: () {
                        // 当所有编辑框都失去焦点时键盘就会收起
                        focusNode1.unfocus();
                        focusNode2.unfocus();
                      },
                    ),
                    RaisedButton(
                      child: Text('自定义页面输入主题'),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    KSCustomTextFieldPage()));
                      },
                    )
                  ],
                );
              })
            ],
          ),
        ));
  }
}

class KSCustomTextFieldPage extends KSStatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _KSCustomTextFieldPageState();
  }
}

class _KSCustomTextFieldPageState extends State<KSCustomTextFieldPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KSAppBar.ks_init(title: '自定义页面输入主题'),
      body: Theme(
        data: Theme.of(context).copyWith(
            hintColor: Colors.grey[200], //定义下划线颜色
            inputDecorationTheme: InputDecorationTheme(
                labelStyle: TextStyle(color: Colors.red), //定义label字体样式
                hintStyle:
                    TextStyle(color: Colors.yellow, fontSize: 14) //定义提示文本样式
                )),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                  labelText: '用户名',
                  hintText: '用户名或邮箱',
                  prefixIcon: Icon(Icons.person)),
            ),
            TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock),
                  labelText: '密码',
                  hintText: '您的登录密码',
                  hintStyle: TextStyle(color: Colors.green, fontSize: 13.0)),
              obscureText: true,
            ),
            Container(
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                  hintText: '电子邮件',
                  prefixIcon: Icon(Icons.email),
                  border: InputBorder.none//隐藏下划线
                ),
              ),
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color:Colors.deepPurpleAccent,width: 1))
              ),
            )
          ],
        ),
      ),
    );
  }
}
