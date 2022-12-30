import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:practisepakages/userdetailscreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageSate();
}

class _HomePageSate extends State<HomePage> {
  var myList = [];
  String url = "https://randomuser.me/api/?results=50";
  Future<void> getRandomUsers() async {
    var response = await http.get(Uri.parse(url));
    setState(() {
      //Decode response body
      var decodedJson = json.decode(response.body)['results'];

      myList = decodedJson;
    });
  }

  @override
  void initState() {
    super.initState();
    getRandomUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: ListView.builder(
          itemCount: myList.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => UserDetailsScreen(
                          gender: myList[index]['gender'],
                          title: myList[index]['name']['title'],
                          first: myList[index]['name']['first'],
                          last: myList[index]['name']['last'],
                          email: myList[index]['email'],
                          picture: myList[index]['picture']['thumbnail'],
                          username: myList[index]['login']['username'],
                          phone: myList[index]['phone'],
                          cell: myList[index]['cell'],
                          dob: myList[index]['dob']['age'],
                        )),
                  ),
                );
              },
              child: Card(
                color: Colors.white,
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                child: ListTile(
                  leading: ConstrainedBox(
                    constraints: const BoxConstraints(
                      minWidth: 44,
                      minHeight: 44,
                      maxWidth: 64,
                      maxHeight: 64,
                    ),
                    child: Image.network(
                      myList[index]['picture']['thumbnail'],
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(
                    myList[index]['name']['title'] +
                        " " +
                        myList[index]['name']['first'] +
                        " " +
                        myList[index]['name']['last'],
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  subtitle: Text(
                    myList[index]['email'],
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black45,
                    ),
                  ),
                  trailing: myList[index]['gender'] == 'female'
                      ? const Icon(
                          Icons.female_outlined,
                          color: Colors.green,
                        )
                      : const Icon(
                          Icons.male,
                          color: Colors.blue,
                        ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
