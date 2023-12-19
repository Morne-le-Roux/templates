// ignore_for_file: use_build_context_synchronously

import '../screens/register_screen.dart';
import '../widgets/remember_me.dart';
import 'package:flutter/material.dart';
import '../widgets/auth_text_box.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final SupabaseAuthM _supabaseAuthM = SupabaseAuthM();

  bool _loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
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

          //Remember Me

          Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: RememberMe(
              emailController: _emailController,
              passwordController: _passwordController,
            ),
          ),

          //BUTTON

          InkWell(
            onTap: () async {
              try {
                //starts loading animation
                setState(() {
                  _loading = true;
                });
                //TODO: Add Login Code Here
                }
              } catch (e) {
                //catch and display any errors
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(e.toString())));
              }

              //stops animation
              setState(() {
                _loading = false;
              });
            },
            //button look
            child: Container(
              padding = const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
              margin = const EdgeInsets.symmetric(vertical: 10),
              decoration = BoxDecoration(
                  border: Border.all(width: 1, color: Colors.white),
                  borderRadius: BorderRadius.circular(20)),
              child = const Text("Login"),
            ),
          ),

          Visibility(
              replacement = const SizedBox(),
              visible = _loading,
              child =
                  const SizedBox(width: 200, child: LinearProgressIndicator())),

          //spacing
          const SizedBox(height = 40),

          //button to take user to registration screen instead
          InkWell(
            onTap = () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => RegisterScreen()));
            },
            child = const Text("Register Instead",
                style: TextStyle(fontStyle: FontStyle.italic)),
          ),
        ],
      )),
    );
  }
}
