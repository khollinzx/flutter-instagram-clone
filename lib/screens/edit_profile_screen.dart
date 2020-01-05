import 'package:flutter/material.dart';
import 'package:instagram_clone/models/user_model.dart';

class EditProfileScreen extends StatefulWidget {

  final User user;

  EditProfileScreen({this.user});
  
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _bio = '';

  _submit() {
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();

      String _profileImageUrl = '';
      // update the user datebase
      User user = User(
      id: widget.user.id,
      name: _name,
      bio: _bio,
      profileImageUrl: _profileImageUrl,
      );
      // Update the Database
    Navigator.pop(context);
    
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Edit Profile',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18.0
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: EdgeInsets.all(30.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  CircleAvatar(
                    radius: 60.0,
                    backgroundImage: 
                    NetworkImage('https://i.redd.it/dmdqlcdpjlwz.jpg'),
                  ),
                  FlatButton(
                    onPressed: () => print('Change Profile Image'),
                    child: Text(
                      'Change Profile Image',
                      style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontSize: 16.0
                      ),
                    ),
                  ),
                  TextFormField(
                    initialValue: _name,
                    style: TextStyle(fontSize: 18.0),
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.person,
                        size: 30.0,
                      ),
                      labelText: 'Name',
                    ),
                    validator: (input) => input.trim().length < 1
                    ? 'Please enter a valid name' : null,
                    onSaved: (input) => _name = input,
                  ),
                  TextFormField(
                    initialValue: _bio,
                    style: TextStyle(fontSize: 18.0),
                    decoration: InputDecoration(
                      icon: Icon(
                        Icons.book,
                        size: 30.0,
                      ),
                      labelText: 'Bio',
                    ),
                    validator: (input) => input.trim().length > 150
                    ? 'Please enter less then 150 word' : null,
                    onSaved: (input) => _bio = input,
                  ),
                  Container(
                    margin: EdgeInsets.all(40.0),
                    height: 40.0,
                    width: 250.0,
                    child: FlatButton(
                      onPressed: _submit,
                      color: Colors.blue,
                      textColor: Colors.white,
                      child: Text(
                        'Save Update',
                        style: TextStyle(
                          fontSize: 18.0
                        )
                      ),
                    )
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}