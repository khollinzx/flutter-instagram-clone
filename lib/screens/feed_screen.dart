import 'package:flutter/material.dart';
import 'package:instagram_clone/services/auth_services.dart';

// the Feed Screen is the Home Screen that Displays when the User logs in

class FeedScreen extends StatefulWidget {
  static final String id = 'feed_screen';
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: FlatButton(
          onPressed: () => AuthServices.logout(),
          child: Text('LOGOUT'),
        ),
      ),
    );
  }
}