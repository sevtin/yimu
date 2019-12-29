import 'package:flutter/material.dart';
import 'package:yimu/module/tabbar/ks_tabbar.dart';
import 'package:yimu/page/home/two/ks_product_details_page_2.2.5.dart';
import 'package:yimu/page/home/two/ks_route_hook_page_2.2.6.dart';

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
      routes: {
        //2.2.6 路由生成钩子:取消路由表
        'KSProductDetailsPage':(context)=>KSProductDetailsPage()
      },
      //不显示Debug标签
      debugShowCheckedModeBanner: false,
      //注意，onGenerateRoute只会对命名路由生效。
      /*
      当调用Navigator.pushNamed(...)打开命名路由时，如果指定的路由名在路由表中已注册，则会调用路由表中的builder函数来生成路由组件；如果路由表中没有注册，才会调用onGenerateRoute来生成路由。
       */
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (context) {
          String routeName = settings.name;
          print('onGenerateRoute:' + routeName);
          // 如果访问的路由页需要登录，但当前未登录，则直接返回登录页路由，
          // 引导用户登录；其它情况则正常打开路由。
          if (routeName == 'KSRouteHookChildPage') {
            return KSRouteHookChildPage();
          }
        },settings: settings);//settings:传递参数
      },
    );
  }
}
