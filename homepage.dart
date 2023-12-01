import 'package:flutter/material.dart';
import 'package:sanchez_hans/person.dart';
import 'package:sanchez_hans/signUp_page.dart';

class HomePage extends StatefulWidget {
  Person? person;

  HomePage({super.key, this.person});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> details = [
    "First Name",
    "Last Name",
    "Age",
    "Email Address",
    "Password"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of((context))
                    .push(MaterialPageRoute(builder: ((context) => SignUp())));
              },
              icon: Icon(
                Icons.logout,
                color: Colors.white,
              ))
        ],
        leading: Icon(
          Icons.code,
          color: Colors.white,
        ),
        title: Text(
          "Welcome ${widget.person?.getFullName}",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            Center(
              child: const Icon(
                Icons.person,
                size: 150,
              ),
            ),
            Column(
              children: [
                Text(
                  "${widget.person?.getFullName}",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1,
                  ),
                ),
                Text(
                  "${widget.person?.getEmailAddress}",
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1,
                      color: Color(0XFF87CEEB)),
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Personal Details",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0XFF87CEEB),
                      letterSpacing: 2),
                ),
              ],
            ),
            Divider(
              color: Colors.black,
              thickness: 2,
              height: 25,
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                personalDetails(
                    attribute: "First Name", info: widget.person?.getFirstName),
                personalDetails(
                    attribute: "Last Name", info: widget.person?.getLastName),
                personalDetails(
                    attribute: "Age Name", info: widget.person?.getAge),
                personalDetails(
                    attribute: "Email Address",
                    info: widget.person?.getEmailAddress),
                personalDetails(
                    attribute: "Password", info: widget.person?.getPassword),
              ],
            )
          ],
        ),
      ),
    );
  }

  Padding personalDetails({required String attribute, required String? info}) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "$attribute:",
            style: TextStyle(
              color: Color(0XFF87CEEB),
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
          Text(
            "$info",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          )
        ],
      ),
    );
  }
}
