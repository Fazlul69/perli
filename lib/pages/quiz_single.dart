import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SinlgePageQuiz extends StatefulWidget {
  String durl;
  SinlgePageQuiz({Key? key, required this.durl}) : super(key: key);

  @override
  State<SinlgePageQuiz> createState() => _SinlgePageQuizState(durl: durl);
}

class _SinlgePageQuizState extends State<SinlgePageQuiz> {
  String durl;
  _SinlgePageQuizState({required this.durl});

  List data = [];
    int index = 0;

    Future _getdata() async {
    var url = durl;
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      setState(() {
        data = jsonData["questions"];
      });
    }
    print(data);
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
        child: Text(data.toString(),),
    );
  }
}
