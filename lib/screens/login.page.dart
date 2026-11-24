import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  bool _passwordVisible = false;
  final _formkey=GlobalKey<FormState>();

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'please enter your email';
    }
    final emailPattern = '^[^@]+@[^@]+\.[^@]+';
    final regexp = RegExp(emailPattern);
    if (!regexp.hasMatch(value)) {
      return "enter a valid email";
    }
    return null;
  }
  String? _validatePassword(String? value){
    if(value==null ||value.isEmpty){
      return'please enter password';
    }
    if (value.length<6){
      return'password must contain at least 6 caracters long';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(
          "login page",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Form(
          key: _formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset("images/avatar.jpeg", width: 80, height: 80),
              Text(
                "Welcom back",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.purple,
                  fontWeight: FontWeight.w500,
                  fontSize: 30,
                ),
              ),

              SizedBox(height: 30),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: "email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: Icon(Icons.email),
                ),
                validator: _validateEmail,
              ),
              SizedBox(height: 30),
              TextFormField(
                obscureText: !_passwordVisible,
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: "password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: Icon(Icons.password),
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                    icon: Icon(
                      _passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                  ),
                ),
                validator: _validatePassword,
              ),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: (){
                if(_formkey.currentState!.validate()){
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Processing Login!"))
                  );
                  Navigator.pushNamed(context, '/home');
                }

              },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    padding: EdgeInsets.symmetric(vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                    )
                  )
                  , child: Text(
                "login",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold
                ),

              )),
              SizedBox(height: 20,),
              TextButton(onPressed: (){
                Navigator.pushNamed(context, '/register');
              }, child: Text(
                "don't have an account . signup",
                style: TextStyle(
                  color: Colors.purple,
                  fontSize: 18,
                  fontStyle: FontStyle.italic
                ),
              ))

            ],
          ),
        ),
      ),
    );
  }
}
