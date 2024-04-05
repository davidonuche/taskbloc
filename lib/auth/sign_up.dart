import 'package:flutter/material.dart';
import 'package:taskbloc/auth/log_in.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Sign Up')),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // App Icon
            Image.asset(
              'images/logo.jpg',
              width: 100,
              height: 100,
            ),
            const SizedBox(height: 20),
            // App Name
            const Text(
              'TaskBloc',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30),
            // Sign Up Form
            _buildSignUpForm(),
            const SizedBox(height: 20),
            // Brief Text
            const Text(
              'TaskBloc is a powerful task management app that helps you organize your tasks efficiently.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSignUpForm() {
    bool _isPasswordObscure = true;
    bool _isConfirmPasswordObscure = true;
    return Column(
      children: [
        TextFormField(
          decoration: const InputDecoration(
            labelText: 'Name',
            prefixIcon: Icon(Icons.person),
          ),
        ),
        const SizedBox(height: 10),
        TextFormField(
          decoration: const InputDecoration(
            labelText: 'Email',
            prefixIcon: Icon(Icons.email),
          ),
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 10),
        TextFormField(
          decoration: const InputDecoration(
            labelText: 'Phone Number',
            prefixIcon: Icon(Icons.phone),
          ),
          keyboardType: TextInputType.phone,
        ),
        const SizedBox(height: 10),
        TextFormField(
          decoration: const InputDecoration(
            labelText: 'Date of Birth',
            prefixIcon: Icon(Icons.calendar_today),
          ),
          keyboardType: TextInputType.datetime,
        ),
        const SizedBox(height: 10),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Password',
            prefixIcon: const Icon(Icons.lock),
            suffixIcon: IconButton(
              icon: Icon(_isPasswordObscure ? Icons.visibility : Icons.visibility_off),
              onPressed: () {
                setState(() {
                   _isPasswordObscure = !_isPasswordObscure;
                });
              },
            ),
          ),
          obscureText: _isPasswordObscure,
        ),
        const SizedBox(height: 10),
        TextFormField(
          decoration: InputDecoration(
            labelText: 'Confirm Password',
            prefixIcon: const Icon(Icons.lock),
            suffixIcon: IconButton(
              icon: Icon(_isConfirmPasswordObscure ? Icons.visibility : Icons.visibility_off),
              onPressed: () {
                setState(() {
                 _isConfirmPasswordObscure = !_isConfirmPasswordObscure;
                });
              },
            ),
          ),
          obscureText: _isConfirmPasswordObscure,
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
       Navigator.push(context,
                MaterialPageRoute(builder: (context) => const LogIn()));
          },
          child: const Text('Sign Up'),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Already have an account?',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(width: 5),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const LogIn()));
              },
              child: const Text(
                'Log In',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
