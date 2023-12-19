
import '../screens/login_screen.dart';
import '../widgets/auth_text_box.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _password2Controller = TextEditingController();


  bool passwordsCheck() {
    if (_passwordController.text == "" || _password2Controller.text == "") {
      return false;
    }
    if (_password2Controller.text == _passwordController.text) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AuthTextBox(
            hint: "Email",
            controller: _emailController,
            icon: Icons.email,
          ),
          AuthTextBox(
            hint: "Password",
            controller: _passwordController,
            icon: Icons.password,
            obscureText: true,
          ),
          AuthTextBox(
            hint: "Confirm Password",
            controller: _password2Controller,
            icon: Icons.check_circle,
            obscureText: true,
          ),
          const SizedBox(height: 40),

          //BUTTON

          InkWell(
            onTap: () async {
              if (passwordsCheck()) {
                try {
                 //TODO: Add registration code here.
                  }
                } catch (e) {
                  // ignore: use_build_context_synchronously
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(e.toString())));
                }
              } else {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text(
                        "Something went wrong! Please check that your passwords match.")));
              }
            },
            child: Container(
              padding = const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
              decoration = BoxDecoration(
                  border: Border.all(width: 1, color: Colors.white),
                  borderRadius: BorderRadius.circular(20)),
              child = const Text("Register"),
            ),
          ),
          const SizedBox(height = 40),

          InkWell(
            onTap = () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()));
            },
            child = const Text("Login Instead",
                style: TextStyle(fontStyle: FontStyle.italic)),
          ),
        ],
      )),
    );
  }
}
