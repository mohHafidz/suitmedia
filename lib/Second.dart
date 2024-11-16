import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_suitmedia/Home.dart';
import 'package:test_suitmedia/Third.dart';

class Second extends StatefulWidget {
  Second({Key? key}) : super(key: key);

  @override
  State<Second> createState() => _SecondState();
}

class _SecondState extends State<Second> {
  Future<String?> getData() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('username');
  }

  String userName = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appbar(context, "Second Screen"),
        body: FutureBuilder<String?>(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return Center(
                child: Text(
                  "Error loading data",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.red,
                  ),
                ),
              );
            }

            final savedUserName = snapshot.data ?? "Guest";

            return Container(
              padding: EdgeInsets.symmetric(horizontal: 21, vertical: 13),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          fontFamily: "Poppins",
                        ),
                      ),
                      Text(
                        savedUserName,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Poppins",
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      userName.isNotEmpty ? userName : "Selected User Name",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 32),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: SizedBox(
                        height: 41,
                        width: 310,
                        child: ElevatedButton(
                          onPressed: () async {
                            final result = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Third(),
                              ),
                            );

                            if (result != null && result is String) {
                              setState(() {
                                userName = result;
                              });
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF2B637B),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                          child: Text(
                            "Choose a User",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}
