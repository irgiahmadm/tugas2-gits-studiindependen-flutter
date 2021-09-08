import 'package:first_flutter/utils/ListItem.dart';
import 'package:flutter/material.dart';
import '../../utils/ListItem.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: AppBar(
                bottom: const TabBar(
                  tabs: [
                    Tab(text: 'Following'),
                    Tab(text: 'For You'),
                  ],
                ),
                title: const Text('Beome'),
              ),
              body: const TabBarView(
                children: <Widget>[
                  ListItem(),
                  Center(child: Text('No data found.')),
                ],
              ),
            )
      )
    );
  }
}
