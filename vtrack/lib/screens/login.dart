import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:vtrack/screens/home_screen.dart';
import 'package:vtrack/widgets/customshape.dart';
import 'package:vtrack/widgets/resp_ui.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// import 'package:me2/views/dashboard.dart';
// import 'package:me2/widgets/custom_shape.dart';
// import 'package:me2/widgets/custom_textfield.dart';
// import 'package:me2/widgets/responsive_ui.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignInScreen(),
    );
  }
}

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  double _height;
  double _width;
  double _pixelRatio;
  bool _large;
  bool _medium;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> _key = GlobalKey();
  String email, password;

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    _large = ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    _medium = ResponsiveWidget.isScreenMedium(_width, _pixelRatio);
    return Scaffold(
      bottomSheet: new Container(
        padding: const EdgeInsets.only(left: 80.0),
        child: Text(' \u00a9 copyright 2021 Vtrack. All Right eserved'),
      ),
      body: Material(
        child: Container(
          height: _height,
          width: _width,
          padding: EdgeInsets.only(bottom: 5),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                clipShape(),
                welcomeTextRow(),
                signInTextRow(),
                form(),
                forgetPassTextRow(),
                SizedBox(height: _height / 12),
                button(),
                signUpTextRow(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget clipShape() {
    //double height = MediaQuery.of(context).size.height;
    return Stack(
      children: <Widget>[
        Opacity(
          opacity: 0.75,
          child: ClipPath(
            clipper: CustomShapeClipper(),
            child: Container(
              height: _large
                  ? _height / 4
                  : (_medium ? _height / 3.75 : _height / 3.5),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.orange[200], Colors.pinkAccent],
                ),
              ),
            ),
          ),
        ),
        Opacity(
          opacity: 0.5,
          child: ClipPath(
            clipper: CustomShapeClipper2(),
            child: Container(
              height: _large
                  ? _height / 4.5
                  : (_medium ? _height / 4.25 : _height / 4),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.orange[200], Colors.pinkAccent],
                ),
              ),
            ),
          ),
        ),
        Container(
          alignment: Alignment.bottomCenter,
          margin: EdgeInsets.only(
              top: _large
                  ? _height / 30
                  : (_medium ? _height / 25 : _height / 20)),
          child: Image.asset(
            'assets/images/logo.png',
            height: _height / 3.5,
            width: _width / 3.5,
          ),
        ),
      ],
    );
  }

  Widget welcomeTextRow() {
    return Container(
      // width: _large ? _width / 4 : (_medium ? _width / 3.75 : _width / 3.5),
      margin: EdgeInsets.only(left: _width / 20, top: _height / 100),
      child: Row(
        children: <Widget>[
          Text(
            "Welcome",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: _large ? 60 : (_medium ? 50 : 40),
            ),
          ),
        ],
      ),
    );
  }

  Widget signInTextRow() {
    return Container(
      // width: _large ? _width / 4 : (_medium ? _width / 3.75 : _width / 3.5),
      margin: EdgeInsets.only(left: _width / 15.0),
      child: Row(
        children: <Widget>[
          Text(
            "Login to your account",
            style: TextStyle(
              fontWeight: FontWeight.w200,
              fontSize: _large ? 20 : (_medium ? 17.5 : 15),
            ),
          ),
        ],
      ),
    );
  }

  Widget form() {
    return Container(
      // width: _large ? _width / 4 : (_medium ? _width / 3.75 : _width / 3.5),
      margin: EdgeInsets.only(
          left: _width / 12.0, right: _width / 12.0, top: _height / 15.0),
      child: Form(
        key: _key,
        child: Column(
          children: <Widget>[
            emailTextFormField(),
            SizedBox(height: _height / 40.0),
            passwordTextFormField(),
          ],
        ),
      ),
    );
  }

  Widget emailTextFormField() {
    return Material(
      color: Colors.lightBlue[50],
      borderRadius: BorderRadius.circular(30.0),
      child: TextFormField(
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        cursorColor: Colors.orange[200],
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.email, color: Colors.orange[200], size: 20),
          hintText: 'Email',
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide.none),
        ),
        onChanged: (value) {
          email = value;
        },
      ),
    );
  }

  Widget passwordTextFormField() {
    return Material(
      color: Colors.lightBlue[50],
      borderRadius: BorderRadius.circular(30.0),
      child: TextFormField(
        controller: passwordController,
        keyboardType: TextInputType.emailAddress,
        cursorColor: Colors.orange[200],
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.lock, color: Colors.orange[200], size: 20),
          hintText: 'Password',
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide.none),
        ),
        onChanged: (value) {
          password = value;
        },
      ),
    );
  }

  Widget forgetPassTextRow() {
    return Container(
      margin: EdgeInsets.only(top: _height / 40.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Forgot your password?",
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: _large ? 14 : (_medium ? 12 : 10)),
          ),
          SizedBox(
            width: 5,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('/forgotPassword');
              print("Routing to ForotPassword screen");
            },
            child: Text(
              "Recover",
              style: TextStyle(
                  fontWeight: FontWeight.w600, color: Colors.orange[200]),
            ),
          )
        ],
      ),
    );
  }

  Widget button() {
    return MaterialButton(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      onPressed: () {
        print("Routing to your account");

        // FirebaseAuth.instance
        //     .signInWithEmailAndPassword(email: email, password: password)
        //     .then((FirebaseUser) {
        //   Navigator.pushNamed(context, '/homePage').catchError((e) {
        //     print(e);
        //   });
        // });

        if (email == 'wasim@gmail.com' && password == 'wasim') {
          // Scaffold.of(context)
          //     .showSnackBar(SnackBar(content: Text('LoginScreen Successful')));

          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomeScreen()));
        } else {
          Toast.show("Please enter correct email and password", context,
              duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
        }
      },
      textColor: Colors.white,
      padding: EdgeInsets.all(0.0),
      child: Container(
        alignment: Alignment.center,
        width: _large ? _width / 4 : (_medium ? _width / 3.75 : _width / 3.5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          gradient: LinearGradient(
            colors: <Color>[Colors.orange[200], Colors.pinkAccent],
          ),
        ),
        padding: const EdgeInsets.all(12.0),
        child: Text('SIGN IN',
            style: TextStyle(fontSize: _large ? 14 : (_medium ? 12 : 10))),
      ),
    );
  }

  Widget signUpTextRow() {
    return Container(
      margin: EdgeInsets.only(top: _height / 120.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Don't have an account?",
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: _large ? 14 : (_medium ? 12 : 10)),
          ),
          SizedBox(
            width: 5,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('/signup');
              print("Routing to Sign up screen");
            },
            child: Text(
              "Sign up",
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Colors.orange[200],
                  fontSize: _large ? 19 : (_medium ? 17 : 15)),
            ),
          )
        ],
      ),
    );
  }
}


// import 'package:flutter/material.dart';

// class LoginScreen extends StatefulWidget {
//   @override
//   _LoginScreenState createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }



// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:vtrack/screens/home_screen.dart';
// import 'package:flutter/material.dart';

// class LoginScreenScreen extends StatefulWidget {
//   LoginScreenScreen({Key key, this.title}) : super(key: key);
//   final String title;

//   @override
//   _LoginScreenScreenState createState() => _LoginScreenScreenState();
// }

// class _LoginScreenScreenState extends State<LoginScreenScreen> {
//   TextStyle style = TextStyle(fontFamily: 'Open Sans', fontSize: 15.0);
//   final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
//   // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   String name, email, password, password_confirmation;

//   RegExp regex = new RegExp(
//       r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
//   RegExp regex1 = new RegExp(
//       r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
//   RegExp regex2 = new RegExp(
//       r'^([a-zA-Z])[a-zA-Z_-]*[\w_-]*[\S]$|^([a-zA-Z])[0-9_-]*[\S]$|^[a-zA-Z]*[\S]$');
//   bool isVisible;
//   Icon visibleIcon;

//   bool isLoading;

//   @override
//   String initState() {
//     name = "";
//     email = "";
//     password = "";
//     password_confirmation = "";

//     isLoading = false;
//     isVisible = true;
//     visibleIcon =
//         isVisible == true ? Icon(Icons.visibility) : Icon(Icons.visibility_off);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: new Scaffold(
//           backgroundColor: Colors.transparent,
//           key: _scaffoldKey,
//           body: Stack(children: <Widget>[
//             new Container(
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(colors: [
//                   Colors.indigo,
//                   Colors.deepOrange,
//                 ]),
//               ),
//             ),
//             new Center(
//               child: new SingleChildScrollView(
//                 child: new Container(
//                   height: 400,
//                   margin: const EdgeInsets.only(top: 0, bottom: 50),
//                   child: Padding(
//                     padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
//                     child: Form(
//                       // key: _formKey,
//                       autovalidate: isLoading,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         mainAxisSize: MainAxisSize.max,
//                         children: <Widget>[
//                           Container(
//                             height: 60,
//                             width: 250,
//                             decoration: BoxDecoration(
//                               gradient: LinearGradient(colors: [
//                                 Colors.purple,
//                                 Colors.deepPurpleAccent,
//                               ]),
//                               borderRadius: BorderRadius.circular(15),
//                             ),
//                             child: Center(
//                                 child: Text(
//                               "Vtrack",
//                               style: TextStyle(
//                                   fontSize: 40.0,
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.bold),
//                             )),
//                           ),
//                           SizedBox(
//                             height: 20,
//                           ),

//                           Container(
//                             child: Column(
//                               children: <Widget>[
//                                 Padding(
//                                   padding: EdgeInsets.symmetric(
//                                       vertical: 2.0, horizontal: 5.0),
//                                   child: TextFormField(
//                                     keyboardType: TextInputType.emailAddress,
//                                     decoration: InputDecoration(
//                                       filled: true,
//                                       fillColor: Colors.white,
//                                       prefixIcon: Icon(Icons.chevron_right),
//                                       hintText: 'Email ID/Mobile no.',
//                                       enabledBorder: OutlineInputBorder(
//                                           borderSide:
//                                               BorderSide(color: Colors.white),
//                                           borderRadius: BorderRadius.all(
//                                               Radius.circular(30))),
//                                       border: OutlineInputBorder(
//                                         borderSide:
//                                             BorderSide(color: Colors.white),
//                                         borderRadius: BorderRadius.all(
//                                             Radius.circular(30)),
//                                       ),
//                                     ),
//                                     onChanged: (input) {
//                                       setState(() {
//                                         email = input;
//                                       });
//                                     },
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   height: 15.0,
//                                 ),
//                                 Padding(
//                                   padding: EdgeInsets.symmetric(
//                                       vertical: 2.0, horizontal: 5.0),
//                                   child: TextField(
//                                     // keyboardType: TextInputType.visiblePassword,
//                                     obscureText: true,
//                                     decoration: InputDecoration(
//                                       filled: true,
//                                       fillColor: Colors.white,
//                                       prefixIcon: Icon(Icons.chevron_right),
//                                       hintText: 'Password',
//                                       enabledBorder: OutlineInputBorder(
//                                           borderSide:
//                                               BorderSide(color: Colors.white),
//                                           borderRadius: BorderRadius.all(
//                                               Radius.circular(30))),
//                                       border: OutlineInputBorder(
//                                         borderSide:
//                                             BorderSide(color: Colors.white),
//                                         borderRadius: BorderRadius.all(
//                                             Radius.circular(30)),
//                                       ),
//                                     ),

//                                     onChanged: (input) {
//                                       setState(() {
//                                         password = input;
//                                       });
//                                     },
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           SizedBox(
//                             height: 55.0,
//                           ),
//                           // !isLoading
//                           //     ?
//                           Container(
//                             transform:
//                                 Matrix4.translationValues(0.0, -10.0, 0.0),
//                             margin: const EdgeInsets.all(5),
//                             // color: Colors.deepPurple,
//                             width: MediaQuery.of(context).size.width,
//                             height: 50,
//                             child: FlatButton(
//                               color: Colors.amber,
//                               shape: new RoundedRectangleBorder(
//                                 borderRadius: new BorderRadius.circular(30.0),
//                               ),
//                               onPressed: () async {
//                                 if (email.isEmpty) {
//                                   Fluttertoast.showToast(
//                                       msg: "Please enter email/mobile",
//                                       toastLength: Toast.LENGTH_SHORT,
//                                       gravity: ToastGravity.CENTER,
//                                       timeInSecForIosWeb: 1,
//                                       backgroundColor: Colors.red,
//                                       textColor: Colors.white,
//                                       fontSize: 16.0);
//                                 } else if (password.isEmpty) {
//                                   Fluttertoast.showToast(
//                                       msg: "Please enter password",
//                                       toastLength: Toast.LENGTH_SHORT,
//                                       gravity: ToastGravity.CENTER,
//                                       timeInSecForIosWeb: 1,
//                                       backgroundColor: Colors.red,
//                                       textColor: Colors.white,
//                                       fontSize: 16.0);
//                                 } else {
//                                   if (email == "xyz@gmail.com" &&
//                                       password == "12345") {
//                                     Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                           builder: (context) => HomeScreen()),
//                                     );
//                                   } else {
//                                     Fluttertoast.showToast(
//                                         msg:
//                                             "Please enter valid email & password",
//                                         toastLength: Toast.LENGTH_SHORT,
//                                         gravity: ToastGravity.CENTER,
//                                         timeInSecForIosWeb: 1,
//                                         backgroundColor: Colors.red,
//                                         textColor: Colors.white,
//                                         fontSize: 16.0);
//                                   }
//                                 }
//                               },
//                               // register user details in database

//                               // if (name.isEmpty) {
//                               //   showInDialog(
//                               //       context, "Error", "User ID is Empty!");
//                               // }
//                               //  else if (!regex2.hasMatch(name)) {
//                               //   showInDialog(context, "Error",
//                               //       "Please enter name in this format :username | user123 |user_123 | user-123 | username123_type");
//                               //       }
//                               // else
//                               //       if (name.length < 2) {
//                               //   showInDialog(context, "Error",
//                               //       "Name is too short");
//                               // }else
//                               //    if (email.isEmpty) {
//                               //     // showInDialog(
//                               //     //     context, "Error", "User ID is Empty!");
//                               //   }
//                               //   //  else if (!regex1.hasMatch(email)) {
//                               //   //   showInDialog(context, "Error",
//                               //   //       "Please enter a valid email");
//                               //   // }
//                               //   else if (password.isEmpty) {
//                               //     // showInDialog(context, "Error",
//                               //     //     "Password is Empty!");
//                               //   }
//                               //     else if (password=="demo" && email=="demo") {
//                               //      Navigator.push(
//                               //                       context,
//                               //                       MaterialPageRoute(
//                               //                           builder: (context) =>
//                               //                               HomeScreen()),
//                               //                     );
//                               //   }
//                               //    else if (password!="demo" || email!="demo") {
//                               //     // showInDialog(context, "Error",
//                               //     //     "Please correct user id or password !");
//                               //   }
//                               //   // else if (password.length < 6) {
//                               //   //   showInDialog(context, "Error",
//                               //   //       "The password must be at least 6 characters.");
//                               //   // }
//                               //   //  else if (!regex.hasMatch(password)) {
//                               //   //   showInDialog(context, "Error",
//                               //   //       "Please enter a valid password: Minimum 1 Upper case, 1 lowercase,1 Numeric Number,Special Character, 1 Special Character");
//                               //   // }
//                               //   // else if (password_confirmation.isEmpty) {
//                               //   //   showInDialog(context, "Error",
//                               //   //       "Product type is Empty!");
//                               //   // }
//                               //   //  else if (password_confirmation !=
//                               //   //     password) {
//                               //   //   showInDialog(context, "Error",
//                               //   //       "Password & Confirm Password not matching!");
//                               //   // }
//                               //   // else {
//                               //   //    if (_formKey.currentState.validate()) {

//                               //   //     _formKey.currentState.save();
//                               //   //   }
//                               //   else
//                               //   {
//                               //     setState(() {
//                               //       isLoading = true;
//                               //     });

//                               //   }
//                               // },
//                               // color: Color(0xff2E3192),
//                               child: Text(
//                                 "LoginScreen",
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 20,
//                                   fontFamily: 'Open Sans',
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ]),
//         ));
//   }
// }
