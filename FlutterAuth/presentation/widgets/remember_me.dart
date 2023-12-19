import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RememberMe extends StatefulWidget {
  RememberMe(
      {super.key,
      required this.emailController,
      required this.passwordController});

  final TextEditingController emailController;
  final TextEditingController passwordController;

  bool? _remember = false;
  bool _loading = false;

  @override
  State<RememberMe> createState() => _RememberMeState();
}

class _RememberMeState extends State<RememberMe> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      getSharedPrefs();
    });
  }

  void getSharedPrefs() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      widget._remember = prefs.getBool("Remember");
      widget.emailController.text = prefs.getString("Email") ?? "";
      widget.passwordController.text = prefs.getString("Password") ?? "";
    });
  }

  void setSharedPrefs({
    required bool remember,
  }) async {
    //starts loading animation
    setState(() {
      widget._loading = true;
    });

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("Remember", remember);

    //if remember me is set. saves password and email
    if (remember) {
      await prefs.setString("Email", widget.emailController.text);
      await prefs.setString("Password", widget.passwordController.text);

      //if remember me is not set, clears the fields
    } else {
      await prefs.setString("Email", "");
      await prefs.setString("Password", "");
    }

    //stops loading animation
    setState(() {
      widget._loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(
              right:
                  20), //checkbox makes it look off center... this just fixes that.
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Checkbox(
                  value: widget._remember,
                  onChanged: (value) async {
                    setSharedPrefs(remember: value ?? false);
                    setState(() {
                      widget._remember = value ?? false;
                    });
                  }),
              const Text("Remember Me"),
            ],
          ),
        ),
        Container(
          width: 200,
          padding: const EdgeInsets.only(left: 10),
          child: Visibility(
            visible: widget._loading,
            replacement: const SizedBox(
              height: 5,
            ),
            child: const LinearProgressIndicator(
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
          ),
        ),
      ],
    );
  }
}
