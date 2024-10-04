import 'package:flutter/material.dart';
import 'package:kuis_mobile/home_page.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username = '';
  String password = '';
  bool isLoginSuccess = true;
  bool visible = true;

  navigatePage() async {
    await Future.delayed(Duration(seconds: 2));

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return Page2(
        username: username,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
        backgroundColor: const Color.fromARGB(255, 201, 174, 206),
      ),
      body: Column(
        children: [usernameField(), _passwordField(), _loginButton(context)],
      ),
    ));
  }

  Widget usernameField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        onChanged: (value) {
          username = value;
        },
        enabled: true,
        decoration: InputDecoration(
            labelText: 'Username',
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.purple),
            )),
      ),
    );
  }

  Widget _passwordField() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        onChanged: (value) {
          password = value;
        },
        enabled: true,
        obscureText: visible, //tampilan mata bisa dilihat
        decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  visible = !visible;
                });
              },
              icon: Icon(visible ? Icons.visibility : Icons.visibility_off),
            ),
            labelText: 'password',
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.purple))),
      ),
    );
  }

  Widget _loginButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: () {
          String text = '';
          if (username == 'Tari' && password == 'admin') {
            navigatePage();
            setState(() {
              text = 'Login Berhasil';
              isLoginSuccess = true;
            });
            text = 'Login Berhasil';
          } else {
            setState(() {
              text = 'Login Berhasil';
              isLoginSuccess = false;
            });
            text = 'Login Gagal';
          }
          SnackBar snackBar = SnackBar(
              backgroundColor: isLoginSuccess ? Colors.green : Colors.red,
              content: Text(text));

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: Text('Login'),
      ),
    );
  }
}
