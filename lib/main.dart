import 'dart:math';

import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:tiktok_flutter/constant.dart';
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
          textTheme: GoogleFonts.lobsterTextTheme()),
      home: const MyHomePage(title: 'Flutter TikTok'),
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
  double? positionY = 320;
  bool loading = true;

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5), changeLoading);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.8;
    double height = MediaQuery.of(context).size.height * 0.8;

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
                  top: MediaQuery.of(context).size.height * 0.3,
                  child: const Text(
                    'Do you love me?',
                    style: TextStyle(fontSize: 40, letterSpacing: 1),
                    textAlign: TextAlign.center,
                  ),
                ),
                Positioned(
                    top: 320,
                    left: 100,
                    child: ElevatedButton(
                        onPressed: () async {
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
