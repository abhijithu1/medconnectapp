import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _screenheight = MediaQuery.of(context).size.height;
    final _screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: _screenheight,
          width: _screenwidth,
          child: Padding(
            padding: EdgeInsets.only(
              top: _screenheight * 0.13814,
              left: _screenwidth * 0.04843318,
              right: _screenwidth * 0.04843318,
            ),
            child: Column(
              children: [
                Text(
                  'Sign in to Account',
                  style: TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
