import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:wi_jungle/widgets/login_form_comp.dart';
import 'package:wi_jungle/widgets/windows_button_comp.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(38.0),
        child: AppBar(
          backgroundColor: const Color(0xFFF6F6FF),
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: WindowTitleBarBox(
              child: Row(
                children: [Expanded(child: Container()), const WindowButtons()],
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: const Color(0xFFF6F6FF),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 42.0),
                      child: Image.asset(
                        'assets/logo_light.png',
                        fit: BoxFit.contain,
                        height: 80,
                        width: 150,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.85,
                  ),
                  child: Row(
                    children: [
                      // First element: Image
                      Expanded(
                        flex: 4,
                        child: Image.asset(
                          'assets/vector_image.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(width: 20),
                      // Second element: Login Form
                      const Expanded(
                        flex: 3,
                        child: Padding(
                          padding: EdgeInsets.only(right: 18.0),
                          child: LoginForm(),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
