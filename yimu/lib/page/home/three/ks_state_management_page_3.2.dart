
import 'package:flutter/material.dart';
import 'package:yimu/module/base/ks_stateful_widget.dart';
import 'package:yimu/module/category/ks_appbar_category.dart';

class KSStateManagementPage extends KSStatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _KSStateManagementPageState();
  }
}

class _KSStateManagementPageState extends State<KSStateManagementPage> {

  bool _active = false;
  bool _redColor = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KSAppBar.ks_init(title: widget.pageTitle),
      body: ListView(
        children: <Widget>[
          KSTapboxOneWidget(onChanged: _onTapboxOneStateChanged),
          KSTapboxTwoWidget(active: _active ,onChanged: _onTapboxTwoChanged),
          ListTile(
            title: Text('TapboxOne',style: TextStyle(fontSize: 32,color: _redColor ? Colors.red : Colors.blue)),
          )
        ],
      ),
    );
  }

  _onTapboxOneStateChanged(bool value){
    setState(() {
      _redColor = value;
    });
  }

  _onTapboxTwoChanged(bool value){
    setState(() {
      _active = value;
    });
  }
}

class KSTapboxOneWidget extends StatefulWidget {
  final ValueChanged<bool> onChanged;

  const KSTapboxOneWidget({Key key, this.onChanged}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _KSTapboxOneWidgetState();
  }
}

class _KSTapboxOneWidgetState extends State<KSTapboxOneWidget> {

  bool _active = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        child: Center(
          child: Text(
            _active ? 'active' : 'Inactive',
            style:  TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200,
        height: 200,
        decoration: BoxDecoration(
            color: _active ? Colors.red : Colors.blue
        ),
      ),
    );
  }

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
    widget.onChanged(_active);
  }
}

class KSTapboxTwoWidget extends StatelessWidget {

  final bool active;
  final ValueChanged<bool> onChanged;

  const KSTapboxTwoWidget({Key key, this.active, this.onChanged}) : super(key: key);

  void _handleTap() {
    onChanged(!active);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        child: Center(
          child: Text(
            active ? 'active' : 'Inactive',
            style:  TextStyle(fontSize: 32.0, color: Colors.white),
          ),
        ),
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          color: active ? Colors.lightGreen[700] : Colors.grey[600]
        ),
      ),
    );
  }
}