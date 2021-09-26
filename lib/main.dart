import 'package:flutter/material.dart';
import 'package:flutter_web/destinationcarousal.dart';
import 'package:flutter_web/destinationheading.dart';
import 'package:flutter_web/featuretiles.dart';
import 'package:flutter_web/floatingQuickAccessBar.dart';
import 'package:flutter_web/homepage.dart';
import 'package:flutter_web/responsive.dart';
import 'package:flutter_web/topbarcontents.dart';
import 'package:flutter_web/webscrollbar.dart';
import 'featureheadings.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Explore',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}