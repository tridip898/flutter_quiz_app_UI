import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/screen/quiz_page.dart';
import 'package:get/get.dart';

class SubjectPage extends StatefulWidget {
  const SubjectPage({Key? key}) : super(key: key);

  @override
  State<SubjectPage> createState() => _SubjectPageState();
}

class _SubjectPageState extends State<SubjectPage> {

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
                  IconButton(onPressed: (){
                    Get.back();
                  }, icon: Icon(Icons.arrow_back,size: 28,)),
                  Text("Back",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),)
                ],
              ),
              SizedBox(height: 20,),
              Center(child: Text(Get.arguments['subName'],style: TextStyle(fontSize: 33,fontWeight: FontWeight.w600,color: Colors.blueGrey.shade700),)),
              SizedBox(height: 20,),
              Center(child: Image.asset(Get.arguments['image'],height: 300,)),
              SizedBox(height: 10,),
              Text("Choose your level",style: TextStyle(fontSize: 18,color: Colors.grey),),
              SizedBox(height: 10,),
              Expanded(
                child: ListView(
                  children: [
                    InkWell(
                      onTap: (){
                        Get.to(()=>Quizpage());
                      },
                      child: Container(
                        height: 60,
                        alignment: Alignment.center,
                        margin: EdgeInsets.symmetric(vertical: 05),
                        decoration: BoxDecoration(
                            color: Colors.brown,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: Colors.grey.shade300,width: 1.4)
                        ),
                        child: Text("Easy",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.white),),
                      ),
                    ),
                    InkWell(
                        onTap: (){
                          Get.to(()=>Quizpage());
                        },
                      child: Container(
                        height: 60,
                        alignment: Alignment.center,
                        margin: EdgeInsets.symmetric(vertical: 05),
                        decoration: BoxDecoration(
                            color: Colors.brown,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: Colors.grey.shade300,width: 1.4)
                        ),
                        child: Text("Medium",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.white),),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        Get.to(()=>Quizpage());
                      },
                      child: Container(
                        height: 60,
                        alignment: Alignment.center,
                        margin: EdgeInsets.symmetric(vertical: 05),
                        decoration: BoxDecoration(
                            color: Colors.brown,
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: Colors.grey.shade300,width: 1.4)
                        ),
                        child: Text("Hard",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.white),),
                      ),
                    )
                  ],
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}
