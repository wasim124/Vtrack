import 'package:flutter/material.dart';

class AddVehicle extends StatefulWidget {
  @override
  _AddVehicleState createState() => _AddVehicleState();
}

class _AddVehicleState extends State<AddVehicle> {
  String veh_no;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  String initState() {
    veh_no = "";
    // email = "";
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(45.0),
        child: new AppBar(
          backgroundColor: Colors.black,
          title: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Add Vehicle",
                style: TextStyle(color: Colors.yellow[600]),
              ),
              Spacer(),
              // IconButton(
              //   iconSize: 25,
              //   icon: new Icon(Icons.search),
              //   color: Colors.white,
              //   onPressed: () => {},
              // ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Form(
                  child: Column(
                children: [
                  Container(
                    alignment: Alignment.bottomCenter,
                    margin: EdgeInsets.only(top: 20),
                    child: Image.asset(
                      'assets/images/logo.png',
                      height: _height / 3.5,
                      width: _width / 3.5,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 30, right: 30),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.blueGrey[50],
                        // prefixIcon: Icon(Icons.chevron_right),
                        suffixIcon: Icon(Icons.car_rental),
                        hintText: 'Vehicle no.',
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blueGrey),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                      ),
                      onChanged: (input) {
                        setState(() {
                          veh_no = input;
                        });
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10, left: 30, right: 30),
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.blueGrey[50],
                        // prefixIcon: Icon(Icons.chevron_right),
                        suffixIcon: Icon(Icons.people),
                        hintText: 'Owner Name.',
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blueGrey),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                      ),
                      onChanged: (input) {
                        setState(() {
                          veh_no = input;
                        });
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: 10, left: 30, right: 30, bottom: 30),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.blueGrey[50],
                        // prefixIcon: Icon(Icons.chevron_right),
                        suffixIcon: Icon(Icons.mobile_friendly),
                        hintText: 'Mobile No.',
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blueGrey),
                            borderRadius:
                                BorderRadius.all(Radius.circular(30))),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                        ),
                      ),
                      onChanged: (input) {
                        setState(() {
                          veh_no = input;
                        });
                      },
                    ),
                  ),

                  submitButton(),

                  // Container(
                  //   margin: EdgeInsets.only(top: 10, left: 30, right: 30),
                  //   height: 50,
                  //   width: _width * .80,
                  //   child: Card(
                  //     elevation: 15,
                  //     child: ElevatedButton(
                  //         onPressed: () {
                  //           Navigator.pushNamed(context, '/homePage');
                  //         },
                  //         child: Text("Submit")),
                  //   ),
                  // )
                ],
              )),
            ),
          ],
        ),
      ),
    );
  }

  Widget submitButton() {
    return MaterialButton(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      onPressed: () {
        print("Routing to hompage");

        // Scaffold.of(context).showSnackBar(SnackBar(
        //     content: Text('Submitted', style: TextStyle(color: Colors.green))));
        // // _scaffoldKey.currentState.showSnackBar(SnackBar(
        //   content: Text(
        //     'Submitted',
        //     style: TextStyle(color: Colors.green),
        //   ),
        // ));

        final snackBar = SnackBar(content: Text('Yay! A SnackBar!'));

// Find the ScaffoldMessenger in the widget tree
// and use it to show a SnackBar.
        ScaffoldMessenger.of(context).showSnackBar(snackBar);

        Navigator.pushNamed(context, '/homePage');
      },
      textColor: Colors.white,
      padding: EdgeInsets.all(0.0),
      child: Container(
        alignment: Alignment.center,
        width: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          gradient: LinearGradient(
            colors: <Color>[Colors.orange[200], Colors.pinkAccent],
          ),
        ),
        padding: const EdgeInsets.all(12.0),
        child: Text('Submit', style: TextStyle(fontSize: 14)),
      ),
    );
  }
}
