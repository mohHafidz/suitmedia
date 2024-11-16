import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test_suitmedia/Home.dart';
import 'package:test_suitmedia/Second.dart';

class Third extends StatefulWidget {
  const Third({super.key});

  @override
  State<Third> createState() => _ThirdState();
}

class _ThirdState extends State<Third> {
  List<User> users = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final url = 'https://reqres.in/api/users?page=1&per_page=0';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final data = jsonData['data'] as List;
      setState(() {
        users = data.map((userJson) => User.fromJson(userJson)).toList();
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appbar(context, "Third Screen"),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: RefreshIndicator(
            onRefresh: fetchData,
            child: users.isEmpty
                ? const Center(
                    child: Text(
                      "No Data",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                : ListView.builder(
                    itemCount: users.length,
                    itemBuilder: (context, index) {
                      final user = users[index];
                      return item(user, context);
                    },
                  ),
          ),
        ),
        backgroundColor: Colors.white,
      ),
    );
  }

  Widget item(User user, BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context, user.firstName + " " + user.lastName);
      },
      child: Container(
        width: 335,
        height: 80,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Color(0xFFE2E3E4),
              width: 0.5,
            ),
          ),
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 18, top: 15, bottom: 15),
              child: ClipOval(
                child: Image.network(
                  user.avatar,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, top: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${user.firstName} ${user.lastName}',
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    user.email,
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class User {
  final String firstName;
  final String lastName;
  final String email;
  final String avatar;

  User({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.avatar,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      avatar: json['avatar'],
    );
  }
}
