import 'package:flutter/material.dart';
import 'package:perli/network_utils/api.dart';
import 'package:perli/pages/live_exam.dart';
import 'package:perli/pages/register.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


  read() async {
    final prefs = await SharedPreferences.getInstance();
    const key = 'logintoken';
    final value = prefs.get(key) ?? 0;

    // if(value != '0'){
    //   // ignore: use_build_context_synchronously
    //   Navigator.of(context).push(
    //       MaterialPageRoute(
    //         builder: (BuildContext context) => const LiveExamPage(),
    //       )
    //   );
    // }
  }

  @override
  initState() {
    read();
  }

  DatabaseHelper api = DatabaseHelper();
  String msgStatus = '';

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  _onPressed() {
    setState(() {
      if (_emailController.text.trim().toLowerCase().isNotEmpty &&
          _passwordController.text.trim().isNotEmpty) {
        api
            .loginData(_emailController.text.trim().toLowerCase(),
                _passwordController.text.trim())
            .whenComplete(() {
          if (api.status) {
            _showDialog(BuildContext context) {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      // contentPadding: EdgeInsets.only(top: ),
                      title: const Text('Failed'),
                      content: const Text('Check your email or password'),
                      actions: <Widget>[
                        ElevatedButton(
                          child: const Text(
                            'Close',
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  });
            }

            msgStatus = 'Wrong User Credentials! Please try again';
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LiveExamPage()),
            );
            print(read().toString());
            //  Navigator.pushReplacementNamed(context, '/dashboard');

          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.only(
            top: 62, left: 12.0, right: 12.0, bottom: 12.0),
        children: <Widget>[
          SizedBox(
            height: 50,
            child: TextField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'Email',
                hintText: 'Place your email',
                icon: Icon(Icons.email),
              ),
            ),
          ),
          SizedBox(
            height: 50,
            child: TextField(
              controller: _passwordController,
              keyboardType: TextInputType.text,
              decoration: const InputDecoration(
                labelText: 'Password',
                hintText: 'Place your password',
                icon: Icon(Icons.vpn_key),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 44.0),
          ),
          SizedBox(
            height: 50,
            child: ElevatedButton(
              onPressed: _onPressed,
              // color: Colors.blue,
              child: const Text(
                'Login',
                style: TextStyle(
                    color: Colors.white, backgroundColor: Colors.blue),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 44.0),
          ),
          const SizedBox(
            child: Text(
              "Do not have any account yet? Go To",
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 50,
            child: Text(
              msgStatus,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 0.0),
          ),
          SizedBox(
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RegisterPage()),
                );
              },
              // color: Colors.blue,
              child: const Text(
                'Register',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
      // ignore: dead_code
    );
  }
}

// void _showDialog(BuildContext context){
//     showDialog(
//       context:context ,
//       builder:(BuildContext context){
//         return AlertDialog(
//           title: new Text('Failed'),
//           content:  new Text('Check your email or password'),
//           actions: <Widget>[
//             new ElevatedButton(

//               child: new Text(
//                 'Close',
//                  ),

//               onPressed: (){
//                 Navigator.of(context).pop();
//               },

//             ),
//           ],
//         );
//       }
//     );
//   }