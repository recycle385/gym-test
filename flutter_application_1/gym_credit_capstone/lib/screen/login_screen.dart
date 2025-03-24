import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('로그인'),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: () {
              Navigator.pushNamed(context, '/success');
            }, child: Text('로그인')),
            TextButton(onPressed: () {
              Navigator.pushNamed(context, '/signup');
              }, child: Text('회원가입')),
            TextButton(onPressed: () {
              Navigator.pushNamed(context, '/find_pw');
            }, child: Text('비밀번호 찾기')),
          ],
        ),
      )
    );
  }
}
