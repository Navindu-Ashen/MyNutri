import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_nutri/Screens/login_page.dart';

final _firebase = FirebaseAuth.instance;

class Signupscreen extends StatefulWidget {
  const Signupscreen({super.key});

  @override
  State<Signupscreen> createState() => _SignupscreenState();
}

class _SignupscreenState extends State<Signupscreen> {
  final _form = GlobalKey<FormState>();
  var _enteredFirstName = "";
  var _enteredLastName = "";
  var _userName = "";
  var _enteredEmail = "";
  var _password = "";
  var errorMsg = "";
  var _isAuthenticaing = false;

  void _submit() async {
    final isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }
    FocusScope.of(context).unfocus();
    _form.currentState!.save();

    setState(() {
      _isAuthenticaing = true;
    });

    try {
      final userCredentials = await _firebase.createUserWithEmailAndPassword(
          email: _enteredEmail, password: _password);

      await FirebaseFirestore.instance
          .collection("users")
          .doc(userCredentials.user!.uid)
          .set({
        "first-name": _enteredFirstName,
        "last-name": _enteredLastName,
        "user-name": _userName,
        "email": _enteredEmail,
      });

      _form.currentState!.reset();
    } on FirebaseAuthException catch (error) {
      if (error.code == "email-already-in-use") {
        errorMsg = "Email adderss is already in use";
      } else if (error.code == "invalid-email") {
        errorMsg = "Email adderss is not valid";
      }

      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).clearSnackBars();
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMsg),
        ),
      );
      setState(() {
        _isAuthenticaing = false;
      });
      return;
    }
    FirebaseAuth.instance.signOut();
    setState(() {
      _isAuthenticaing = false;
    });

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: screenSize.width,
        height: screenSize.height,
        decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage("assets/backdrop_3.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Positioned(
                bottom: 100,
                left: 0,
                right: 0,
                child: Image.asset("assets/02.png"),
              ),
              Container(
                width: size.width,
                height: size.height,
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 20, bottom: 20),
                color: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 20,
                    width: double.infinity,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              const SizedBox(
                                height: 19.8,
                              ),
                              Image.asset(
                                "assets/logo.png",
                                width: 160,
                              ),
                            ],
                          ),
                          Form(
                            key: _form,
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    width: screenSize.width * 0.9,
                                    child: TextFormField(
                                      style:
                                          const TextStyle(color: Colors.black),
                                      textCapitalization:
                                          TextCapitalization.none,
                                      decoration: InputDecoration(
                                        labelText: "First Name",
                                        labelStyle: TextStyle(
                                          color: const Color.fromARGB(
                                              255, 51, 154, 163),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 17,
                                        ),
                                        fillColor: Colors.white,
                                        filled: true,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: const Color.fromARGB(
                                                255, 51, 154, 163),
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: const Color.fromARGB(
                                                  255, 51, 154, 163),
                                              width: 3),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      onSaved: (value) {
                                        _enteredFirstName = value!;
                                      },
                                      validator: (value) {
                                        if (value == null ||
                                            value.trim().isEmpty) {
                                          return "Enter a valid name";
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  SizedBox(
                                    width: screenSize.width * 0.9,
                                    child: TextFormField(
                                      style:
                                          const TextStyle(color: Colors.black),
                                      textCapitalization:
                                          TextCapitalization.none,
                                      decoration: InputDecoration(
                                        labelText: "Last Name",
                                        labelStyle: TextStyle(
                                          color: const Color.fromARGB(
                                              255, 51, 154, 163),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 17,
                                        ),
                                        fillColor: Colors.white,
                                        filled: true,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: const Color.fromARGB(
                                                255, 51, 154, 163),
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: const Color.fromARGB(
                                                  255, 51, 154, 163),
                                              width: 3),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      onSaved: (value) {
                                        _enteredLastName = value!;
                                      },
                                      validator: (value) {
                                        if (value == null ||
                                            value.trim().isEmpty) {
                                          return "Enter a valid name";
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  SizedBox(
                                    width: screenSize.width * 0.9,
                                    child: TextFormField(
                                      style:
                                          const TextStyle(color: Colors.black),
                                      textCapitalization:
                                          TextCapitalization.none,
                                      decoration: InputDecoration(
                                        labelText: "Age",
                                        labelStyle: TextStyle(
                                          color: const Color.fromARGB(
                                              255, 51, 154, 163),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 17,
                                        ),
                                        fillColor: Colors.white,
                                        filled: true,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: const Color.fromARGB(
                                                255, 51, 154, 163),
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: const Color.fromARGB(
                                                  255, 51, 154, 163),
                                              width: 3),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      onSaved: (value) {
                                        _userName = value!;
                                      },
                                      validator: (value) {
                                        if (value == null ||
                                            value.trim().isEmpty ||
                                            value.trim().length < 6) {
                                          return "Enter a valid user name";
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  SizedBox(
                                    width: screenSize.width * 0.9,
                                    child: TextFormField(
                                      style:
                                          const TextStyle(color: Colors.black),
                                      textCapitalization:
                                          TextCapitalization.none,
                                      decoration: InputDecoration(
                                        labelText: "Weight",
                                        labelStyle: TextStyle(
                                          color: const Color.fromARGB(
                                              255, 51, 154, 163),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 17,
                                        ),
                                        fillColor: Colors.white,
                                        filled: true,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: const Color.fromARGB(
                                                255, 51, 154, 163),
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: const Color.fromARGB(
                                                  255, 51, 154, 163),
                                              width: 3),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      onSaved: (value) {
                                        _enteredEmail = value!;
                                      },
                                      validator: (value) {
                                        if (value == null ||
                                            value.trim().isEmpty ||
                                            !value.contains("@")) {
                                          return "Enter a valid email address";
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  SizedBox(
                                    width: screenSize.width * 0.9,
                                    child: DropdownButtonFormField<String>(
                                      dropdownColor: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      items: [
                                        DropdownMenuItem(
                                          value: 'thin',
                                          child: Text(
                                            'Thin',
                                            style: TextStyle(
                                              color: const Color.fromARGB(
                                                  255, 51, 154, 163),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 17,
                                            ),
                                          ),
                                        ),
                                        DropdownMenuItem(
                                          value: 'average',
                                          child: Text(
                                            'Average',
                                            style: TextStyle(
                                              color: const Color.fromARGB(
                                                  255, 51, 154, 163),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 17,
                                            ),
                                          ),
                                        ),
                                        DropdownMenuItem(
                                          value: 'fat',
                                          child: Text(
                                            'Fat',
                                            style: TextStyle(
                                              color: const Color.fromARGB(
                                                  255, 51, 154, 163),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 17,
                                            ),
                                          ),
                                        ),
                                      ],
                                      onChanged: (value) {},
                                      decoration: InputDecoration(
                                        labelText: "Body type",
                                        labelStyle: TextStyle(
                                          color: const Color.fromARGB(
                                              255, 51, 154, 163),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 17,
                                        ),
                                        fillColor: Colors.white,
                                        filled: true,
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: const Color.fromARGB(
                                                255, 51, 154, 163),
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: const Color.fromARGB(
                                                255, 51, 154, 163),
                                            width: 3,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      style:
                                          const TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 130,
                          ),
                          if (!_isAuthenticaing)
                            ElevatedButton(
                              onPressed: _submit,
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                padding: const EdgeInsets.all(17),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                backgroundColor:
                                    const Color.fromARGB(255, 51, 154, 163),
                              ),
                              child: const Center(
                                child: Text(
                                  "Create account",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          if (_isAuthenticaing)
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                padding: const EdgeInsets.all(17),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                backgroundColor:
                                    const Color.fromARGB(195, 51, 154, 163),
                              ),
                              child: const Center(
                                  child: CircularProgressIndicator(
                                color: Colors.white,
                              )),
                            ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Already have an account?",
                                style: TextStyle(
                                  color: Color.fromARGB(255, 81, 81, 81),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const LoginPage(),
                                    ),
                                  );
                                },
                                child: const Text(
                                  "Log in",
                                  style: TextStyle(
                                    color:
                                        const Color.fromARGB(255, 51, 154, 163),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
