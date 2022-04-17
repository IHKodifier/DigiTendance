
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginForm extends ConsumerStatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<LoginForm> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String email = '';
  String password = '';
 @override
  void dispose() {
     emailController.dispose();
    passwordController.dispose();
    super.dispose();
   
  }

  @override
  Widget build(BuildContext context) {
    return Container();

  }
}