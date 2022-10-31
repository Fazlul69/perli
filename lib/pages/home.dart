import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:perli/pages/login.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          Column(
            children: [
              Container(
            alignment: Alignment.topCenter,
          padding: const EdgeInsets.only(
              top: 50,
              right: 20.0,
              left: 20.0),
            
            child:Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0)
            ),
            elevation: 20.0,
            child: Column(
              children: [
                // ignore: avoid_unnecessary_containers
                Container(
                  margin: const EdgeInsets.only(left: 20.0, top: 40.0,),
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Preli Test",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    ),),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20.0, top: 10.0,),
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Bank Job Preparation Platform",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    ),),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20.0, top: 20.0,),
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text("কোর্স প্ল্যান অনুযায়ী ব্যাংক প্রিলি ও রিটেন প্রস্তুতির জন্য 01716417634 এই নাম্বারে বিকাশ/রকেট/নগদ দিয়ে সেন্ডমানি করে নিচের ফেসবুক লিংকে ইন করে সেন্ড মানির স্কিনশট ইনবক্স করে কনফার্ম করেন। ফেসবুক লিংকঃ https://www.facebook.com/prelitest01.",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    ),),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20.0, top: 20.0, bottom: 10.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginPage()),
                      );
                      }, 
                      child: Text("Get Started"),
                    ),
                  ),
                ),
              ],
            ),
          ) ,
          ),
          Container(
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.only(
              top: 50,
              right: 20.0,
              left: 20.0),
            
            child:Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0)
            ),
            elevation: 20.0,
            child: Row(
              children: [
                // ignore: avoid_unnecessary_containers
                Container(
                  width: 50,
                  margin: const EdgeInsets.only(left: 30.0, top: 0.0,),
                  // decoration: BoxDecoration(
                  //   shape: BoxShape.circle,
                  //   border: Border.all(width: 25, color: Colors.blue),
                  // ),
                  child: const Align(
                    // alignment: Alignment.centerRight,
                    child: Icon(FontAwesomeIcons.phone,
                    size: 50,),
                  ),
                ),
                Column(
                  children:[
                  Container(
                  margin: const EdgeInsets.only(left: 0.0, top: 10.0,),
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Contact Info",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    ),),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20.0, top: 5.0,bottom: 10.0),
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text("01716-417634",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    ),),
                  ),
                ),
              ],),
              ],
            ),
          ) ,
          ),
          Container(
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.only(
              top: 50,
              right: 20.0,
              left: 20.0),
            
            child:Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0)
            ),
            elevation: 20.0,
            child: Row(
              children: [
                // ignore: avoid_unnecessary_containers
                Container(
                  width: 50,
                  margin: const EdgeInsets.only(left: 20.0, top: 0.0,),
                  // decoration: BoxDecoration(
                  //   shape: BoxShape.circle,
                  //   border: Border.all(width: 25, color: Colors.blue),
                  // ),
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Icon(FontAwesomeIcons.facebook,
                    size: 50,
                    ),
                  ),
                ),
                Column(
                  children:[
                  Container(
                  transform: Matrix4.translationValues(-25.0, 0.0, 0.0),
                  margin: const EdgeInsets.only(left: 0.0, top: 10.0,),
                  child: 
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Facebook Page",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    ),),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20.0, top: 5.0,),
                  transform: Matrix4.translationValues(5.0, 0.0, 0.0),
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Bank Recruitment Exam \n Boost",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    ),),
                  ),
                ),
              ],),
              ],
            ),
          ) ,
          ),
          Container(
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.only(
              top: 50,
              bottom: 50,
              right: 20.0,
              left: 20.0),
            
            child:Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4.0)
            ),
            elevation: 20.0,
            child: Row(
              children: [
                // ignore: avoid_unnecessary_containers
                Container(
                  width: 50,
                  margin: const EdgeInsets.only(left: 20.0, top: 0.0,),
                  child: const Align(
                    // alignment: Alignment.centerLeft,
                    child: Icon(FontAwesomeIcons.map,size: 50,),
                  ),
                ),
                Column(
                  children:[
                  Container(
                  transform: Matrix4.translationValues(-40.0, 0.0, 0.0),
                  margin: const EdgeInsets.only(left: 0.0, top: 10.0,),
                  child: const Align(
                    alignment: Alignment.topLeft,
                    child: Text("Our Address",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    ),),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20.0, top: 5.0,),
                  transform: Matrix4.translationValues(10.0, 0.0, 0.0),
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Kataikhana More, Kushtia \n Sadar, Kushtia",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                    fontSize:20,
                    fontWeight: FontWeight.bold,
                    ),),
                  ),
                ),
              ],),
              ],
            ),
          ) ,
          ),
            ],
          ),      
        ],
      ),
    );
  }
}