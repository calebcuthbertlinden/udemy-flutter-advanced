import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class Animations extends StatefulWidget {
  Animations({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _AnimationsState createState() => _AnimationsState();
}

class _AnimationsState extends State<Animations> with SingleTickerProviderStateMixin{

  late Animation<double> animation;
  late Animation<double> curvedAnimation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: const Duration(milliseconds: 5000), vsync: this);

    // Tween animation
    // animation = new Tween(begin: 0.0, end: 400.0).animate(controller);

    // Curve animation
    curvedAnimation = CurvedAnimation(parent: controller, curve: Curves.easeIn);
    curvedAnimation.addStatusListener(listener);
    controller.forward();
  }

  void listener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      controller.reverse();
    } else if (status == AnimationStatus.dismissed) {
      controller.forward();
    }
  }

  // Animated widget
  Widget builder(BuildContext context, Widget? child) {
    return Container(
      height: animation.value,
      width: animation.value,
      child: FlutterLogo()
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:
      Container(
       padding: EdgeInsets.all(32.0),
        child: Center(
          child: AnimatedLogo(Key("1"), curvedAnimation)
          // child: AnimatedBuilder(animation: animation, builder: builder)
        )
      ),
    );
  }
}


class AnimatedLogo extends AnimatedWidget {

  AnimatedLogo(Key key, Animation<double> animation) : super(key: key, listenable: animation);

  static final opacityTween = Tween<double>(begin: 0.1, end: 1.0);
  static final sizeTween = Tween<double>(begin: 0.0, end: 300.0);
  static final rotateTween = Tween<double>(begin: 0.0, end: 12.0);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation =  listenable as Animation<double>;
    return Center(
        child: Transform.rotate(angle: rotateTween.evaluate(animation),
            child: Opacity(opacity: opacityTween.evaluate(animation),
              child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  height: sizeTween.evaluate(animation),
                  width: sizeTween.evaluate(animation),
                  child: FlutterLogo()
              ),))
    );
  }

}