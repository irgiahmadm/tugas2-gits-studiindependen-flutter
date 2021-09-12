import 'package:flutter/material.dart';
import '../screens/register/Register.dart';

class ContentDialogRegister extends StatefulWidget {
  final String email;
  final String password;
  final String username;
  final Gender gender;
  final bool isDeveloper;

  const ContentDialogRegister({
    Key? key,
    required this.email,
    required this.password,
    required this.username,
    required this.gender,
    required this.isDeveloper,
  }) : super(key: key);

  @override
  _ContentDialogRegisterState createState() => _ContentDialogRegisterState();
}

class _ContentDialogRegisterState extends State<ContentDialogRegister> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 8),
            child: Align(
              alignment: Alignment.centerLeft,
              child:
                  Text('Email', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(widget.email),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text('Username',
                  style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(widget.username),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8),
            child: Align(
              alignment: Alignment.centerLeft,
              child:
                  Text('Gender', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(widget.gender.toString().split('.').last),
          ),
          if (widget.isDeveloper) ...[
            Padding(
              padding: EdgeInsets.only(top: 8),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text('I Am Developer',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
          ]
        ],
      ),
    );
  }
}
