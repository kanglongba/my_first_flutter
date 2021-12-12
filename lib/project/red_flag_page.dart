import 'dart:math';

import 'package:flutter/material.dart';

class RedFlagPage extends StatelessWidget {
  const RedFlagPage({Key? key}) : super(key: key);

  /// CustomPaint 可以结合一个画笔 CustomPainter 在Canvas上实现绘制自定义图形。
  /// CustomPaint构造函数说明：
  /// painter: 背景画笔，会显示在子节点后面;
  /// foregroundPainter: 前景画笔，会显示在子节点前面
  /// size：当child为null时，代表默认绘制区域大小，如果有child则忽略此参数，画布尺寸则为child尺寸。如果有child但是想指定画布为特定大小，可以使用SizeBox包裹CustomPaint实现。
  /// isComplex：是否复杂的绘制，如果是，Flutter会应用一些缓存策略来减少重复渲染的开销。
  /// willChange：和isComplex配合使用，当启用缓存时，该属性代表在下一帧中绘制是否会改变。
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('绘制五星红旗'),
      ),
      body: Center(
        child: AspectRatio(
          aspectRatio: 3.0 / 2.0,
          child: CustomPaint(
            painter: FiveStarredRedFlagPainter(hover: false),
            size: Size.infinite,
            willChange: false,
            isComplex: false,
          ),
        ),
      ),
    );
  }
}

/// 它的坐标计算不准确，画出来的星星都是歪的。
///
/// paint属性和canvas方法说明：
/// color：画笔颜色
/// style：绘制模式，画线或者填充
/// strokeWidth：线条宽度
/// shader：着色器，一般用来绘制渐变效果或ImageShader
/// canvas.drawRect：绘制正方形
/// path.moveTo：移动画笔到某个点，不设置时默认为画布左上角位置。
/// path.lineTo：画直线到某个点。
/// canvas.drawPath(path, paint)：把路径落实到画布上。
/// path.close()：闭合路径以实现填充效果。
class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    //画红旗背景
    var paint = Paint()
      ..isAntiAlias = true //抗锯齿
      ..style = PaintingStyle.fill //填充
      ..color = const Color(0xFFDE2910); //背景为红色
    canvas.drawRect(Offset.zero & size, paint);

    //开始画五星
    paint
      ..isAntiAlias = true //抗锯齿
      ..style = PaintingStyle.fill //线
      ..color = const Color(0xFFFFDE00)
      ..strokeWidth = 1.0;

    // 五星绘制。r是半径， x、y是圆心坐标值。rot是旋转角度（四个小星星有倾斜）。逆时针作画。
    void drawStar(Canvas canvas, double r, double x, double y, double rot) {
      Path path = Path();
      path.moveTo(cos(18 / 180 * pi) * r + x, -sin(18 / 180 * pi) * r + y);
      for (var i = 0; i < 5; i++) {
        path.lineTo(cos((18 + i * 72 - rot) / 180 * pi) * r + x,
            -sin((18 + i * 72 - rot) / 180 * pi) * r + y);
        path.lineTo(cos((54 + i * 72 - rot) / 180 * pi) * r / 2.4 + x,
            -sin((54 + i * 72 - rot) / 180 * pi) * r / 2.4 + y);
      }
      canvas.drawPath(path, paint);
      path.close();
    }

    drawStar(canvas, 60, 60, 60, 0); // 大星星
    List<int> starF = [45, 15, 345, 315]; // 纠正偏移量
    for (int j = 0; j < starF.length; j++) {
      double rot = 18.0 + j * 28;
      double x = cos(starF[j] / 180 * pi) * 80 + 60;
      double y = -sin(starF[j] / 180 * pi) * 60 + 65;
      drawStar(canvas, 60 / 6, x, y, rot);
    }
  }

  //在实际场景中正确利用此回调可以避免重绘开销，本示例我们简单的返回true
  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

/// 星星坐标计算准确，绘制效果很好
/// 代码：https://github.com/iota9star/five_starred_red_flag_flutter
class FiveStarredRedFlagPainter extends CustomPainter {
  final bool hover;

  FiveStarredRedFlagPainter({required this.hover});

  @override
  void paint(Canvas canvas, Size size) {
    final double itemSize = size.width / (15 * 2);
    final Paint paint = Paint();
    // 设置抗锯齿
    paint.isAntiAlias = true;
    hover
        ? _drawGrid(canvas, paint, size, itemSize)
        : _drawFlag(canvas, paint, size, itemSize);
  }

  void _drawGrid(Canvas canvas, Paint paint, Size size, double gridItemSize) {
    // 绘制背景
    paint
      ..style = PaintingStyle.fill
      ..color = const Color.fromARGB(255, 246, 138, 142);
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);

    // 设置背景色
    _drawFiveStar(canvas, paint, gridItemSize);

    /// 1. 先将旗面划分为4个等分长方形，再将左上方长方形划分长宽15×10个方格。
    paint
      ..style = PaintingStyle.stroke
      ..color = const Color.fromARGB(255, 8, 6, 6);
    // 绘制大格子
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);
    // 绘制中分线，分为四个格子
    final double halfHeight = size.height / 2;
    canvas.drawLine(
        Offset(0, halfHeight), Offset(size.width, halfHeight), paint);
    final double halfWidth = size.width / 2;
    canvas.drawLine(
        Offset(halfWidth, 0), Offset(halfWidth, size.height), paint);

    // 绘制左上角小格子
    // 绘制横向线条
    for (int i = 1; i < 10; ++i) {
      canvas.drawLine(Offset(0, i * gridItemSize),
          Offset(halfWidth, i * gridItemSize), paint);
    }
    // 绘制竖向线条
    for (int i = 1; i < 15; ++i) {
      canvas.drawLine(Offset(i * gridItemSize, 0),
          Offset(i * gridItemSize, halfHeight), paint);
    }

    /// 2. 大五角星的中心位于该长方形上5下5、左5右10之处。大五角星外接圆的直径为6单位长度。
    canvas.drawCircle(Offset(5 * gridItemSize, 5 * gridItemSize),
        6 / 2 * gridItemSize, paint);

    /// 3. 四颗小五角星的中心点，第一颗位于上2下8、左10右5，第二颗位于上4下6、左12右3，第三颗位于上7下3、左12右3，第四颗位于上9下1、左10右5之处。
    canvas.drawCircle(
        Offset(10 * gridItemSize, 2 * gridItemSize), gridItemSize, paint);
    canvas.drawCircle(
        Offset(12 * gridItemSize, 4 * gridItemSize), gridItemSize, paint);
    canvas.drawCircle(
        Offset(12 * gridItemSize, 7 * gridItemSize), gridItemSize, paint);
    canvas.drawCircle(
        Offset(10 * gridItemSize, 9 * gridItemSize), gridItemSize, paint);

    // 将所有的小圆圆心与大圆圆心相连
    canvas.drawLine(Offset(5 * gridItemSize, 5 * gridItemSize),
        Offset(10 * gridItemSize, 2 * gridItemSize), paint);
    canvas.drawLine(Offset(5 * gridItemSize, 5 * gridItemSize),
        Offset(12 * gridItemSize, 4 * gridItemSize), paint);
    canvas.drawLine(Offset(5 * gridItemSize, 5 * gridItemSize),
        Offset(12 * gridItemSize, 7 * gridItemSize), paint);
    canvas.drawLine(Offset(5 * gridItemSize, 5 * gridItemSize),
        Offset(10 * gridItemSize, 9 * gridItemSize), paint);
  }

  void _drawFlag(Canvas canvas, Paint paint, Size size, gridItemSize) {
    // 绘制背景
    paint
      ..style = PaintingStyle.fill
      ..color = const Color.fromARGB(255, 238, 28, 37);
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);

    _drawFiveStar(canvas, paint, gridItemSize);
  }

  void _drawFiveStar(Canvas canvas, Paint paint, double gridItemSize) {
    /// 4. 每颗小五角星外接圆的直径均为2单位长度。四颗小五角星均有一角尖正对大五角星的中心点。
    // 设置背景色
    paint
      ..style = PaintingStyle.fill
      ..color = const Color.fromARGB(255, 255, 255, 0);

    // 绘制大五角星
    _drawStar(canvas, paint, Offset(5 * gridItemSize, 5 * gridItemSize),
        6 / 2 * gridItemSize);
    // 绘制小五角星
    _drawStar(
      canvas,
      paint,
      Offset(10 * gridItemSize, 2 * gridItemSize),
      gridItemSize,
      offset:
          (270 - asin(3 / sqrt(pow(3, 2) + pow(5, 2))) * 180 / pi) * pi / 180,
    );
    _drawStar(
      canvas,
      paint,
      Offset(12 * gridItemSize, 4 * gridItemSize),
      gridItemSize,
      offset:
          (270 - asin(1 / sqrt(pow(7, 2) + pow(1, 2))) * 180 / pi) * pi / 180,
    );
    _drawStar(
      canvas,
      paint,
      Offset(12 * gridItemSize, 7 * gridItemSize),
      gridItemSize,
      offset:
          (360 - asin(7 / sqrt(pow(7, 2) + pow(2, 2))) * 180 / pi) * pi / 180,
    );
    _drawStar(
      canvas,
      paint,
      Offset(10 * gridItemSize, 9 * gridItemSize),
      gridItemSize,
      offset:
          (360 - asin(5 / sqrt(pow(4, 2) + pow(5, 2))) * 180 / pi) * pi / 180,
    );
  }

  void _drawStar(
    Canvas canvas,
    Paint paint,
    Offset center,
    double radius, {
    double offset = 0,
  }) {
    final Path path = Path();
    final List<Offset> points = [];
    // 获得五个顶点的坐标
    for (int i = 0; i < 5; i++) {
      // math.pi / 2 -> 90°
      // math.pi / 2.5 -> 72°
      // 每个点偏移的角度
      final double degree = pi / 2 + i * pi / 2.5 + offset;
      // 计算每个点的x，y坐标
      points.add(Offset(center.dx - (radius * cos(degree)),
          center.dy - (radius * sin(degree))));
    }
    // 将绘制点移到第一个点顶点
    path.moveTo(points[0].dx, points[0].dy);
    // 点与点之间的连接顺序为：0 -> 2 -> 4 -> 1 -> 3 -> 0
    path.lineTo(points[2].dx, points[2].dy);
    path.lineTo(points[4].dx, points[4].dy);
    path.lineTo(points[1].dx, points[1].dy);
    path.lineTo(points[3].dx, points[3].dy);
    path.lineTo(points[0].dx, points[0].dy);
    // 绘制路径
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant FiveStarredRedFlagPainter oldDelegate) {
    return oldDelegate.hover != hover;
  }
}
