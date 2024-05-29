import 'package:flutter/material.dart';

// void main() => runApp(const MainApp());

// class MainApp extends StatelessWidget {
//   const MainApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         home: const Quiz(),
//         debugShowCheckedModeBanner: false,
//         theme: ThemeData(
//           brightness: Brightness.light,
//           primaryColor: Colors.purple,
//         ));
//   }
// }

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State createState() => _Quiz();
}

class _Quiz extends State {
  List<Map> questionList = [
    {
      "question":
          " What programming language is primarily used for Flutter app development? ",
      "options": [" Java", "Swift", "Kotlin", " Dart"],
      "answerIndex": 3,
    },
    {
      "question":
          "What does the pubspec.yaml file in a Flutter project define? ",
      "options": [
        "The project's metadata and dependencies",
        "The layout and design of the app's user interface",
        " The routing configuration for navigating between screens",
        "The state management strategy used in the app"
      ],
      "answerIndex": 0,
    },
    {
      "question":
          "Which widget is used to create a material design app bar in Flutter?",
      "options": [" AppBar", " Toolbar", "NavigationBar", "Header"],
      "answerIndex": 0,
    },
    {
      "question":
          "Which Flutter command is used to run the app in debug mode on a connected device or emulator? ",
      "options": [
        "flutter start",
        "flutter build",
        " flutter run",
        "flutter debug"
      ],
      "answerIndex": 2,
    },
    {
      "question": "In Flutter, what is the purpose of the setState method? ",
      "options": [
        "To update the state of a widget and rebuild it if necessary",
        "To define the stateful widgets in the app",
        "To set the initial state of a widget",
        "To handle user interactions with the widget"
      ],
      "answerIndex": 0,
    }
  ];
  bool isScreen = true;
  int questionIndex = 0;
  int selectedAnswerIndex = -1;
  int correctAnsCount = 0;

  // ignore: non_constant_identifier_names
  MaterialStatePropertyAll<Color?>? CheckAns(int buttonIndex) {
    if (selectedAnswerIndex != -1) {
      if (buttonIndex == questionList[questionIndex]["answerIndex"]) {
        return const MaterialStatePropertyAll(Colors.green);
      } else if (buttonIndex == selectedAnswerIndex) {
        return const MaterialStatePropertyAll(Colors.red);
      } else {
        return const MaterialStatePropertyAll(null);
      }
    } else {
      return const MaterialStatePropertyAll(null);
    }
  }

  void pageValidation() {
    if (selectedAnswerIndex == -1) {
      return;
    }

    if (selectedAnswerIndex == questionList[questionIndex]["answerIndex"]) {
      correctAnsCount += 1;
    }

    if (selectedAnswerIndex != -1) {
      if (questionIndex == questionList.length - 1) {
        setState(() {
          isScreen = false;
        });
      }
      selectedAnswerIndex = -1;
      setState(() {
        questionIndex++;
      });
    }
  }

  Scaffold screenCheck() {
    if (isScreen == true) {
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
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Questions :",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 30,
                        )),
                    Text("${questionIndex + 1}/${questionList.length}",
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 30,
                        )),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text("${questionList[questionIndex]["question"]}",
                    style: const TextStyle(
                      fontWeight: FontWeight.w400,
                      // color: Colors.black,
                      fontSize: 20,
                    )),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                      // maximumSize: MaterialStatePropertyAll(Size.(fromWidth(4)),
                      fixedSize:
                          const MaterialStatePropertyAll(Size.fromWidth(300)),
                      backgroundColor: CheckAns(0),
                      // maximumSize: const MaterialStatePropertyAll(width:100, height:20))
                    ),
                    onPressed: () {
                      setState(() {
                        if (selectedAnswerIndex == -1) {
                          selectedAnswerIndex = 0;
                        }
                      });
                    },
                    child:
                        Text("A. ${questionList[questionIndex]["options"][0]}",
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                            ))),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                      fixedSize:
                          const MaterialStatePropertyAll(Size.fromWidth(300)),
                      //   minimumSize:
                      //       const MaterialStatePropertyAll(Size.fromWidth(100)),
                      backgroundColor: CheckAns(1),
                    ),
                    onPressed: () {
                      setState(() {
                        if (selectedAnswerIndex == -1) {
                          selectedAnswerIndex = 1;
                        }
                      });
                    },
                    child:
                        Text("B. ${questionList[questionIndex]["options"][1]}",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                            ))),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                      // minimumSize:
                      //     const MaterialStatePropertyAll(Size.fromWidth(100)),
                      fixedSize:
                          const MaterialStatePropertyAll(Size.fromWidth(300)),
                      backgroundColor: CheckAns(2),
                    ),
                    onPressed: () {
                      setState(() {
                        if (selectedAnswerIndex == -1) {
                          selectedAnswerIndex = 2;
                        }
                      });
                    },
                    child:
                        Text("C.${questionList[questionIndex]["options"][2]}",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                            ))),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                      // minimumSize:
                      //     const MaterialStatePropertyAll(Size.fromWidth(100)),
                      fixedSize:
                          const MaterialStatePropertyAll(Size.fromWidth(300)),
                      backgroundColor: CheckAns(3),
                    ),
                    onPressed: () {
                      setState(() {
                        if (selectedAnswerIndex == -1) {
                          selectedAnswerIndex = 3;
                        }
                      });
                    },
                    child:
                        Text("D.${questionList[questionIndex]["options"][3]}",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                            ))),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              setState(() {
                pageValidation();
              });
            },
            backgroundColor: Colors.purple,
            child: const Icon(
              Icons.forward,
              color: Colors.white,
            ),
          ));
    } else {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          centerTitle: true,
          title: const Text(
            "Quiz App",
            style: TextStyle(
                fontWeight: FontWeight.w800, fontSize: 30, color: Colors.white),
          ),
        ),
        body: Center(
          child: Column(children: [
            const SizedBox(
              height: 20,
            ),
            Image.network(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTmoGE8pGXE4aUURpYIETqvw6W5RZB-iVvKdw&usqp=CAU",
              height: 350,
              width: 350,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text("Congratulation You Have Sccessfully Completed Test ",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                )),
            const SizedBox(
              height: 20,
            ),
            Text("Score $correctAnsCount/${questionList.length}",
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                )),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                style: const ButtonStyle(
                  fixedSize: MaterialStatePropertyAll(Size(100, 50)),
                  backgroundColor: MaterialStatePropertyAll(Colors.purple),
                ),
                onPressed: () {
                  setState(() {
                    questionIndex = 0;
                    selectedAnswerIndex = -1;
                    isScreen = true;
                    correctAnsCount = 0;
                  });
                },
                child: const Text(
                  "Reset",
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                      fontSize: 18),
                ))
          ]),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return screenCheck();
  }
}
