

import 'package:flutter/material.dart';
import 'package:yimu/module/base/ks_stateful_widget.dart';
import 'package:yimu/module/category/ks_appbar_category.dart';

class KSCounterPpplicationPage extends KSStatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _KSCounterPpplicationPageState();
  }

}

class _KSCounterPpplicationPageState extends State<KSCounterPpplicationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KSAppBar.ks_init(title: widget.pageTitle),
    );
  }

}