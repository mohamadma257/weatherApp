import 'package:find_me_admin/firebase/fire_auth.dart';
import 'package:find_me_admin/widgets/custom_field.dart';
import 'package:find_me_admin/widgets/logo.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailCon = TextEditingController();
  TextEditingController passCon = TextEditingController();
  bool isLoad = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const FindMeLogo(),
              Row(
                children: [
                  Text(
                    "Admin Account",
                    style: Theme.of(context).textTheme.headlineLarge,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              CustomField(
                  controller: emailCon, text: "Email", icon: Icons.email),
              CustomField(
                controller: passCon,
                text: "Password",
                isPass: true,
                icon: Icons.password,
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    foregroundColor: Theme.of(context).colorScheme.background,
                    backgroundColor:
                        Theme.of(context).colorScheme.onBackground),
                onPressed: () {
                  try {
                    setState(() {
                      isLoad = true;
                    });
                    FireAuth().login(emailCon.text, passCon.text).then((value) {
                      setState(() {
                        isLoad = false;
                      });
                    });
                  } catch (e) {}
                },
                child: Center(
                    child: isLoad
                        ? SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(),
                          )
                        : Text("Login")),
              ),
              const SizedBox(
                height: 12,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
