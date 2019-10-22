import 'package:flutter/material.dart';
import 'package:powerpack/powerpack.dart';

import 'plugins/desktop/desktop.dart';

void main() {
  setTargetPlatformForDesktop();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        accentColor: Colors.red,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plugin example app').onPressed(
          onTap: () => print('AppBar Tapped!'),
        ),
      ),
      drawer: Drawer(
        child: SafeArea(
            child: Container(
          child: Column(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
              ),
              ListTile(
                leading: Icon(Icons.search),
                title: Text('Search'),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
              ),
            ],
          ),
        ).asScrollable),
      ),
      endDrawer: Drawer(
        child: SafeArea(
            child: Container(
          child: Column(
            children: <Widget>[
              SwitchListTile.adaptive(
                title: Text('Dark Mode'),
                value: true,
                onChanged: (val) {},
              ),
            ],
          ),
        ).asScrollable),
      ),
      body: Center(
        child: Text('Demo'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).accentColor,
        child: Icon(Icons.info),
        onPressed: () {},
      ),
    ).asResponsive();
  }
}
