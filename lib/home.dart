import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatelessWidget {
  Drawer _buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('BoardVille'),
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
          ),
          ListTile(
              title: Text('Item 1'),
              onTap: () {
                Navigator.pop(context);
              }),
          ListTile(
            title: Text('Item 2'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildHomeWidget(BuildContext context) {
    String formattedDate = DateFormat("kk:mm, d MMM y").format(DateTime.now());
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(vertical: 72.0),
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0)),
            margin: EdgeInsets.all(12.0),
            child: Image.asset('assets/images/card_boardgame_scythe.jpg'),
          ),
        ),
        Text('Your Balance as of $formattedDate'),
        StreamBuilder(
          stream: Firestore.instance.document('member/BV001').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Text('Loading...');
            } else {
              return Text(
                snapshot.data['points'].toString(),
                style: TextStyle(fontSize: 48.0),
              );
            }
          },
        ),
        Expanded(
          child: Container(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            InkWell(
              onTap: () {},
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(20.0),
                color: Theme.of(context).primaryColor,
                child: Center(
                  child: Text(
                    'Pay',
                    style: Theme.of(context).textTheme.headline,
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Card',
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.fullscreen),
            onPressed: () {},
          ),
        ],
        centerTitle: true,
      ),
      drawer: _buildDrawer(context),
      body: _buildHomeWidget(context),
    );
  }
}
