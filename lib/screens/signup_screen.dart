import 'package:flutter/material.dart';
// import 'package:instagram_clone/screens/feed_screen.dart';
import 'package:instagram_clone/screens/login_screen.dart';
import 'package:instagram_clone/services/auth_services.dart';

class SignupScreen extends StatefulWidget {

  static final String id = 'signup_screen';
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  final _formKey= GlobalKey<FormState>();
  String _name, _email, _password;

  _submit() {
    if (_formKey.currentState.validate()){
        _formKey.currentState.save();
        // login User
        AuthServices.signUpUser(context, _name, _email, _password);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Instagram', 
              style: TextStyle(
                fontFamily: 'Billabong',
                fontSize: 50.0,
              ),
            ),
            Form(key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(
                  horizontal: 30.0,
                  vertical: 10.0
                ),
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Name'),
                  validator: (input) => input.trim().isEmpty 
                  ? 'Please Enter a Valid Name': null,
                  onSaved: (input) => _name = input,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                  horizontal: 30.0,
                  vertical: 10.0
                ),
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Email'),
                  validator: (input) => !input.contains('@') ? 'Please Enter a Valid Email': null,
                  onSaved: (input) => _email = input,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                  horizontal: 30.0,
                  vertical: 10.0
                ),
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Password'),
                  validator: (input) => input.length < 6 ? 'Must be more than 6 character': null,
                  onSaved: (input) => _password = input,
                  obscureText: true,
                  ),
                ),
                SizedBox(height: 20.0),
                Container(
                  width: 250.0,
                  child: FlatButton(
                    onPressed: _submit,
                    color: Colors.blue,
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'Sign Up', 
                      style: TextStyle(
                        color: Colors.white, 
                        fontSize: 18.0
                      ),
                    ),
                  ),
                ),
                 SizedBox(height: 20.0),
                  Container(
                    width: 250.0,
                    child: FlatButton(
                    onPressed: () => Navigator.pop(context, LoginScreen.id),
                    color: Colors.blue,
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'Back To Login', 
                      style: TextStyle(
                        color: Colors.white, 
                        fontSize: 18.0
                      ),
                    ),
                  ),
                ),
              ],
            ),
            ),
          ],
        ),
      ),
    );
  }
}