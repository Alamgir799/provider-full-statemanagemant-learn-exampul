import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_statemanagement/provider/auth_provider.dart';

class LoginApiScreen extends StatelessWidget {
  LoginApiScreen({Key? key}) : super(key: key);
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print("build");
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("provider learning"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailcontroller,
              decoration: InputDecoration(hintText: "Email"),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _passwordcontroller,
              decoration: InputDecoration(hintText: "Password"),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    authProvider.Login(_emailcontroller.text.toString(),
                        _passwordcontroller.text.toString());
                  },
                  child: authProvider.loading
                      ? CircularProgressIndicator(color: Colors.white,)
                      : Text("Done")),
            )
          ],
        ),
      ),
    );
  }
}
