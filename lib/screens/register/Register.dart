import 'package:first_flutter/widget/content_dialog_register.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);
  @override
  _RegisterState createState() => _RegisterState();
}

enum Gender { male, female }

class _RegisterState extends State<Register> {
  DateTime _selectedDate = DateTime.now();
  final _formKey = GlobalKey<FormState>();
  final _username = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _birthdate = TextEditingController();
  Gender? _gender = Gender.male;
  bool _isDeveloper = false;

  @override
  void dispose() {
    _username.dispose();
    _email.dispose();
    _password.dispose();
    _birthdate.dispose();
    super.dispose();
  }

  _selectDate(BuildContext context) async {
    int yearNow = DateTime.parse(DateTime.now().toString()).year;
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1800),
      lastDate: DateTime((yearNow + 5)),
    );
    if (pickedDate != null && pickedDate != _selectedDate)
      setState(() {
        _selectedDate = pickedDate;
        _birthdate.text = DateFormat('yyyy-MM-dd').format(_selectedDate);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                //Input Email
                Padding(
                  padding: EdgeInsets.all(16),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _email,
                    decoration: new InputDecoration(
                      hintText: 'example@mail.com',
                      labelText: 'Email',
                      icon: Icon(Icons.email),
                      border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(5.0)),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Email can not be empty';
                      }
                      return null;
                    },
                  ),
                ),
                //Input password
                Padding(
                  padding: EdgeInsets.all(16),
                  child: TextFormField(
                    obscureText: true,
                    obscuringCharacter: '*',
                    controller: _password,
                    decoration: new InputDecoration(
                      hintText: '******',
                      labelText: 'Password',
                      icon: Icon(Icons.password),
                      border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(5.0)),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Birthdate can not be empty';
                      }
                      return null;
                    },
                  ),
                ),
                //Input username
                Padding(
                  padding: EdgeInsets.all(16),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _username,
                    maxLength: 24,
                    decoration: new InputDecoration(
                      hintText: 'ex: johndoe',
                      labelText: 'Username',
                      icon: Icon(Icons.people),
                      border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(5.0)),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Username can not be empty';
                      }
                      return null;
                    },
                  ),
                ),
                //birthdate
                Padding(
                  padding: EdgeInsets.all(16),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _birthdate,
                    decoration: new InputDecoration(
                      labelText: 'Pick birthdate',
                      icon: Icon(Icons.calendar_today),
                      border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(5.0)),
                    ),
                    readOnly: true,
                    onTap: () {
                      _selectDate(context);
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Birthdate can not be empty';
                      }
                      return null;
                    },
                  ),
                ),
                Center(
                  child: Column(
                    children: <Widget>[
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.only(left: 16),
                            child: Text('Gender',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          )),
                      ListTile(
                        title: const Text('Male'),
                        leading: Radio<Gender>(
                          value: Gender.male,
                          groupValue: _gender,
                          onChanged: (Gender? value) {
                            setState(() {
                              _gender = value;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: const Text('Female'),
                        leading: Radio<Gender>(
                          value: Gender.female,
                          groupValue: _gender,
                          onChanged: (Gender? value) {
                            setState(() {
                              _gender = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Are You a Developer?',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      Row(
                        children: <Widget>[
                          Checkbox(
                            value: _isDeveloper,
                            onChanged: (value) {
                              setState(() {
                                _isDeveloper = value!;
                              });
                            },
                          ),
                          Text('I am Developer')
                        ],
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      AlertDialog alertDialog = new AlertDialog(
                        title: Text('Register Confirmation'),
                        content: ContentDialogRegister(
                            email: _email.text,
                            password: _password.text,
                            username: _username.text,
                            birthdate: _birthdate.text,
                            gender: _gender!,
                            isDeveloper: _isDeveloper),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'Cancel'),
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'OK'),
                            child: const Text('OK'),
                          ),
                        ],
                      );
                      if (_formKey.currentState!.validate()) {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return alertDialog;
                            });
                      }
                    },
                    child: Text('Register'))
              ],
            ),
          )),
    );
  }
}
