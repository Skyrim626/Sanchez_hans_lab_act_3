import 'package:flutter/material.dart';
import 'package:sanchez_hans/homepage.dart';
import 'package:sanchez_hans/person.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();

  // Controller
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController emailAddressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  // Obscure Text Set
  bool passwordObscure = true;
  bool confirmPassword = true;

  @override
  void dispose() {
    // TODO: implement dispose
    firstNameController.dispose();
    lastNameController.dispose();
    ageController.dispose();
    emailAddressController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Icon(
            Icons.code,
            color: Colors.white,
          ),
          title: Text(
            "Sign Up Page",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: SingleChildScrollView(
          child: Center(
           
            child: Padding(
              padding: EdgeInsets.all(20.0),
                child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Title Form
                  Text(
                    "Sign Up Page",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
        
                  // First name
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your first name";
                      }
        
                      return null;
                    },
                    controller: firstNameController,
                    decoration: InputDecoration(
                        labelText: "First Name",
                        hintText: "Enter your first name"),
                  ),
        
                  const SizedBox(
                    height: 10,
                  ),
        
                  // Last Name
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your last name";
                      }
        
                      return null;
                    },
                    controller: lastNameController,
                    decoration: InputDecoration(
                        labelText: "Last Name", hintText: "Enter your last name"),
                  ),
        
                  const SizedBox(
                    height: 10,
                  ),
        
                  // Age
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your age name";
                      }
        
                      return null;
                    },
                    controller: ageController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Age", hintText: "Enter your age"),
                  ),
        
                  const SizedBox(
                    height: 10,
                  ),
        
                  // Email Address
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your email address";
                      }
        
                      return null;
                    },
                    controller: emailAddressController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        labelText: "Email Address",
                        hintText: "Enter your email address"),
                  ),
        
                  const SizedBox(
                    height: 10,
                  ),
        
                  // Password
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your password";
                      }
        
                      return null;
                    },
                    controller: passwordController,
                    obscureText: passwordObscure,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                if (passwordObscure) {
                                  passwordObscure = false;
                                } else {
                                  passwordObscure = true;
                                }
                              });
                            },
                            icon: passwordObscure
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility)),
                        labelText: "Password",
                        hintText: "Enter your password"),
                  ),
        
                  const SizedBox(
                    height: 10,
                  ),
        
                  // Confirm Password
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Confirm your password first";
                      }
        
                      if(!(value == passwordController.text)) {
                        return "Password not matched!";
                      }
        
                      return null;
                    },
                    obscureText: confirmPassword,
                    controller: confirmPasswordController,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                if (confirmPassword) {
                                  confirmPassword = false;
                                } else {
                                  confirmPassword = true;
                                }
                              });
                            },
                            icon: confirmPassword
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility)),
                        labelText: "Confirm Password",
                        hintText: "Enter your confirm password"),
                  ),
        
                  const SizedBox(
                    height: 30,
                  ),
        
                  // Sign Up Button
                  ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll<Color>(Colors.black),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(color: Colors.white, letterSpacing: 3.0),
                      ),
                    ),
                    onPressed: () {
                      // Checks the details first
                      // Redirects the user to the home page
        
                      if (_formKey.currentState!.validate()) {
                        Navigator.of((context)).push(MaterialPageRoute(
                            builder: ((context) => HomePage(
                                  person: Person(
                                    firstName: firstNameController.text,
                                    lastName: lastNameController.text,
                                    age: ageController.text,
                                    emailAddress: emailAddressController.text,
                                    password: passwordController.text,
                                  ),
                                ))));
                      }
                    },
                  ),
                ],
              ),
            )),
          ),
        ));
  }
}
