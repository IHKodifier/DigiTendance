import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../login/login_form.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: Colors.black.withOpacity(0.65),
      child: Center(
        child: Container(
          width: 500,
          height: MediaQuery.of(context).size.height * .60,
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28)),
            child: LoginForm(),
            
            // ],
          ),
        ),
      ),
    );
  }
}
