import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(padding: EdgeInsets.all(0.0), children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('Roberto Aleydon'),
            accountEmail: Text('aleydon@gmail.com'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: ExactAssetImage('assets/images/logo.png'),
            ),
            otherAccountsPictures: <Widget>[
              CircleAvatar(
                child: Text('R'),
              ),
            ],
            onDetailsPressed: () {},
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/logo.png'),
                    fit: BoxFit.cover)),
          ),
          ListTile(
            title: Text('myProfile'),
            leading: Icon(Icons.person),
            onLongPress: () {},
          ),
          Divider(),
          ListTile(
            title: Text('New Group'),
            leading: Icon(Icons.group_add),
          ),
          ListTile(
            title: Text('New Chat'),
            leading: Icon(Icons.chat),
            onLongPress: () {},
          ),
          ListTile(
            title: Text('Calls'),
            leading: Icon(Icons.call),
            onLongPress: () {},
          ),
          Divider(),
          ListTile(
            title: Text('Settings'),
            leading: Icon(Icons.settings),
            onLongPress: () {},
          ),
          Divider(),
          ListTile(
            title: Text('Support'),
            leading: Icon(Icons.report_problem),
            onLongPress: () {},
          ),
          ListTile(
              title: Text('Close'),
              leading: Icon(Icons.close),
              onTap: () {
                Navigator.of(context).pop();
              }),
        ]),
      ),
    );
  }
}
