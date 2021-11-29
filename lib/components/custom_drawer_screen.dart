import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fire_trips/Constants/const_colors.dart';
import 'package:flutter_fire_trips/components/custom_drawer.dart';
import 'package:foldable_sidebar/foldable_sidebar.dart';
import 'package:swipedetector/swipedetector.dart';

class CustomDrawerScreen extends StatefulWidget {
  String screenTitle;
  Widget screenContents;

  @override
  _CustomDrawerScreenState createState() => _CustomDrawerScreenState();

  CustomDrawerScreen({this.screenTitle, this.screenContents});
}

class _CustomDrawerScreenState extends State<CustomDrawerScreen> {
  FSBStatus drawerStatus;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.screenTitle),
      ),
      body: SwipeDetector(
        onSwipeRight: () {
          setState(() {
            drawerStatus = FSBStatus.FSB_OPEN;
          });
        },
        onSwipeLeft: () {
          setState(() {
            drawerStatus = FSBStatus.FSB_CLOSE;
          });
        },
        child: FoldableSidebarBuilder(
          drawerBackgroundColor: kPrimaryLightColor,
          drawer: CustomDrawer(
           // key: GlobalKey<,
            closeDrawer: () {
              setState(() {
                drawerStatus = FSBStatus.FSB_CLOSE;
              });
            },
          ),
          screenContents: widget.screenContents,
          status: drawerStatus,
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.menu,
            color: Colors.white,
          ),
          onPressed: manageDrawerState),
    );
  }

  manageDrawerState() {
    setState(() {
      drawerStatus = drawerStatus == FSBStatus.FSB_OPEN
          ? FSBStatus.FSB_CLOSE
          : FSBStatus.FSB_OPEN;
    });
  }
}
