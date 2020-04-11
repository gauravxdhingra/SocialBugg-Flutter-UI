import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_social_ui/data/data.dart';
import 'package:flutter_social_ui/widgets/posts_carousal.dart';

import '../widgets/following_users.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    // _tabController.index
    _pageController = PageController(
      initialPage: 0,
      viewportFraction: 0.8,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        title: Text(
          'SOCIALBUGG',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            // fontSize: 34,
            fontWeight: FontWeight.bold,
            letterSpacing: 10.0,
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          labelColor: Theme.of(context).primaryColor,
          indicatorWeight: 3,
          dragStartBehavior: DragStartBehavior.start,
          labelStyle: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
          tabs: <Widget>[
            Tab(
              text: 'Trending',
            ),
            Tab(
              text: 'Latest',
            ),
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          FollowingUsers(),
          PostCarousel(
              pageController: _pageController, title: 'Posts', posts: posts),
        ],
      ),
    );
  }
}
