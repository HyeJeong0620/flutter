import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'main_page.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LogInState();
}

class _LogInState extends State<LoginPage> {
  TextEditingController controller = TextEditingController();
  TextEditingController controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Stack(
          children: [
            Positioned(
              child: SvgPicture.asset(
                'assets/images/Login.svg', // 경로를 실제 이미지 경로로 변경
                fit: BoxFit.cover,
              ),
            ),
            SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    Padding(padding: EdgeInsets.only(top: 300)),
                    Form(
                      child: Theme(
                        data: ThemeData(
                          primaryColor: Colors.grey,
                          inputDecorationTheme: InputDecorationTheme(
                            labelStyle: TextStyle(color: Colors.teal, fontSize: 15.0),
                          ),
                        ),
                        child: Container(
                          padding: EdgeInsets.all(20.0),
                          width: MediaQuery.of(context).size.width < 360
                              ? MediaQuery.of(context).size.width * 0.9
                              : 360,
                          child: Builder(builder: (context) {
                            return Column(
                              children: [
                                TextField(
                                  controller: controller,
                                  autofocus: true,
                                  decoration: InputDecoration(
                                    labelText: 'Enter email',
                                    labelStyle: TextStyle(color: Colors.grey),
                                    filled: true,
                                    fillColor: Colors.white,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: BorderSide.none,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: BorderSide(color: Colors.grey),
                                    ),
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                ),
                                SizedBox(height: 20.0),
                                TextField(
                                  controller: controller2,
                                  decoration: InputDecoration(
                                    labelText: 'Enter password',
                                    labelStyle: TextStyle(color: Colors.grey),
                                    filled: true,
                                    fillColor: Colors.white,
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: BorderSide.none,
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: BorderSide(color: Colors.grey),
                                    ),
                                  ),
                                  keyboardType: TextInputType.text,
                                  obscureText: true, // 비밀번호 안보이도록 하는 것
                                ),
                                SizedBox(height: 40.0),
                                ButtonTheme(
                                  minWidth: 22200.0,
                                  height: 50.0,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      if (controller.text == '1234' && controller2.text == '1234') {
                                        Navigator.pushNamed(context, '/main');
                                      } else if (controller.text == '1234' && controller2.text != '1234') {
                                        showSnackBar(context, Text('Wrong password'));
                                      } else if (controller.text != '1234' && controller2.text == '1234') {
                                        showSnackBar(context, Text('Wrong email'));
                                      } else {
                                        showSnackBar(context, Text('Check your info again'));
                                      }
                                    },
                                    child: Text(
                                      'Login',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                      ),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xFF1270B0),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void showSnackBar(BuildContext context, Text text) {
  final snackBar = SnackBar(
    content: text,
    backgroundColor: Color.fromARGB(255, 112, 48, 48),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
