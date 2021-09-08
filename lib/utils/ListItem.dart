import 'package:flutter/material.dart';

class ListItem extends StatefulWidget {
  const ListItem({Key? key}) : super(key: key);

  @override
  _ListItemState createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  final List<String> username = ['Amau', 'Prikiduu', 'Prikiduu'];
  final List<String> title = ['Empty State', 'Ecommerce App', 'OnBoarding'];
  final List<String> images = [
    'empty state.png',
    'ecommerce app.png',
    'ecommerce app.png'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemBuilder: (BuildContext context, int index) => Card(
          elevation: 3.0,
          child: Column(
            children: <Widget>[
              Container(
                child: AspectRatio(
                  aspectRatio: 1 / 1,
                  child: Image.asset('assets/images/${images[index]}'),
                ),
              ),
              Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '${title[index]}',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                  margin: EdgeInsets.all(8)),
              Container(
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [
                        Text('${username[index]}', style: TextStyle(fontSize: 16)),
                      ],
                    )),
                margin: EdgeInsets.only(
                  left: 8.0,
                  bottom: 8.0,
                ),
              )
            ],
          ),
        ),
        separatorBuilder: (BuildContext context, int) => const Divider(),
        itemCount: username.length,
      ),
    );
  }
}
