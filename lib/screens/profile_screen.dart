import 'package:flutter/material.dart';
import 'package:flutter_social_ui/models/user_model.dart';
import 'package:flutter_social_ui/widgets/custom_drawer.dart';

class ProfileScreen extends StatefulWidget {
  final User user;

  ProfileScreen(this.user);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        // controller: controller,
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Image(
                  image: AssetImage(
                    widget.user.backgroundImageUrl,
                  ),
                  height: 300,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 28,
                  left: 10,
                  child: IconButton(
                    iconSize: 30,
                    color: Theme.of(context).primaryColor,
                    icon: Icon(Icons.line_weight),
                    onPressed: () {
                      return _scaffoldKey.currentState.openDrawer();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
