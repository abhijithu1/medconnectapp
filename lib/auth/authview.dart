import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _screenheight = MediaQuery.of(context).size.height;
    final _screenwidth = MediaQuery.of(context).size.width;
    TextEditingController usercntl = TextEditingController();
    TextEditingController passcntl = TextEditingController();
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
                const Text(
                  'Sign in to Account',
                  style: TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 50,
                ),
                Container(
                  height: _screenheight * 0.07031547,
                  child: TextField(
                    controller: usercntl,
                    decoration: InputDecoration(
                      filled: true,
                      prefixIcon: Icon(Icons.person_2),
                      fillColor: Colors.white,

                      // focusColor: AdvColors.loginfield,
                      // hoverColor: AdvColors.loginfield,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(35),
                          borderSide: BorderSide(width: 0.1)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(35),
                          borderSide: BorderSide(width: 0.5)),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(35),
                      ),
                      hintText: "Username",
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: _screenheight * 0.07031547,
                  child: TextField(
                    controller: passcntl,
                    decoration: InputDecoration(
                      filled: true,
                      prefixIcon: Icon(Icons.key),
                      fillColor: Colors.white,
                      // focusColor: AdvColors.loginfield,
                      // hoverColor: AdvColors.loginfield,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(35),
                          borderSide: BorderSide(width: 0.1)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(35),
                          borderSide: BorderSide(width: 0.5)),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(35),
                      ),
                      hintText: "Password",
                    ),
                  ),
                ),
                SizedBox(
                    height: 50,
                    width: _screenwidth * 0.7,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('Sign in'),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
