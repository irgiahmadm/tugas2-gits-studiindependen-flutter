import 'package:first_flutter/utils/list_item.dart';
import 'package:flutter/material.dart';
import '../../utils/list_item.dart';
import '../../model/user.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  List<User> listUserFollowing = [
    User('Amau', 'Empty State', 'empty state.png'),
    User('Prikiduu', 'Ecommerce App', 'ecommerce app.png')
  ];

  List<User> listUserRecommendation = [
    User('Prikiduu', 'Ecommerce App', 'ecommerce app.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
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
        body: TabBarView(
          children: <Widget>[
            ListItem(list: listUserFollowing),
            ListItem(list: listUserRecommendation),
          ],
        ),
      ),
    );
  }
}
