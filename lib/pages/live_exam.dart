import 'package:flutter/material.dart';
import 'package:perli/network_utils/api.dart';
import 'package:perli/pages/quiz_single.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class LiveExamPage extends StatefulWidget {
  const LiveExamPage({super.key});

  @override
  State<LiveExamPage> createState() => _LiveExamPageState();
}

class _LiveExamPageState extends State<LiveExamPage> {
  final TextEditingController _pinCode = TextEditingController();
  DatabaseHelper api = DatabaseHelper();

  String msgStatus = '';
  bool userlogincheck = false;
  List data = [];
  int index = 0;

  Future _getdata() async {
    var url = "https://prelitest.com/api/quiz-all-public";
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      setState(() {
        data = jsonData["quiz"];
      });
    }
  }

  @override
  void initState() {
    _getdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemCount: data == null ? 0 : data.length,
      itemBuilder: (BuildContext context, int index) {
        return new Card(
          child: Column(
            children: [
              Container(
                child: new Text("Name: ${data[index]["name"]}"),
              ),
              Container(
                child: new Text("ID: ${data[index]["id"]}"),
              ),
              Container(
                child: new Text("Date: ${data[index]["start_date"]}"),
              ),
              Container(
                child: new Text("Time: ${data[index]["start_time"]}"),
              ),
              Container(
                child: new Text("Total Participate: ${data[index][[
                  "total_participates"
                ]]}"),
              ),
              Container(
                margin:
                    const EdgeInsets.only(left: 20.0, top: 20.0, bottom: 10.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: ElevatedButton(
                    onPressed: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      userlogincheck = prefs.getBool("isloging")!;
                      if (userlogincheck) {
                        showDataAlert();
                      } else {
                        
                      }

                      //   Navigator.push(
                      //   context,
                      //   MaterialPageRoute(builder: (context) => SinlgePageQuiz(durl: "https://prelitest.com/api/quiz-verify/${data[index]["id"]}")),
                      // );
                    },
                    child: const Text("Get Started"),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void showDataAlert() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  20.0,
                ),
              ),
            ),
            contentPadding: const EdgeInsets.only(
              top: 10.0,
            ),
            title: const Text(
              "Quiz Room Pin Code",
              style: TextStyle(fontSize: 24.0),
            ),
            content: SizedBox(
              height: 200,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Pin Code",
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: _pinCode,
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter Id here',
                            labelText: 'ID'),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 60,
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_pinCode.text == "${(data[index]["pin"])}") {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SinlgePageQuiz(
                                      durl:
                                          "https://prelitest.com/api/questions-by-quiz-public/"
                                          "${(data[index]["id"])}")),
                            );
                          } else {
                            print("wrong");
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.black,
                        ),
                        child: const Text(
                          "Submit",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
