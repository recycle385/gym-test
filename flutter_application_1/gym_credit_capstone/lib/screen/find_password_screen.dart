import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FindPasswordScreen extends StatefulWidget {
  const FindPasswordScreen({super.key});

  @override
  State<FindPasswordScreen> createState() => FindPasswordScreenState();
}

class FindPasswordScreenState extends State<FindPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  void ResetUser() async{
    try {
      // Firebase Auth 인스턴스 가져오기
      final FirebaseAuth auth = FirebaseAuth.instance;

      // 비밀번호 재설정 이메일 전송
      await auth.sendPasswordResetEmail(email: _emailController.text);
      print('비밀번호 재설정 이메일이 전송되었습니다!');
    } catch (e) {
      // 오류 처리
      print('오류 발생: ${e.toString()}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('비밀번호 찾기'),
      ),
      body: Padding(
        padding: EdgeInsets.all(40),
        child: Column(
          children: [
            TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value){
                  if(value!.isEmpty){
                    return '이메일을 입력해주세요.';
                  }
                  else
                    return null;
                }
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: () {
              ResetUser();
            }, child: Text('비밀번호 재설정')),
            TextButton(onPressed: () {
              Navigator.pushNamed(context, '/login');
            }, child: Text('돌아가기')),
          ],
        ),
      )
    );
  }
}
