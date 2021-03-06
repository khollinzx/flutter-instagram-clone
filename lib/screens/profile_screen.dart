import 'package:flutter/material.dart';
import 'package:instagram_clone/models/user_model.dart';
import 'package:instagram_clone/utilities/constants.dart';

import 'edit_profile_screen.dart';

class ProfileScreen extends StatefulWidget {

  final String userId;

  ProfileScreen({this.userId});

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: userRef.document(widget.userId).get(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if(!snapshot.hasData){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          User user = User.fromDoc(snapshot.data);
        return ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 0.0),
            child: Row(
            children: <Widget>[
              CircleAvatar(
                radius: 50.0,
                backgroundImage: NetworkImage('https://i.redd.it/dmdqlcdpjlwz.jpg'),
              ),
              Expanded(
                  child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Text(
                              '12',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              'posts',
                              style: TextStyle(
                                color: Colors.black54,
                              )
                            )
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Text(
                              '386',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              'followers',
                              style: TextStyle(
                                color: Colors.black54,
                              )
                            )
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Text(
                              '345',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              'followings',
                              style: TextStyle(
                                color: Colors.black54,
                              )
                            )
                          ],
                        ),
                      ],
                    ),
                    Container(
                      width: 200.0,
                      child: FlatButton(
                      onPressed: () => Navigator.push(context, 
                        MaterialPageRoute(
                          builder: (_) => EditProfileScreen(
                            user: user,
                          ),
                        ),
                      ),
                      color: Colors.blue,
                      textColor: Colors.white,
                      child: Text(
                        'Edit Profile',
                        style: TextStyle(
                          fontSize: 18.0
                        ),
                      ),
                    ),
                    )
                  ],
                ),
              ),
            ],
          ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  user.name,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  )
                ),
                SizedBox(height: 5.0),
                Container(
                  height: 80.0,
                  child: Text(
                    user.bio,
                    style: TextStyle(fontSize: 15.0),
                  ),
                ),
                Divider(),
              ],
            )
          )
        ],
      );
      },
      ),
    );
  }
}