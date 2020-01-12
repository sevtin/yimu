
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yimu/module/base/ks_stateful_widget.dart';
import 'package:yimu/module/category/ks_appbar_category.dart';

class KSProgressPage extends KSStatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _KSProgressPageState ();
  }
}

class _KSProgressPageState extends State<KSProgressPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KSAppBar.ks_init(title: widget.pageTitle),

    );
  }

}