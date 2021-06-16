import 'package:flutter/material.dart';
import 'package:vtrack/screens/home_screen.dart';
import 'package:vtrack/widgets/customshape.dart';
import 'package:vtrack/widgets/resp_ui.dart';
// import 'package:me2/views/dashboard.dart';
// import 'package:me2/widgets/custom_shape.dart';
// import 'package:me2/widgets/custom_textfield.dart';
// import 'package:me2/widgets/responsive_ui.dart';

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignUpScreen(),
    );
  }
}

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  double _height;
  double _width;
  double _pixelRatio;
  bool _large;
  bool _medium;
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> _key = GlobalKey();
  String email, password;
  String _radioValue1; //Initial definition of radio button value
  String _handleRadioValueChange1;
  String dropdownvalue = 'Owner';
  var items = [
    'Owner',
    'Driver',
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    _large = ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    _medium = ResponsiveWidget.isScreenMedium(_width, _pixelRatio);
    return Material(
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
              // forgetPassTextRow(),
              SizedBox(height: _height / 12),
              button(),
              loginTextRow(),
            ],
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
            "SignUp here",
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
            nameTextFormField(),
            SizedBox(height: _height / 40.0),
            mobileTextFormField(),
            SizedBox(height: _height / 40.0),
            emailTextFormField(),
            SizedBox(height: _height / 40.0),
            passwordTextFormField(),
            SizedBox(height: _height / 40.0),
            confirmPasswordTextFormField(),
            SizedBox(height: _height / 40.0),
            myDropdownButton(),
            // radioButtonChanges(_radioValue),
          ],
        ),
      ),
    );
  }

  Widget nameTextFormField() {
    return Material(
      color: Colors.lightBlue[50],
      borderRadius: BorderRadius.circular(30.0),
      child: TextFormField(
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        cursorColor: Colors.orange[200],
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.email, color: Colors.orange[200], size: 20),
          hintText: 'Name',
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

  Widget mobileTextFormField() {
    return Material(
      color: Colors.lightBlue[50],
      borderRadius: BorderRadius.circular(30.0),
      child: TextFormField(
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        cursorColor: Colors.orange[200],
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.email, color: Colors.orange[200], size: 20),
          hintText: 'Mobile',
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
        controller: emailController,
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
          email = value;
        },
      ),
    );
  }

  Widget confirmPasswordTextFormField() {
    return Material(
      color: Colors.lightBlue[50],
      borderRadius: BorderRadius.circular(30.0),
      child: TextFormField(
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        cursorColor: Colors.orange[200],
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.email, color: Colors.orange[200], size: 20),
          hintText: 'Confirm Password',
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

  Widget myDropdownButton() {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton(
              // hint: Text("Select"),
              value: dropdownvalue,
              icon: Icon(Icons.keyboard_arrow_down),
              items: items.map((String items) {
                return DropdownMenuItem(value: items, child: Text(items));
              }).toList(),
              onChanged: (String newValue) {
                setState(() {
                  dropdownvalue = newValue;
                });
              },
            ),
          ],
        ),
      ),
    );
    // Container(
    //   child:
    //       Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
    //     new Radio(
    //       value: 0,
    //       groupValue: _radioValue1,
    //       onChanged: (value) {
    //         _radioValue1 = value;
    //       },
    //     ),
    //     new Text(
    //       'OWNER',
    //       style: new TextStyle(fontSize: 16.0),
    //     ),
    //     new Radio(
    //       value: 1,
    //       groupValue: _radioValue1,
    //       onChanged: (_handleRadioValueChange1) {},
    //     ),
    //     new Text(
    //       'DRIVER',
    //       style: new TextStyle(
    //         fontSize: 16.0,
    //       ),
    //     ),
    //   ]),
    // );
  }

  Widget button() {
    return MaterialButton(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      onPressed: () {
        print("Routing to your account");
        Scaffold.of(context)
            .showSnackBar(SnackBar(content: Text('SignUp Successful')));
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
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
        child: Text('SIGN UP',
            style: TextStyle(fontSize: _large ? 14 : (_medium ? 12 : 10))),
      ),
    );
  }

  Widget loginTextRow() {
    return Container(
      margin: EdgeInsets.only(top: _height / 120.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Already have an account?",
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: _large ? 14 : (_medium ? 12 : 10)),
          ),
          SizedBox(
            width: 5,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
              print("Routing to Sign up screen");
            },
            child: Text(
              "Login",
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
