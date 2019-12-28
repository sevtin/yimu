import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class KSNavigator {
  static ks_push(BuildContext context, Widget widget) {
    if (context == null || widget == null) {
      return;
    }
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return widget;
    }));
  }
}
