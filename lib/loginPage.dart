// ignore: file_names
import 'package:flutter/material.dart';
import 'package:quiz_app/main.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: const loginpage(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.purple,
        ));
  }
}

class loginpage extends StatefulWidget {
  const loginpage({super.key});
  @override
  State createState() => _loginpage();
}

class ModelClass {
  String? usesrname;
  String? password;
  ModelClass({required this.usesrname, required this.password});
}

// ignore: camel_case_types
class _loginpage extends State<loginpage> {
  // ignore: prefer_final_fields
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  List<Map> users = [
    {"user": "yash", "password": "chavan"},
    {"user": "aniket", "password": "bhagwat"},
    {"user": "Narayan", "password": "Ghospurkar"}
  ];
  int userIndex = 0;
  void isvalid() {
    if ((users[userIndex]["password"] ==
                passwordController.text.toLowerCase().trim() &&
            users[userIndex]["user"] ==
                userNameController.text.trim().toLowerCase()) ||
        (users[userIndex + 1]["password"] ==
                passwordController.text.trim().toLowerCase() &&
            users[userIndex + 1]["user"] ==
                userNameController.text.trim().toLowerCase())) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Login SucessFull")));
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Quiz()));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Invalid Credential")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 147, 19, 169),
          centerTitle: true,
          title: const Text(
            "Quiz App",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w800,
              fontSize: 30,
            ),
          ),
        ),
        body: Form(
          key: _formkey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.network(
                      "https://cdn.dribbble.com/users/145033/screenshots/2486668/avataranimation.gif"),
                  TextFormField(
                    controller: userNameController,
                    decoration: const InputDecoration(
                        hintText: "Enter Your UserName ",
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                        label: Text("UserName")),
                    validator: (value) {
                      // print("In validator of textform field of username");
                      if (value == null || value.isEmpty) {
                        return "Please Enter Your UserName ";
                      } else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    obscureText: true,
                    obscuringCharacter: "*",
                    controller: passwordController,
                    decoration: const InputDecoration(
                        hintText: "Enter Your Password ",
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: Icon(Icons.remove_red_eye),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                        label: Text("Password")),
                    validator: (value) {
                      // print("In validator of textform field of password");
                      if (value == null || value.isEmpty) {
                        return "Please enter Password ";
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.blue),
                      ),
                      onPressed: () {
                        bool validate = _formkey.currentState!.validate();

                        if (validate) {
                          setState(() {
                            isvalid();
                          });
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Login Failed")));
                        }
                      },
                      child: const Text(
                        "Submit",
                        style: TextStyle(color: Colors.white),
                      )),
                ],
              ),
            ),
          ),
        ));
  }
}
