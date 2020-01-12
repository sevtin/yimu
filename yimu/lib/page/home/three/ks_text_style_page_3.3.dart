import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:yimu/module/base/ks_stateful_widget.dart';
import 'package:yimu/module/category/ks_appbar_category.dart';

class KSTextStylePage extends KSStatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _KSTextStylePageState();
  }
}

class _KSTextStylePageState extends State<KSTextStylePage> {
  TextStyle _textStyle = const TextStyle(
    fontFamily: 'Norton',
    fontSize: 32
  );

  TapGestureRecognizer _tapRecognizer = TapGestureRecognizer()
    ..onTap = () {
      print('------- _tapRecognizer -------');
    };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KSAppBar.ks_init(title: widget.pageTitle),
      body: ListView(
        children: <Widget>[
          Text(
            "Hello world",
            textAlign: TextAlign.left,
            style: _textStyle,
          ),
          Text(
            "Hello world! I'm Jack. " * 4,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            "Hello world",
            textScaleFactor: 1.5,
          ),
          Text(
            "Hello world " * 6, //字符串重复六次
            textAlign: TextAlign.center,
          ),
          Text(
            "Hello world",
            style: TextStyle(
                color: Colors.blue,
                fontSize: 18.0,
                height: 1.2,
                fontFamily: "Courier",
                background: new Paint()..color = Colors.yellow,
                decoration: TextDecoration.underline,
                decorationStyle: TextDecorationStyle.dashed),
          ),
          Text.rich(TextSpan(children: [
            TextSpan(text: "Home: "),
            TextSpan(
                text: "https://flutterchina.club",
                style: TextStyle(color: Colors.blue),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    print('------- _tapRecognizer -------');
                  }),
          ])),
          DefaultTextStyle(
            //1.设置文本默认样式
            style: TextStyle(
              color: Colors.red,
              fontSize: 20.0,
            ),
            textAlign: TextAlign.start,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("hello world"),
                Text("I am Jack"),
                Text(
                  "I am Jack",
                  style: TextStyle(
                      inherit: false, //2.不继承默认样式
                      color: Colors.grey),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
