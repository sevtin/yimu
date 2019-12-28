import 'package:flutter/material.dart';
import 'package:yimu/module/tabbar/ks_tabbar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //应用名称
      title: 'YiMu',
      theme: ThemeData(
        //蓝色主题
        primarySwatch: Colors.blue,
      ),
      home: KSTabBar(),
      //不显示Debug标签
      debugShowCheckedModeBanner: false,
    );
  }
}

