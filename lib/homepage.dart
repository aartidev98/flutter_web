import 'package:flutter/material.dart';
import 'package:flutter_web/destinationcarousal.dart';
import 'package:flutter_web/destinationheading.dart';
import 'package:flutter_web/featuretiles.dart';
import 'package:flutter_web/featureheadings.dart';
import 'package:flutter_web/floatingQuickAccessBar.dart';
import 'package:flutter_web/responsive.dart';
import 'package:flutter_web/topbarcontents.dart';
import 'package:flutter_web/webscrollbar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
List _isHovering = [false, false, false, false];
class _HomePageState extends State<HomePage> {

  ScrollController _scrollController;
  double _scrollPosition = 0;
  double _opacity = 0;

  _scrollListener() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar:
      ResponsiveWidget.isSmallScreen(context)
          ? AppBar(
        backgroundColor: Colors.blueGrey[900].withOpacity(_opacity),
        elevation: 0,
        title: Text(
          'EXPLORE',
          style: TextStyle(
            color: Colors.blueGrey[100],
            fontSize: 20,
            fontWeight: FontWeight.w400,
            letterSpacing: 3,
          ),
        ),
      )
          : PreferredSize(
        preferredSize: Size(screenSize.width, 1000),
        child: TopBarContents(_opacity),
      ),
      body:
      SingleChildScrollView(
        controller: _scrollController,
        //physics: ClampingScrollPhysics(),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  child: SizedBox(
                    height: screenSize.height * 0.45,
                    width: screenSize.width,
                    child: Image.asset(
                      'demo.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  children: [
                    FloatingQuickAccessBar(screenSize: screenSize),
                    Container(
                      child: Column(
                        children: [
                          FeaturedHeading(
                            screenSize: screenSize,
                          ),
                          FeaturedTiles(screenSize: screenSize)
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
            // SizedBox(height: screenSize.height / 8),
            DestinationHeading(screenSize: screenSize),
            DestinationCarousel(),
          ],
        ),
      ),










    );
  }
}

