import '../model/user.dart';
import 'package:flutter/material.dart';

class ListItem extends StatefulWidget {
  final List<User> list;
  ListItem({Key? key, required this.list}) : super(key: key);
  @override
  _ListItemState createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
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
                  child:
                      Image.asset('assets/images/${widget.list[index].image}'),
                ),
              ),
              Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      '${widget.list[index].title}',
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
                        Text('${widget.list[index].username}',
                            style: TextStyle(fontSize: 16)),
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
        itemCount: widget.list.length,
      ),
    );
  }
}
