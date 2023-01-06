import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiver/async.dart';

class Quizpage extends StatefulWidget {
  const Quizpage({Key? key}) : super(key: key);

  @override
  State<Quizpage> createState() => _QuizpageState();
}

class _QuizpageState extends State<Quizpage> {
  int _start = 59;
  int _current = 59;

  void startTimer() {
    CountdownTimer countDownTimer = new CountdownTimer(
      new Duration(seconds: _start),
      new Duration(seconds: 1),
    );

    var sub = countDownTimer.listen(null);
    sub.onData((duration) {
      setState(() {
        _current = _start - duration.elapsed.inSeconds;
      });
    });

    sub.onDone(() {
      print("Done");
      sub.cancel();
    });
  }

  List data=[
    ["1","16 inches"],
    ["2","24 inches"],
    ["3","20 inches"],
    ["4","18 inches"],
  ];
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: height,
          width: width,
          padding: EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        Icons.arrow_back_sharp,
                        size: 28,
                      )),
                  Text(
                    "Back",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                  Expanded(child: Container()),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(color: Colors.grey.shade200, blurRadius: 10)
                        ]),
                    padding: EdgeInsets.all(20),
                    child: Text(
                      "00:$_current",
                      style: TextStyle(fontSize: 20),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  "Question 2",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  "What's the diameter of a basketball hoop in inches?",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Center(
                child: Image.asset(
                  "lib/icons/player.png",
                  height: 220,
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 2.5),
                    itemCount: 4,
                    itemBuilder: (_, index) {
                      return Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade200, blurRadius: 10)
                            ]),
                        padding: EdgeInsets.only(left: 20),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.pinkAccent.withOpacity(0.2)
                              ),
                              padding: EdgeInsets.all(10),
                              child: Text(data[index][0],style: TextStyle(fontSize: 18),),
                            ),
                            SizedBox(width: 10,),
                            Text(data[index][1],style: TextStyle(fontSize: 18),)
                          ],
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
