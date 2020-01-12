
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
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 5,
            child: LinearProgressIndicator(//线型进度条
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation(Colors.blue),
            ),
          ),
          SizedBox(
            height: 10,
            width: 300,
            child: LinearProgressIndicator(
              //valueColor: 指示器的进度条颜色；值得注意的是，该值类型是Animation<Color>，这允许我们对进度条的颜色也可以指定动画。如果我们不需要对进度条颜色执行动画，换言之，我们想对进度条应用一种固定的颜色，此时我们可以通过AlwaysStoppedAnimation来指定。
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation(Colors.blue),
              value: 0.5,
            ),
          ),
          SizedBox(
            height: 50,
            width: 50,
            child: CircularProgressIndicator(
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation(Colors.blue),
            ),
          ),
          SizedBox(
            height: 40,
            width: 50,
            child: CircularProgressIndicator(
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation(Colors.blue),
              value: 0.5,
            ),
          ),
          RaisedButton(
            child: Text('进度色动画'),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => KSProgressAnimationPage()));
            },
          )
        ],
      ),
    );
  }

}

class KSProgressAnimationPage extends KSStatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _KSProgressAnimationPageState();
  }
}

class _KSProgressAnimationPageState extends State<KSProgressAnimationPage> with SingleTickerProviderStateMixin {

  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this,duration: Duration(seconds: 3));
    _animationController.forward();
    _animationController.addListener((){
      setState(() {

      });
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KSAppBar.ks_init(title: '进度色动画'),
      body:SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16),
              child: LinearProgressIndicator(
                backgroundColor: Colors.grey[200],
                valueColor: ColorTween(begin: Colors.grey,end: Colors.blue).animate(_animationController),
                value: _animationController.value,
              ),
            )
          ],
        ),
      ),
    );
  }
}