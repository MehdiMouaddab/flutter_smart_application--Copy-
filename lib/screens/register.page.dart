import 'package:flutter/material.dart';


class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwoedConfController= TextEditingController();
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
  String? _confirmePasswordValidator(String? value){
    if (value==null || value.isEmpty){
      return 'please confirm password';
    }
    if (value!=_passwordController.text){
      return 'password dont match !';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(
          "Register page",
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
              SizedBox(height: 30),
              TextFormField(
                obscureText: !_passwordVisible,
                controller: _passwoedConfController,
                decoration: InputDecoration(
                  labelText: "confirm password",
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
                validator: _confirmePasswordValidator,
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
                    "register",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold
                    ),

                  )),
              SizedBox(height: 20,),
              TextButton(onPressed: (){
                Navigator.pushNamed(context, '/login');
              }, child: Text(
                "if you already have an account . login",
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