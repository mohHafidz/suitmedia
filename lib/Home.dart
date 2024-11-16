import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_suitmedia/Second.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final TextEditingController Username = TextEditingController();
  final TextEditingController palindrom = TextEditingController();

  bool isPalindrome(String str) {
    String cleanStr = str.replaceAll(RegExp(r'[^a-zA-Z0-9]'), '').toLowerCase();

    String reversedStr = cleanStr.split('').reversed.join();
    return cleanStr == reversedStr;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://s3-alpha-sig.figma.com/img/e175/1e90/5ea2a92c2d7771c7921246067122c2e9?Expires=1732492800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=LhblvIgihLlvMxo73WSR2JE3w6mU6uiBEsfA5lMo4VPwEfWfBV6u1bLYkdkdU83Im~DA-f3Ilmjh9d1tOT37HYpR-XwN9sbkhOQ5BuS5f--8Zj~wL0wlEo6dGmUHBXD2SzWwOBbvG8hSb~GsLfmYGGQLrb5umHI1fhIw3OAgjJwyzFEm5niWhWcnadDVNoear7dKHrHHNGBsh8CyJl~8isPffA4T2Pya-93XkknK8fRLlpzWEL9Qk~RmvSCvER-vt6mRUFC66uvWFHxT8Vvno3d33yqd9WNXL5aAesaYApTkAnY9TuLJCXS9ZSYdqoFgFCYbZ63qQ~JMoCnKpMNuIA__',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      SizedBox(
                        width: 116,
                        height: 116,
                        child: Image.network(
                          'https://s3-alpha-sig.figma.com/img/81bc/a985/32f7c87c9837957ea28a7fca1c27c7ab?Expires=1732492800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=CdmLylJvfNSBpwFavKKaB4LNTbdxZewWRRu5~7cbs8M5ZLSL8-02KZ7UQUUMVI5FG3LaVaTj1ZG59Pe6bDsDS61Kh1AylPUxcgTve-ZzR0AFigwG-PdyH62Ayeu3ddZQr9c7IbopYvaEDbfeJ0zfJdLid6BLn5qOONX5g7kbHtb35uPxWfeHI9YNFCqeb89xkpMe0c91YyBMv4FNUhMpLRa5B88Ofkbq59igBE4yR06oWvwPAund0jrObyNhNdDY4lYZkFfDQE8zdfIb1IIbEr2Hf7OEK6lpFhIo3Sa326l2FcapVXqSuHl0ADMYHAtxvlKmt8VwDUZG50k-NpiQiw__',
                        ),
                      ),
                      SizedBox(
                        height: 51,
                      ),
                      TextField(
                        controller: Username,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Name',
                          hintStyle: TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 20.0),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextField(
                        controller: palindrom,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Palindrome',
                          hintStyle: TextStyle(color: Colors.grey),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 20.0),
                        ),
                      ),
                      SizedBox(
                        height: 45,
                      ),
                      SizedBox(
                        height: 41,
                        width: 310,
                        child: ElevatedButton(
                          onPressed: () {
                            if (isPalindrome(palindrom.text)) {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text('Palindrom'),
                                    content: Text('isPalindrome'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('OK'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            } else {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text('Palindrom'),
                                    content: Text('not   palindrome'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('OK'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xF2B637B),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                          child: Text(
                            "Check",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 21,
                      ),
                      SizedBox(
                        height: 41,
                        width: 310,
                        child: ElevatedButton(
                          onPressed: () async {
                            if (Username.text.isEmpty) {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text('Input Required'),
                                    content:
                                        Text('Please enter your username.'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('OK'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            } else {
                              final prefs =
                                  await SharedPreferences.getInstance();
                              await prefs
                                  .setString('username', Username.text)
                                  .then((_) {
                                print('Username saved! Navigating...');
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Second(),
                                  ),
                                );
                              });
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xF2B637B),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                          child: Text(
                            "Next",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

PreferredSizeWidget appbar(BuildContext context, String title) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(60.0),
    child: Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            color: Color(0xFFE2E3E4),
            width: 1.0,
          ),
        ),
      ),
      child: AppBar(
        title: Text(
          title,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
    ),
  );
}
