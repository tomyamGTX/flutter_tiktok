import 'dart:math';

import 'package:cool_alert/cool_alert.dart';
import 'package:drawing_animation/drawing_animation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:tiktok_flutter/constant.dart';
import 'package:tiktok_flutter/views/google.play.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter TikTok',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: kPrimary,
      ),
      home: const GooglePlayClone(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double? positionX = 100;
  double? positionY = 350;
  bool loading = true;

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5), changeLoading);
    super.initState();
  }

  final Paint _paint = Paint()
    ..color = Colors.redAccent
    ..strokeWidth = 3.0
    ..style = PaintingStyle.stroke
    ..strokeJoin = StrokeJoin.miter;
  var show = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.5;
    double height = MediaQuery.of(context).size.height * 0.5;

    return loading
        ? Lottie.network(
            'https://assets7.lottiefiles.com/packages/lf20_cUG5w8.json')
        : Scaffold(
            backgroundColor: kPrimary,
            appBar: AppBar(
              title: Text(widget.title),
            ),
            body: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.01,
                  bottom: MediaQuery.of(context).size.height * 0.6,
                  child: AnimatedDrawing.paths(
                    [
                      Path()
                        ..moveTo(0.5 * width, height * 0.6)
                        ..cubicTo(0.1 * width, height * 0.4, -0.35 * width,
                            height * 0.6, 0.5 * width, height)
                        ..moveTo(0.5 * width, height * 0.6)
                        ..cubicTo(0.9 * width, height * 0.4, 1.35 * width,
                            height * 0.6, 0.5 * width, height),
                    ],
                    paints: [_paint],
                    run: !show,
                    animationOrder: PathOrders.topToBottom,
                    duration: const Duration(seconds: 3),
                    lineAnimation: LineAnimation.oneByOne,
                    animationCurve: Curves.linear,
                    onFinish: () => setState(() {
                      show = true;
                    }),
                  ),
                ),
                if (show)
                  Positioned(
                    top: MediaQuery.of(context).size.height * 0.35,
                    child: const Text(
                      'Do you love me?',
                      style: TextStyle(fontSize: 40, letterSpacing: 1),
                      textAlign: TextAlign.center,
                    ),
                  ),
                if (show)
                  Positioned(
                      top: 350,
                      left: 100,
                      child: ElevatedButton(
                          onPressed: () async {
                            setState(() {
                              show = !show;
                            });
                            await CoolAlert.show(
                                context: context,
                                type: CoolAlertType.custom,
                                title: 'Yeay! Thank You',
                                lottieAsset: 'assets/jsons/love_animation.json',
                                confirmBtnText: 'You\'re Welcome',
                                widget: Lottie.network(
                                    'https://assets7.lottiefiles.com/packages/lf20_ky24lkyk.json',
                                    height: 200));
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green),
                          child: Text(
                            'Yes',
                            style: style,
                          ))),
                if (show)
                  Positioned(
                      top: positionY,
                      right: positionX,
                      child: ElevatedButton(
                          onPressed: () => setState(() {
                                positionX =
                                    Random().nextInt(width.toInt()).toDouble();
                                positionY =
                                    Random().nextInt(height.toInt()).toDouble();
                                if (kDebugMode) {
                                  print('$positionX, $positionY');
                                }
                              }),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                          ),
                          child: Text(
                            'No',
                            style: style,
                          ))),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.pink,
              onPressed: () {
                launchUrl(Uri.parse('https://www.tiktok.com/@hakimimdnoor'));
              },
              tooltip: 'Increment',
              child: const Icon(Icons.tiktok),
            ), // This trailing comma makes auto-formatting nicer for build methods.
          );
  }

  changeLoading() {
    if (loading) {
      setState(() {
        loading = !loading;
      });
    }
  }
}
