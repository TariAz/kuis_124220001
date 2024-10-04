import 'package:flutter/material.dart';

class Page3 extends StatelessWidget {
  final String username;
  Page3({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("Log Out")),
      appBar: AppBar(
        title: Text("Bantuan Dan Dukungan"),
        backgroundColor: const Color.fromARGB(255, 191, 154, 198),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Selamat Datang",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              "$username!",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
