import 'package:flutter/material.dart';

class AnimatePage extends StatefulWidget {
  @override
  State createState() {
    return AnimatePageState();
  }
}

class AnimatePageState extends State<AnimatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatePage'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            OutlinedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/alphaPage');
                },
                child: const Text('AlphaAnimation')),
            OutlinedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/scalePage');
                },
                child: const Text('ScaleAnimation'))
          ],
        ),
      ),
    );
  }
}

class AlphaAnimation extends StatefulWidget {
  @override
  State createState() {
    return _AlphaAnimationState();
  }
}

class _AlphaAnimationState extends State<AlphaAnimation> {
  bool show = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('AlphaAnimation'),
        ),
        body: Center(
          child: Column(
            children: [
              AnimatedOpacity(
                opacity: show ? 1.0 : 0.0,
                duration: const Duration(seconds: 1),
                child: Image.asset(
                  'assets/images/girl15.jpeg',
                  width: 350,
                ),
              ),
              OutlinedButton(
                  onPressed: () {
                    setState(() {
                      show = !show;
                    });
                  },
                  child: const Text('显示隐藏'))
            ],
          ),
        ));
  }
}

/**
 * 当写复杂一些动画的时候，没有对应的widget组件，就需要自己使用Animation，和AnimationController，以及Tween
 * 来组合。
 * Animation: 保存动画的值和状态
 * AnimationController: 控制动画，包含：启动forward()、停止stop()、反向播放reverse()等方法
 * Tween: 提供begin，end作为动画变化的取值范围
 * Curve：设置动画使用曲线变化，如非匀速动画，先加速，后减速等的设定。
 */
class ScaleAnimation extends StatefulWidget {
  @override
  State createState() {
    return _ScaleAnimationState();
  }
}

class _ScaleAnimationState extends State<ScaleAnimation>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;
  bool start = true;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(seconds: 3), vsync: this);

    //使用弹性曲线，数据变化从0到300
    animation = CurvedAnimation(parent: controller, curve: Curves.bounceIn);
    animation = Tween(begin: 150.0, end: 400.0).animate(animation)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ScaleAnimation'),
      ),
      body: Center(
        child: Column(
          children: [
            OutlinedButton(
                onPressed: () {
                  //启动动画(正向执行)
                  if (start) {
                    controller.forward();
                  } else {
                    controller.reverse();
                  }
                  start = !start;
                },
                child: const Text('开始动画')),
            Image.asset('assets/images/girl16.jpeg',
                width: animation.value, height: animation.value),
          ],
        ),
      ),
    );
  }

  @override
  dispose() {
    //路由销毁时需要释放动画资源
    controller.dispose();
    super.dispose();
  }
}
