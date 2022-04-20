import 'package:flutter/material.dart';
import 'package:hr_app/screens/Sign_in.dart';
import 'package:hr_app/screens/login_page.dart';
class OnBoardingScreen extends StatefulWidget {
  static const String id = "onboard-screen";
  const OnBoardingScreen({ Key? key }) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Color(0xffffbf08),
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Image.asset('assets/images/img1.png'),
                Positioned(
                  bottom: 120,
                  child: Column(
                    children: [
                      MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        color: Color(0xffff5f30),
                        padding: EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 10,
                        ),
                        onPressed: () {
                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (context) => SignInPage()));
                        Navigator.pushNamed(context, SignInPage.id);
                        },
                        child: Text(
                          'Student',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),SizedBox(height: 10,),
                       MaterialButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        color: Color(0xffff5f30),
                        padding: EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical: 10,
                        ),
                        onPressed: () {
                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (context) => SignInPage()));
                        Navigator.pushNamed(context, LoginPage.id);
                        },
                        child: Text(
                          'Teacher',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
        ),
      ),
    );
  }
}