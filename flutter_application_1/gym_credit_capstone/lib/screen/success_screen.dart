import 'package:flutter/material.dart';

class SuccessScreen extends StatefulWidget {
  const SuccessScreen({super.key});

  @override
  State<SuccessScreen> createState() => SuccessScreenState();
}

class SuccessScreenState extends State<SuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('로그인'),
      ),
      body: Padding(
        padding: EdgeInsets.all(40),
        child: Column(
          children: [
            Text('로그인 성공'),
            SizedBox(height: 20),
            ElevatedButton(onPressed: () {
              Navigator.pushNamed(context, '/login');
            }, child: Text('로그아웃')),
          ],
        ),
      )
    );
  }
}
