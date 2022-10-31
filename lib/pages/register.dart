
import 'package:flutter/material.dart';
import 'package:perli/network_utils/api.dart';
import 'package:perli/pages/login.dart';


 class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {


  DatabaseHelper api = DatabaseHelper();
  String msgStatus = '';

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  _onPressed(){
    setState(() {
      if(_emailController.text.trim().toLowerCase().isNotEmpty &&
          _passwordController.text.trim().isNotEmpty ){
        api.registerData(_nameController.text.trim(),_emailController.text.trim().toLowerCase(),

            _passwordController.text.trim()).whenComplete((){
          if(api.status){
            _showDialog(BuildContext context){
              showDialog(
                context: context,
                  builder:(BuildContext context){
                    return AlertDialog(
                      title: const Text('Failed'),
                      content:  const Text('Check your email or password'),
                      actions: <Widget>[
                        ElevatedButton(

                          child: const Text(
                            'Close',
                          ),

                          onPressed: (){
                            Navigator.of(context).pop();
                          },

                        ),
                      ],
                    );
                  },
              );
            }
            msgStatus = 'Check email or password';
          }else{
            // Navigator.pushReplacementNamed(context, '/dashboard');

            msgStatus = 'success';
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Register',
      home: Scaffold(
        // appBar: AppBar(
        //   title:  Text('Register'),
        // ),
        body: ListView(
          padding: const EdgeInsets.only(top: 62,left: 12.0,right: 12.0,bottom: 12.0),
          children: <Widget>[
            SizedBox(
              height: 50,
              child: TextField(
                controller: _nameController,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  hintText: 'Place your name',
                  icon: Icon(Icons.person),
                ),
              ),
            ),
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
            const Padding(padding: EdgeInsets.only(top: 44.0),),

            SizedBox(
              height: 50,
              child: ElevatedButton(
                onPressed: _onPressed,
                // color: Colors.blue,
                child: const Text(
                  'Register',
                  style: TextStyle(
                      color: Colors.white,
                      backgroundColor: Colors.blue),),
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 44.0),),

            SizedBox(
              height: 50,
              child: Text(
                msgStatus,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(padding: EdgeInsets.only(top: 0.0),),
            SizedBox(
              height: 50,
              child: ElevatedButton(
                onPressed: ()=>Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) => const LoginPage(),
                    )
                ),
                // color: Colors.blue,
                child: const Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                  ),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

  // void _showDialog(BuildContext context){
  //   showDialog(
  //      context: context,
  //       builder:(BuildContext context){
  //         return AlertDialog(
  //           title: const Text('Failed'),
  //           content:  const Text('Check your email or password'),
  //           actions: <Widget>[
  //             ElevatedButton(

  //               child: const Text(
  //                 'Close',
  //               ),

  //               onPressed: (){
  //                 Navigator.of(context).pop();
  //               },

  //             ),
  //           ],
  //         );
  //       },
  //   );
  // }