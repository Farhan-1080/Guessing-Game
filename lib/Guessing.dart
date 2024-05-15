// import 'package:flutter/material.dart';
// import 'dart:math';
// import 'package:fluttertoast/fluttertoast.dart';

// class Guessing extends StatefulWidget {
//   const Guessing({super.key});

//   @override
//   State<Guessing> createState() => _GuessingState();
// }

// class _GuessingState extends State<Guessing> {
//   Random random = Random();
//   late int optionRandom;
//   late List<int> randomRs;
//   late List<int> randomGs;
//   late List<int> randomBs;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     changeColor() {
//       optionRandom = random.nextInt(4);
//       randomRs = List.generate(4, (index) => random.nextInt(256));
//       randomGs = List.generate(4, (index) => random.nextInt(256));
//       randomBs = List.generate(4, (index) => random.nextInt(256));
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'RGB ${randomRs[optionRandom]},${randomGs[optionRandom]},${randomBs[optionRandom]}',
//               style: const TextStyle(
//                 fontSize: 30,
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//             const SizedBox(
//               height: 50,
//             ),
//             Wrap(
//               spacing: 20,
//               runSpacing: 30,
//               children: [
//                 for (int i = 0; i < randomRs.length; i++)
//                   GestureDetector(
//                     onTap: () {
//                       if (randomRs[optionRandom] == randomRs[i]) {
//                         Fluttertoast.showToast(
//                           msg: "Correct",
//                           toastLength: Toast.LENGTH_SHORT,
//                           textColor: Colors.white,
//                           backgroundColor: Colors.green,
//                           fontSize: 18,
//                           gravity: ToastGravity.BOTTOM,
//                           timeInSecForIosWeb: 1,
//                         );
//                         print("Correct");
//                       } else {
//                         Fluttertoast.showToast(
//                           msg: "Wrong",
//                           toastLength: Toast.LENGTH_SHORT,
//                           textColor: Colors.white,
//                           backgroundColor: Colors.red,
//                           fontSize: 18,
//                           gravity: ToastGravity.BOTTOM,
//                           timeInSecForIosWeb: 1,
//                         );
//                         print("Wrong");
//                         Container(
//                           height: 150,
//                           width: 150,
//                           decoration: BoxDecoration(
//                               color: Color.fromRGBO(
//                                   randomRs[optionRandom],
//                                   randomGs[optionRandom],
//                                   randomBs[optionRandom],
//                                   1),
//                               border: Border.all(color: Colors.black)),
//                         );
//                       }
//                     },
//                     child: Container(
//                       height: 150,
//                       width: 150,
//                       color: Color.fromRGBO(
//                           randomRs[i], randomGs[i], randomBs[i], 1),
//                     ),
//                   ),
//               ],
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             ElevatedButton(
//               child: const Text("NEXT"),
//               onPressed: () {
//                 setState(() {});
//               },
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'dart:math';
import 'package:fluttertoast/fluttertoast.dart';

class Guessing extends StatefulWidget {
  const Guessing({Key? key}) : super(key: key);

  @override
  State<Guessing> createState() => _GuessingState();
}

class _GuessingState extends State<Guessing> {
  int score = 0;
  Random random = Random();
  late int optionRandom;
  late List<int> randomRs;
  late List<int> randomGs;
  late List<int> randomBs;
  int? correctIndex;

  @override
  void initState() {
    super.initState();
    changeColor();
  }

  void changeColor() {
    optionRandom = random.nextInt(4);
    randomRs = List.generate(4, (index) => random.nextInt(256));
    randomGs = List.generate(4, (index) => random.nextInt(256));
    randomBs = List.generate(4, (index) => random.nextInt(256));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        backgroundColor: Colors.lightBlue,
        centerTitle: true,
        title: const Text(
          "Color Guessing Game",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'RGB (${randomRs[optionRandom]},${randomGs[optionRandom]},${randomBs[optionRandom]})',
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Wrap(
              spacing: 20,
              runSpacing: 30,
              children: [
                for (int i = 0; i < randomRs.length; i++)
                  GestureDetector(
                    onTap: () {
                      if (randomRs[optionRandom] == randomRs[i]) {
                        Fluttertoast.showToast(
                          msg: "Correct",
                          toastLength: Toast.LENGTH_SHORT,
                          textColor: Colors.white,
                          backgroundColor: Colors.green,
                          fontSize: 18,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                        );
                        setState(() {
                          correctIndex = i;
                          changeColor();
                          correctIndex = null;
                          score++;
                        });
                      } else {
                        Fluttertoast.showToast(
                          msg: "Wrong",
                          toastLength: Toast.LENGTH_SHORT,
                          textColor: Colors.white,
                          backgroundColor: Colors.red,
                          fontSize: 18,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                        );
                        setState(() {
                          correctIndex = optionRandom;
                          //
                          if (score > 0) {
                            score--;
                          }
                        });
                      }
                    },
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(
                          randomRs[i],
                          randomGs[i],
                          randomBs[i],
                          1,
                        ),
                        border: Border.all(
                          color: correctIndex == i
                              ? Colors.black
                              : Colors.transparent,
                          width: 5,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 20,
              child: Text(
                "Your score: $score",
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: const Text("Reset"),
              onPressed: () {
                setState(() {
                  changeColor();
                  correctIndex = null;
                  score = 0;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
