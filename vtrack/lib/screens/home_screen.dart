import 'package:vtrack/screens/add_vehicle.dart';
import 'package:vtrack/screens/car_map.dart';
import 'package:flutter/material.dart';
import 'package:vtrack/screens/profile.dart';
import 'package:vtrack/widgets/drawer.dart';
import 'package:marquee_flutter/marquee_flutter.dart';
import 'package:vtrack/screens/history_vehicle.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextStyle style = TextStyle(fontFamily: 'Open Sans', fontSize: 15.0);
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  double _height, _width;

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        home: new Scaffold(
            backgroundColor: Colors.blueGrey,
            key: _scaffoldKey,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(45.0),
              child: new AppBar(
                backgroundColor: Colors.black,
                title: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Dashboard",
                      style: TextStyle(color: Colors.yellow[600]),
                    ),
                    Spacer(),
                    IconButton(
                      iconSize: 25,
                      icon: new Icon(Icons.search),
                      color: Colors.white,
                      onPressed: () => {},
                    ),
                  ],
                ),
              ),
            ),
            drawer: Drawer(
              child: ListView(padding: EdgeInsets.all(0.0), children: <Widget>[
                UserAccountsDrawerHeader(
                  accountName: Text(
                    '',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  accountEmail: Text(''),
                  otherAccountsPictures: <Widget>[
                    CircleAvatar(
                      child: Text('W'),
                    ),
                  ],
                  onDetailsPressed: () {},
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/logo.png'),
                          fit: BoxFit.fitHeight)),
                ),
                ListTile(
                  title: Text('Profile'),
                  leading: Icon(Icons.person),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Profile()));
                  },
                ),
                // Divider(),
                ListTile(
                  title: Text('Add Vehicle'),
                  leading: Icon(Icons.add_circle_outline_rounded),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AddVehicle()));
                  },
                ),
                // ListTile(
                //   title: Text('New Chat'),
                //   leading: Icon(Icons.chat),
                //   onLongPress: () {},
                // ),
                ListTile(
                  title: Text('History Vehicle'),
                  leading: Icon(Icons.history),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HistoryVehicle()));
                  },
                ),
                // Divider(),
                ListTile(
                  title: Text('Settings'),
                  leading: Icon(Icons.settings),
                  onLongPress: () {},
                ),
                // Divider(),
                ListTile(
                  title: Text('Support'),
                  leading: Icon(Icons.report_problem),
                  onLongPress: () {},
                ),
                ListTile(
                    title: Text('Logout'),
                    leading: Icon(Icons.logout),
                    onTap: () {
                      Navigator.pushNamed(context, '/');
                    }),
              ]),
            ),
            body: Stack(children: <Widget>[
              Column(children: <Widget>[
                Container(
                  color: Colors.blueGrey,
                  height: 25,
                  child: new MarqueeWidget(
                    text:
                        "Vtrack          Vtrack          Vtrack          Vtrack          Vtrack",
                    textStyle: new TextStyle(fontSize: 20.0),
                    scrollAxis: Axis.horizontal,
                  ),
                ),
                // SizedBox(height: 5),
                Container(
                  child: Row(
                    // mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      //TabBAr
                      Container(
                        height: _height * 0.85,
                        width: _width,
                        margin: EdgeInsets.only(top: 5),
                        child: DefaultTabController(
                          length: 3,
                          child: new Scaffold(
                            backgroundColor: Colors.blueGrey[50],
                            floatingActionButton: FloatingActionButton(
                              onPressed: () {
                                setState(() {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => AddVehicle()));
                                  // counter = counter + 1;
                                });
                              },
                              child: Container(
                                width: 60,
                                height: 60,
                                child: Icon(Icons.add),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.deepPurple[800],
                                        Colors.deepPurpleAccent
                                      ],
                                    )),
                              ),
                            ),
                            appBar: PreferredSize(
                              preferredSize: Size.fromHeight(80),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: new AppBar(
                                  automaticallyImplyLeading: false,
                                  backgroundColor: Colors.blueGrey[50],
                                  elevation: 0,
                                  flexibleSpace: new Column(
                                    children: [
                                      new TabBar(
                                        indicatorWeight: 1,
                                        indicatorColor: Colors.black,
                                        indicatorSize:
                                            TabBarIndicatorSize.label,
                                        labelColor: Color(0xff2D2727),
                                        labelStyle: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600),
                                        unselectedLabelStyle: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w600),
                                        tabs: <Widget>[
                                          Tab(
                                            text: "Running",
                                          ),
                                          Tab(
                                            text: "Stopped",
                                          ),
                                          Tab(
                                            text: "Idle",
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            body: TabBarView(children: [
                              buildTabView(context),
                              buildTabView2(context),
                              buildTabView3(context),
                              // buildTabView(context),
                            ]),
                          ),
                        ),
                      ),
                      //TabBar/
                    ],
                  ),
                ),
              ])
            ])));
  }

  Widget buildTabView(BuildContext context) {
    return SingleChildScrollView(
      // height: _height * 60,
      child: Column(
        children: [
          buildContainer(context),
          Divider(
            color: Colors.blueGrey,
          ),
          buildContainer2(context),
          Divider(
            color: Colors.blueGrey,
          ),
          buildContainer3(context),
          Divider(
            color: Colors.blueGrey,
          ),
          buildContainer4(context),
          Divider(
            color: Colors.blueGrey,
          ),
          buildContainer5(context),
          Divider(
            color: Colors.blueGrey,
          ),
        ],
      ),
    );
  }

  Widget buildTabView2(BuildContext context) {
    return SingleChildScrollView(
      // height: _height * 60,
      child: Column(
        children: [
          buildContainer6(context),
          Divider(
            color: Colors.blueGrey,
          ),
          buildContainer2(context),
          Divider(
            color: Colors.blueGrey,
          ),
          buildContainer3(context),
          Divider(
            color: Colors.blueGrey,
          ),
          buildContainer4(context),
          Divider(
            color: Colors.blueGrey,
          ),
          // buildContainer5(context),
        ],
      ),
    );
  }

  Widget buildTabView3(BuildContext context) {
    return SingleChildScrollView(
      // height: _height * 60,
      child: Column(
        children: [
          buildContainer12(context),
          Divider(
            color: Colors.blueGrey,
          ),
          buildContainer2(context),
          Divider(
            color: Colors.blueGrey,
          ),
          buildContainer3(context),
          Divider(
            color: Colors.blueGrey,
          ),
          buildContainer4(context),
          Divider(
            color: Colors.blueGrey,
          ),
          buildContainer5(context),
          Divider(
            color: Colors.blueGrey,
          ),
        ],
      ),
    );
  }

  // Widget buildTabView2(BuildContext context) {
  //   return GestureDetector(
  //     onTap: () {
  //       Navigator.of(context).push(MaterialPageRoute(builder: (_) => CarMap()));
  //     },
  //     child: Container(
  //       width: MediaQuery.of(context).size.width - 10,
  //       decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(5),
  //         color: Colors.white,
  //       ),
  //       child: Row(
  //         children: <Widget>[
  //           Expanded(
  //             child: Column(
  //               children: <Widget>[
  //                 Container(
  //                   child: Column(
  //                     children: <Widget>[
  //                       Icon(
  //                         Icons.directions_car,
  //                         color: Colors.blue,
  //                         size: 36.0,
  //                       ),
  //                       SizedBox(
  //                         height: 15,
  //                       ),
  //                       Row(
  //                         mainAxisAlignment: MainAxisAlignment.spaceAround,
  //                         children: <Widget>[
  //                           Icon(
  //                             Icons.radio_button_checked,
  //                             color: Colors.red,
  //                             size: 15.0,
  //                           ),
  //                           Icon(
  //                             Icons.rowing,
  //                             color: Colors.red,
  //                             size: 15.0,
  //                           ),
  //                           Icon(
  //                             Icons.offline_bolt,
  //                             color: Colors.green,
  //                             size: 15.0,
  //                           ),
  //                           Icon(
  //                             Icons.pie_chart_outlined,
  //                             color: Colors.black,
  //                             size: 15.0,
  //                           ),
  //                         ],
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //           Container(
  //             height: 70,
  //             width: 1,
  //             color: Colors.grey,
  //           ),
  //           SizedBox(
  //             width: 5,
  //           ),
  //           Expanded(
  //             child: Padding(
  //               padding:
  //                   const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 5.0),
  //               child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 mainAxisAlignment: MainAxisAlignment.start,
  //                 children: <Widget>[
  //                   Text("UP 53 DT 9621"),
  //                   Text("2020-09-11 11:21:42 "),
  //                   Text("0.0 KM/HR"),
  //                   Text(
  //                     "Gorakhpur (UP), India",
  //                     style: TextStyle(color: Colors.black),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ),
  //           Expanded(
  //             child: Padding(
  //               padding:
  //                   const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0),
  //               child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: <Widget>[
  //                   Text(
  //                     "Stopped since",
  //                     style: TextStyle(color: Colors.red),
  //                   ),
  //                   Text(
  //                     "(0)days, 03:05:33",
  //                     style: TextStyle(color: Colors.red),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ),
  //           Expanded(
  //             child: Padding(
  //               padding:
  //                   const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0),
  //               child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 mainAxisAlignment: MainAxisAlignment.start,
  //                 children: <Widget>[
  //                   Text(
  //                     "2021-06-08",
  //                     style: TextStyle(color: Colors.grey),
  //                   ),
  //                   Text(
  //                     "Validity",
  //                     style: TextStyle(color: Colors.green),
  //                   ),
  //                   Text(
  //                     "0.0",
  //                     style: TextStyle(color: Colors.black),
  //                   ),
  //                   Text(
  //                     "Distance",
  //                     style: TextStyle(color: Colors.green),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  // Widget buildTabView3(BuildContext context) {
  //   return GestureDetector(
  //     onTap: () {
  //       Navigator.of(context).push(MaterialPageRoute(builder: (_) => CarMap()));
  //     },
  //     child: Container(
  //       width: MediaQuery.of(context).size.width - 10,
  //       decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(5),
  //         color: Colors.white,
  //       ),
  //       child: Row(
  //         children: <Widget>[
  //           Expanded(
  //             child: Column(
  //               children: <Widget>[
  //                 Container(
  //                   child: Column(
  //                     children: <Widget>[
  //                       Icon(
  //                         Icons.directions_car,
  //                         color: Colors.blue,
  //                         size: 36.0,
  //                       ),
  //                       SizedBox(
  //                         height: 15,
  //                       ),
  //                       Row(
  //                         mainAxisAlignment: MainAxisAlignment.spaceAround,
  //                         children: <Widget>[
  //                           Icon(
  //                             Icons.radio_button_checked,
  //                             color: Colors.red,
  //                             size: 15.0,
  //                           ),
  //                           Icon(
  //                             Icons.rowing,
  //                             color: Colors.red,
  //                             size: 15.0,
  //                           ),
  //                           Icon(
  //                             Icons.offline_bolt,
  //                             color: Colors.green,
  //                             size: 15.0,
  //                           ),
  //                           Icon(
  //                             Icons.pie_chart_outlined,
  //                             color: Colors.black,
  //                             size: 15.0,
  //                           ),
  //                         ],
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //           Container(
  //             height: 70,
  //             width: 1,
  //             color: Colors.grey,
  //           ),
  //           SizedBox(
  //             width: 5,
  //           ),
  //           Expanded(
  //             child: Padding(
  //               padding:
  //                   const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 5.0),
  //               child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 mainAxisAlignment: MainAxisAlignment.start,
  //                 children: <Widget>[
  //                   Text("UP 53 DT 9621"),
  //                   Text("2020-09-11 11:21:42 "),
  //                   Text("0.0 KM/HR"),
  //                   Text(
  //                     "Gorakhpur (UP), India",
  //                     style: TextStyle(color: Colors.black),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ),
  //           Expanded(
  //             child: Padding(
  //               padding:
  //                   const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0),
  //               child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: <Widget>[
  //                   Text(
  //                     "Stopped since",
  //                     style: TextStyle(color: Colors.red),
  //                   ),
  //                   Text(
  //                     "(0)days, 03:05:33",
  //                     style: TextStyle(color: Colors.red),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ),
  //           Expanded(
  //             child: Padding(
  //               padding:
  //                   const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0),
  //               child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 mainAxisAlignment: MainAxisAlignment.start,
  //                 children: <Widget>[
  //                   Text(
  //                     "2021-06-08",
  //                     style: TextStyle(color: Colors.grey),
  //                   ),
  //                   Text(
  //                     "Validity",
  //                     style: TextStyle(color: Colors.green),
  //                   ),
  //                   Text(
  //                     "0.0",
  //                     style: TextStyle(color: Colors.black),
  //                   ),
  //                   Text(
  //                     "Distance",
  //                     style: TextStyle(color: Colors.green),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Widget buildContainer(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => CarMap()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width - 10,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                children: <Widget>[
                  Container(
                    child: Column(
                      children: <Widget>[
                        Icon(
                          Icons.directions_car,
                          color: Colors.blue,
                          size: 36.0,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Icon(
                              Icons.radio_button_checked,
                              color: Colors.red,
                              size: 15.0,
                            ),
                            Icon(
                              Icons.rowing,
                              color: Colors.red,
                              size: 15.0,
                            ),
                            Icon(
                              Icons.offline_bolt,
                              color: Colors.green,
                              size: 15.0,
                            ),
                            Icon(
                              Icons.pie_chart_outlined,
                              color: Colors.black,
                              size: 15.0,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 70,
              width: 1,
              color: Colors.grey,
            ),
            SizedBox(
              width: 5,
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text("UP 53 DT 9621"),
                    Text("2020-09-11 11:21:42 "),
                    Text("0.0 KM/HR"),
                    Text(
                      "Gorakhpur (UP), India",
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Stopped since",
                      style: TextStyle(color: Colors.red),
                    ),
                    Text(
                      "(0)days, 03:05:33",
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "2021-06-08",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      "Validity",
                      style: TextStyle(color: Colors.green),
                    ),
                    Text(
                      "0.0",
                      style: TextStyle(color: Colors.black),
                    ),
                    Text(
                      "Distance",
                      style: TextStyle(color: Colors.green),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildContainer2(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => CarMap()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width - 10,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                children: <Widget>[
                  Container(
                    child: Column(
                      children: <Widget>[
                        Icon(
                          Icons.directions_car,
                          color: Colors.blue,
                          size: 36.0,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Icon(
                              Icons.radio_button_checked,
                              color: Colors.red,
                              size: 15.0,
                            ),
                            Icon(
                              Icons.rowing,
                              color: Colors.red,
                              size: 15.0,
                            ),
                            Icon(
                              Icons.offline_bolt,
                              color: Colors.green,
                              size: 15.0,
                            ),
                            Icon(
                              Icons.pie_chart_outlined,
                              color: Colors.black,
                              size: 15.0,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 70,
              width: 1,
              color: Colors.grey,
            ),
            SizedBox(
              width: 5,
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text("HR 52 DT 5825"),
                    Text("2020-09-11 11:21:42 "),
                    Text("0.0 KM/HR"),
                    Text(
                      "Gurugram (HR), India",
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Stopped since",
                      style: TextStyle(color: Colors.red),
                    ),
                    Text(
                      "(0)days, 03:05:33",
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "2021-06-08",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      "Validity",
                      style: TextStyle(color: Colors.green),
                    ),
                    Text(
                      "0.0",
                      style: TextStyle(color: Colors.black),
                    ),
                    Text(
                      "Distance",
                      style: TextStyle(color: Colors.green),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildContainer3(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => CarMap()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width - 10,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                children: <Widget>[
                  Container(
                    child: Column(
                      children: <Widget>[
                        Icon(
                          Icons.directions_car,
                          color: Colors.blue,
                          size: 36.0,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Icon(
                              Icons.radio_button_checked,
                              color: Colors.red,
                              size: 15.0,
                            ),
                            Icon(
                              Icons.rowing,
                              color: Colors.red,
                              size: 15.0,
                            ),
                            Icon(
                              Icons.offline_bolt,
                              color: Colors.green,
                              size: 15.0,
                            ),
                            Icon(
                              Icons.pie_chart_outlined,
                              color: Colors.black,
                              size: 15.0,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 70,
              width: 1,
              color: Colors.grey,
            ),
            SizedBox(
              width: 5,
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text("HR 52 DT 5825"),
                    Text("2020-09-11 11:21:42 "),
                    Text("0.0 KM/HR"),
                    Text(
                      "Gurugram (HR), India",
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Stopped since",
                      style: TextStyle(color: Colors.red),
                    ),
                    Text(
                      "(0)days, 03:05:33",
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "2021-06-08",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      "Validity",
                      style: TextStyle(color: Colors.green),
                    ),
                    Text(
                      "0.0",
                      style: TextStyle(color: Colors.black),
                    ),
                    Text(
                      "Distance",
                      style: TextStyle(color: Colors.green),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildContainer4(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => CarMap()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width - 10,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                children: <Widget>[
                  Container(
                    child: Column(
                      children: <Widget>[
                        Icon(
                          Icons.directions_car,
                          color: Colors.blue,
                          size: 36.0,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Icon(
                              Icons.radio_button_checked,
                              color: Colors.red,
                              size: 15.0,
                            ),
                            Icon(
                              Icons.rowing,
                              color: Colors.red,
                              size: 15.0,
                            ),
                            Icon(
                              Icons.offline_bolt,
                              color: Colors.green,
                              size: 15.0,
                            ),
                            Icon(
                              Icons.pie_chart_outlined,
                              color: Colors.black,
                              size: 15.0,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 70,
              width: 1,
              color: Colors.grey,
            ),
            SizedBox(
              width: 5,
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text("HR 52 DT 5825"),
                    Text("2020-09-11 11:21:42 "),
                    Text("0.0 KM/HR"),
                    Text(
                      "Gurugram (HR), India",
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Stopped since",
                      style: TextStyle(color: Colors.red),
                    ),
                    Text(
                      "(0)days, 03:05:33",
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "2021-06-08",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      "Validity",
                      style: TextStyle(color: Colors.green),
                    ),
                    Text(
                      "0.0",
                      style: TextStyle(color: Colors.black),
                    ),
                    Text(
                      "Distance",
                      style: TextStyle(color: Colors.green),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildContainer5(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => CarMap()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width - 10,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                children: <Widget>[
                  Container(
                    child: Column(
                      children: <Widget>[
                        Icon(
                          Icons.directions_car,
                          color: Colors.blue,
                          size: 36.0,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Icon(
                              Icons.radio_button_checked,
                              color: Colors.red,
                              size: 15.0,
                            ),
                            Icon(
                              Icons.rowing,
                              color: Colors.red,
                              size: 15.0,
                            ),
                            Icon(
                              Icons.offline_bolt,
                              color: Colors.green,
                              size: 15.0,
                            ),
                            Icon(
                              Icons.pie_chart_outlined,
                              color: Colors.black,
                              size: 15.0,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 70,
              width: 1,
              color: Colors.grey,
            ),
            SizedBox(
              width: 5,
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text("HR 52 DT 5825"),
                    Text("2020-09-11 11:21:42 "),
                    Text("0.0 KM/HR"),
                    Text(
                      "Gurugram (HR), India",
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Stopped since",
                      style: TextStyle(color: Colors.red),
                    ),
                    Text(
                      "(0)days, 03:05:33",
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "2021-06-08",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      "Validity",
                      style: TextStyle(color: Colors.green),
                    ),
                    Text(
                      "0.0",
                      style: TextStyle(color: Colors.black),
                    ),
                    Text(
                      "Distance",
                      style: TextStyle(color: Colors.green),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildContainer6(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => CarMap()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width - 10,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                children: <Widget>[
                  Container(
                    child: Column(
                      children: <Widget>[
                        Icon(
                          Icons.directions_car,
                          color: Colors.blue,
                          size: 36.0,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Icon(
                              Icons.radio_button_checked,
                              color: Colors.red,
                              size: 15.0,
                            ),
                            Icon(
                              Icons.rowing,
                              color: Colors.red,
                              size: 15.0,
                            ),
                            Icon(
                              Icons.offline_bolt,
                              color: Colors.green,
                              size: 15.0,
                            ),
                            Icon(
                              Icons.pie_chart_outlined,
                              color: Colors.black,
                              size: 15.0,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 70,
              width: 1,
              color: Colors.grey,
            ),
            SizedBox(
              width: 5,
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text("HR 52 DT 5825"),
                    Text("2020-09-11 11:21:42 "),
                    Text("0.0 KM/HR"),
                    Text(
                      "Gurugram (HR), India",
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Stopped since",
                      style: TextStyle(color: Colors.red),
                    ),
                    Text(
                      "(0)days, 03:05:33",
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "2021-06-08",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      "Validity",
                      style: TextStyle(color: Colors.green),
                    ),
                    Text(
                      "0.0",
                      style: TextStyle(color: Colors.black),
                    ),
                    Text(
                      "Distance",
                      style: TextStyle(color: Colors.green),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildContainer7(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => CarMap()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width - 10,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                children: <Widget>[
                  Container(
                    child: Column(
                      children: <Widget>[
                        Icon(
                          Icons.directions_car,
                          color: Colors.blue,
                          size: 36.0,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Icon(
                              Icons.radio_button_checked,
                              color: Colors.red,
                              size: 15.0,
                            ),
                            Icon(
                              Icons.rowing,
                              color: Colors.red,
                              size: 15.0,
                            ),
                            Icon(
                              Icons.offline_bolt,
                              color: Colors.green,
                              size: 15.0,
                            ),
                            Icon(
                              Icons.pie_chart_outlined,
                              color: Colors.black,
                              size: 15.0,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 70,
              width: 1,
              color: Colors.grey,
            ),
            SizedBox(
              width: 5,
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text("HR 52 DT 5825"),
                    Text("2020-09-11 11:21:42 "),
                    Text("0.0 KM/HR"),
                    Text(
                      "Gurugram (HR), India",
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Stopped since",
                      style: TextStyle(color: Colors.red),
                    ),
                    Text(
                      "(0)days, 03:05:33",
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "2021-06-08",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      "Validity",
                      style: TextStyle(color: Colors.green),
                    ),
                    Text(
                      "0.0",
                      style: TextStyle(color: Colors.black),
                    ),
                    Text(
                      "Distance",
                      style: TextStyle(color: Colors.green),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildContainer8(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => CarMap()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width - 10,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                children: <Widget>[
                  Container(
                    child: Column(
                      children: <Widget>[
                        Icon(
                          Icons.directions_car,
                          color: Colors.blue,
                          size: 36.0,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Icon(
                              Icons.radio_button_checked,
                              color: Colors.red,
                              size: 15.0,
                            ),
                            Icon(
                              Icons.rowing,
                              color: Colors.red,
                              size: 15.0,
                            ),
                            Icon(
                              Icons.offline_bolt,
                              color: Colors.green,
                              size: 15.0,
                            ),
                            Icon(
                              Icons.pie_chart_outlined,
                              color: Colors.black,
                              size: 15.0,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 70,
              width: 1,
              color: Colors.grey,
            ),
            SizedBox(
              width: 5,
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text("HR 52 DT 5825"),
                    Text("2020-09-11 11:21:42 "),
                    Text("0.0 KM/HR"),
                    Text(
                      "Gurugram (HR), India",
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Stopped since",
                      style: TextStyle(color: Colors.red),
                    ),
                    Text(
                      "(0)days, 03:05:33",
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "2021-06-08",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      "Validity",
                      style: TextStyle(color: Colors.green),
                    ),
                    Text(
                      "0.0",
                      style: TextStyle(color: Colors.black),
                    ),
                    Text(
                      "Distance",
                      style: TextStyle(color: Colors.green),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildContainer9(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => CarMap()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width - 10,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                children: <Widget>[
                  Container(
                    child: Column(
                      children: <Widget>[
                        Icon(
                          Icons.directions_car,
                          color: Colors.blue,
                          size: 36.0,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Icon(
                              Icons.radio_button_checked,
                              color: Colors.red,
                              size: 15.0,
                            ),
                            Icon(
                              Icons.rowing,
                              color: Colors.red,
                              size: 15.0,
                            ),
                            Icon(
                              Icons.offline_bolt,
                              color: Colors.green,
                              size: 15.0,
                            ),
                            Icon(
                              Icons.pie_chart_outlined,
                              color: Colors.black,
                              size: 15.0,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 70,
              width: 1,
              color: Colors.grey,
            ),
            SizedBox(
              width: 5,
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text("HR 52 DT 5825"),
                    Text("2021--11 11:21:42 "),
                    Text("0.0 KM/HR"),
                    Text(
                      "Gurugram (HR), India",
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Stopped since",
                      style: TextStyle(color: Colors.red),
                    ),
                    Text(
                      "(0)days, 03:05:33",
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "2021-06-08",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      "Validity",
                      style: TextStyle(color: Colors.green),
                    ),
                    Text(
                      "0.0",
                      style: TextStyle(color: Colors.black),
                    ),
                    Text(
                      "Distance",
                      style: TextStyle(color: Colors.green),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildContainer10(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => CarMap()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width - 10,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                children: <Widget>[
                  Container(
                    child: Column(
                      children: <Widget>[
                        Icon(
                          Icons.directions_car,
                          color: Colors.blue,
                          size: 36.0,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Icon(
                              Icons.radio_button_checked,
                              color: Colors.red,
                              size: 15.0,
                            ),
                            Icon(
                              Icons.rowing,
                              color: Colors.red,
                              size: 15.0,
                            ),
                            Icon(
                              Icons.offline_bolt,
                              color: Colors.green,
                              size: 15.0,
                            ),
                            Icon(
                              Icons.pie_chart_outlined,
                              color: Colors.black,
                              size: 15.0,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 70,
              width: 1,
              color: Colors.grey,
            ),
            SizedBox(
              width: 5,
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text("HR 52 DT 5825"),
                    Text("2021-04-17 11:21:42 "),
                    Text("0.0 KM/HR"),
                    Text(
                      "Gurugram (HR), India",
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Stopped since",
                      style: TextStyle(color: Colors.red),
                    ),
                    Text(
                      "(0)days, 03:05:33",
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "2021-06-08",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      "Validity",
                      style: TextStyle(color: Colors.green),
                    ),
                    Text(
                      "0.0",
                      style: TextStyle(color: Colors.black),
                    ),
                    Text(
                      "Distance",
                      style: TextStyle(color: Colors.green),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildContainer11(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => CarMap()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width - 10,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                children: <Widget>[
                  Container(
                    child: Column(
                      children: <Widget>[
                        Icon(
                          Icons.directions_car,
                          color: Colors.blue,
                          size: 36.0,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Icon(
                              Icons.radio_button_checked,
                              color: Colors.red,
                              size: 15.0,
                            ),
                            Icon(
                              Icons.rowing,
                              color: Colors.red,
                              size: 15.0,
                            ),
                            Icon(
                              Icons.offline_bolt,
                              color: Colors.green,
                              size: 15.0,
                            ),
                            Icon(
                              Icons.pie_chart_outlined,
                              color: Colors.black,
                              size: 15.0,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 70,
              width: 1,
              color: Colors.grey,
            ),
            SizedBox(
              width: 5,
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text("HR 52 DT 5825"),
                    Text("2021-04-04 11:21:42 "),
                    Text("0.0 KM/HR"),
                    Text(
                      "Gurugram (HR), India",
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Stopped since",
                      style: TextStyle(color: Colors.red),
                    ),
                    Text(
                      "(0)days, 03:05:33",
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "2021-06-08",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      "Validity",
                      style: TextStyle(color: Colors.green),
                    ),
                    Text(
                      "0.0",
                      style: TextStyle(color: Colors.black),
                    ),
                    Text(
                      "Distance",
                      style: TextStyle(color: Colors.green),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildContainer12(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (_) => CarMap()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width - 10,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        ),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Column(
                children: <Widget>[
                  Container(
                    child: Column(
                      children: <Widget>[
                        Icon(
                          Icons.directions_car,
                          color: Colors.blue,
                          size: 36.0,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Icon(
                              Icons.radio_button_checked,
                              color: Colors.red,
                              size: 15.0,
                            ),
                            Icon(
                              Icons.rowing,
                              color: Colors.red,
                              size: 15.0,
                            ),
                            Icon(
                              Icons.offline_bolt,
                              color: Colors.green,
                              size: 15.0,
                            ),
                            Icon(
                              Icons.pie_chart_outlined,
                              color: Colors.black,
                              size: 15.0,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 70,
              width: 1,
              color: Colors.grey,
            ),
            SizedBox(
              width: 5,
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text("HR 52 DT 5825"),
                    Text("2021-04-11 11:21:42 "),
                    Text("0.0 KM/HR"),
                    Text(
                      "Gurugram (HR), India",
                      style: TextStyle(color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Stopped since",
                      style: TextStyle(color: Colors.red),
                    ),
                    Text(
                      "(0)days, 03:05:33",
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "2021-06-08",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      "Validity",
                      style: TextStyle(color: Colors.green),
                    ),
                    Text(
                      "0.0",
                      style: TextStyle(color: Colors.black),
                    ),
                    Text(
                      "Distance",
                      style: TextStyle(color: Colors.green),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
