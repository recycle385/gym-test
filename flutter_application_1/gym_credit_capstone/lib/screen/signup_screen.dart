import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  void signUp() async{
    if(_formKey.currentState!.validate()){
      if(_passwordController.text
          != _confirmPasswordController.text){
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('비밀번호가 일치하지 않습니다.')));
      }
      try{
        final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );
        Navigator.pushNamed(context, '/success');
      } on FirebaseAuthException catch (e){
        if(e.code == "weak-password"){
          print("The password provide is too weak.");
        } else if(e.code == "email-already-in-use") {
          print('The account already exists for that email.');
        }
      }
      catch(e){
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('회원가입'),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Form(
          key: _formKey,
          child:Column(
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
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  validator: (value){
                    if(value!.isEmpty){
                      return '비밀번호를 입력해주세요.';
                    }
                    else
                      return null;
                  }
              ),
              TextFormField(
                controller: _confirmPasswordController,
                decoration: InputDecoration(labelText: 'Confirm Password'),
                  validator: (value){
                    if(value!.isEmpty){
                      return '비밀번호를 다시 한 번 적어주세요.';
                    }
                    else
                      return null;
                  }
              ),
              SizedBox(height: 20),
              ElevatedButton(onPressed: () {
                signUp();
              }, child: Text('회원가입')),
              TextButton(onPressed: () {
                Navigator.pushNamed(context, '/login');
              }, child: Text('돌아가기')),
            ],
          ),
        ),
      ),
    );
  }
}
