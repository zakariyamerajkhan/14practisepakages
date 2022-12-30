import 'package:flutter/material.dart';

class UserDetailsScreen extends StatefulWidget {
  const UserDetailsScreen({
    Key? key,
    required this.gender,
    required this.title,
    required this.first,
    required this.last,
    required this.email,
    required this.picture,
    required this.username,
    required this.phone,
    required this.cell,
    required this.dob,
  }) : super(key: key);

  final String gender,
      title,
      first,
      last,
      email,
      picture,
      username,
      phone,
      cell;
  final int dob;

  @override
  State<UserDetailsScreen> createState() => _UserDetailsScreenState();
}

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  @override
  void initState() {
    super.initState();
    print(
        'I am in user detail scrren and I have following data comming from previous screen\n\n');
    print(widget.gender);
    print(widget.title + " " + widget.first + " " + widget.last);
    print(widget.picture);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage: NetworkImage(widget.picture),
        ),
        Text(
          widget.username,
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        ListTile(
          leading: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: 40,
              maxWidth: 40,
            ),
            child: Card(
              elevation: 8,
              child: Text(
                widget.email,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
          ),
        ),
        ListTile(
          leading: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: 40,
              maxWidth: 40,
            ),
            child: Card(
              elevation: 8,
              child: Text(
                widget.phone,
              ),
            ),
          ),
        ),
        ListTile(
          leading: ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: 40,
              maxWidth: 40,
            ),
            child: Card(
              elevation: 8,
              child: Text(widget.cell),
            ),
          ),
        ),
        Card(
          elevation: 8,
          child: ListTile(
            title: Text(
              'Email',
            ),
            subtitle: Text(widget.email),
          ),
        ),
      ],
    ));
  }
}
