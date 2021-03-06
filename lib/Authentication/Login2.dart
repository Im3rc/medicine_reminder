import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:medicine_reminder/PatientList/PhasePage.dart';

class Login2 extends StatefulWidget {
  @override
  _Login2State createState() => _Login2State();
}

bool _passwordVisible;

class _Login2State extends State<Login2> {
  Future<void> _alertDialogBuilder(String e) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Error"),
            content: Container(
              child: Text(e),
            ),
            actions: [
              FlatButton(
                  child: Text("Close"),
                  onPressed: () {
                    Navigator.pop(context);
                  })
            ],
          );
        });
  }

  Future<String> _loginAccount() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _loginEmail, password: _loginPassword);
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      }
      return e.message;
    } catch (e) {
      return e.toString();
    }
  }

  void _submitForm() async {
    String _loginFeedback = await _loginAccount();
    // If the string is not null, we got error while create account.
    if (_loginFeedback != null) {
      _alertDialogBuilder(_loginFeedback);
    }
  }

  String _loginEmail = "";
  String _loginPassword = "";

  @override
  void initState() {
    _passwordVisible = false;
    super.initState();
  }

  String emailValidator(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Email format is invalid';
    } else {
      return null;
    }
  }

  String pwdValidator(String value) {
    if (value.length < 8) {
      return 'Password must be longer than 8 characters';
    } else {
      return null;
    }
  }

  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: 80,
        ),
        Text(
          "Welcome to",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Color(0xffBB86FC),
            height: 2,
          ),
        ),
        Text(
          "MedReminder",
          style: TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
            color: Color(0xffBB86FC),
            letterSpacing: 2,
            height: 1,
          ),
        ),
        SizedBox(
          height: 46,
        ),
        TextFormField(
          onChanged: (value) {
            _loginEmail = value;
          },
          //controller: emailController,
          keyboardType: TextInputType.emailAddress,
          validator: emailValidator,
          style: TextStyle(color: Color(0xfff2e7fe)),
          decoration: InputDecoration(
              labelText: 'Email',
              prefixIcon: Icon(
                Icons.email,
                color: Color(0xffF2E7FE),
              ),
              labelStyle: TextStyle(
                fontSize: 16,
                color: Color(0xffF2E7FE),
                fontWeight: FontWeight.bold,
              ),
              filled: true,
              fillColor: Color(0xff292929),
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xfff2e7fe)),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xffBB86fc)),
                //  when the TextFormField in focused
              ),
              border: UnderlineInputBorder()),
        ),
        SizedBox(
          height: 20,
        ),
        TextFormField(
          onChanged: (value) {
            _loginPassword = value;
          },
          validator: pwdValidator,
          keyboardType: TextInputType.text,
          obscureText: !_passwordVisible,
          // controller: passwordController,
          style: TextStyle(color: Color(0xfff2e7fe)),
          decoration: InputDecoration(
              labelText: 'Password',
              prefixIcon: Icon(
                Icons.lock,
                color: Color(0xffF2E7FE),
              ),
              labelStyle: TextStyle(
                fontSize: 16,
                color: Color(0xffF2E7FE),
                fontWeight: FontWeight.bold,
              ),
              filled: true,
              fillColor: Color(0xff292929),
              contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
              suffixIcon: IconButton(
                icon: Icon(
                  _passwordVisible ? Icons.visibility : Icons.visibility_off,
                  color: Color(0xFFf2e7fe),
                ),
                onPressed: () {
                  setState(() {
                    _passwordVisible = !_passwordVisible;
                  });
                },
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xfff2e7fe)),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xffBB86fc)),
                //  when the TextFormField in focused
              ),
              border: UnderlineInputBorder()),
        ),
        SizedBox(
          height: 26,
        ),
        InkWell(
          onTap: _submitForm,
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              color: Color(0xff292929),
              borderRadius: BorderRadius.all(
                Radius.circular(25),
              ),
              border: Border.all(color: Color(0xffBB86FC), width: 1),
              boxShadow: [
                BoxShadow(
                  color: Color(0xffF292929).withOpacity(0.2),
                  spreadRadius: 3,
                  blurRadius: 4,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Center(
              child: Text(
                "Log In",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffF2E7FE),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Row(
          children: [
            Text(
              "Forgot ",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFFF2E7FE),
                height: 1,
              ),
            ),
            InkWell(
              onTap: () {
                // Future<void> resetPassword(String email) async {
                //   await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
                // }
              },
              child: Text(
                "Password?",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFF2E7FE),
                  height: 1,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
