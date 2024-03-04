import 'package:flutter/material.dart';
import 'package:test_drive/main.dart';

class SignInPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: usernameController,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Validate credentials (for simplicity, using hardcoded values)
                User user = User(username: 'chriss', password: 'kim123');
                if (usernameController.text == user.username &&
                    passwordController.text == user.password) {
                  Navigator.pushNamed(context, '/home');
                } else {
                  // Display error message or handle authentication failure
                  // ignore: avoid_print
                  print('Invalid credentials');
                }
              },
              child: const Text('Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: const Text('Log In Page'),
      ),

    );
  }
}
/*void validateCredentials() {
    String enteredUsername = usernameController.text;
    String enteredPassword = passwordController.text;

    // Check if entered credentials match the valid credentials
    if (enteredUsername == validUsername && enteredPassword == validPassword) {
      // Navigate to the homepage if credentials are valid
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      // Show an error message if credentials are invalid
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Invalid Credentials'),
            content: Text('Please enter valid username and password.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
}
*/

/*
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> fetchData() async {
  // Replace with your API endpoint URL
  const url = "https://your-api-domain/api/data";

  // Add authentication headers here (JWT, etc.)

  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception("Failed to fetch data");
  }
}

// Use the fetched data in your Flutter app as needed

*/
