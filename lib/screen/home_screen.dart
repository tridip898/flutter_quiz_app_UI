import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/screen/subject_page.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List sub=[];

  _readData() async{
    await DefaultAssetBundle.of(context).loadString("lib/json/subject_list.json").then((value) {
      setState(() {
        sub=json.decode(value);
      });
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    _readData();
    super.initState();
  }

  List color=[
    Colors.orangeAccent,
    Colors.pinkAccent,
    Colors.greenAccent,
    Colors.blue,
    Colors.deepPurpleAccent,
    Colors.blueGrey
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
          padding: EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.shade300.withOpacity(0.5),
                              blurRadius: 10)
                        ]),
                    padding: EdgeInsets.all(10),
                    child: Icon(
                      Icons.menu,
                      size: 30,
                    ),
                  ),
                  Expanded(child: Container()),
                  Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade300.withOpacity(0.5),
                                blurRadius: 10)
                          ]),
                      padding: EdgeInsets.all(8),
                      child: Image.asset(
                        "lib/icons/profile.png",
                        height: 40,
                      )),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Hey Tridip, what subject\nyou want to improve today?",
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 1.07,
                        crossAxisCount: 2),
                    itemCount: sub.length,
                    itemBuilder: (_, index) {
                      return InkWell(
                        onTap: (){
                          Get.to(()=>SubjectPage(),arguments: {
                            'subName':sub[index]['subName'].toString(),
                            'image':sub[index]['image'].toString()
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.shade200.withOpacity(0.4),
                                blurRadius: 10
                              )
                            ]
                          ),
                          padding: EdgeInsets.only(left: 10,right: 10,top: 15),
                          child: Column(
                            children: [
                              Image.asset(sub[index]['image'],height: 80,),
                              SizedBox(height: 7,),
                              Text(sub[index]['subName'],style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                              SizedBox(height: 10,),
                              LinearPercentIndicator(
                                percent: sub[index]['percent'],
                                progressColor: color[index],
                                lineHeight: 7,
                                backgroundColor: Colors.grey.shade300,
                                barRadius: Radius.circular(30),
                              )
                            ],
                          ),
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
