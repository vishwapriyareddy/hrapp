import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hr_app/palatte.dart';

import '../widgets/widgets.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundImage(),
        Scaffold(
          appBar: AppBar(),
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 150,
                    child: Center(
                      child: Text(
                        'LOGO',
                        style: kHeading,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            TextInput(
                              hint: 'Email',
                              inputAction: TextInputAction.next,
                              icon: FontAwesomeIcons.solidEnvelope,
                              inputType: TextInputType.emailAddress,
                            ),
                            PasswordInput(
                              hint: 'Password',
                              inputAction: TextInputAction.done,
                              icon: FontAwesomeIcons.lock,
                              //  inputType: TextInputType.emailAddress,
                            ),
                            Text(
                              'Forgot Password?',
                              style: kBodyText,
                            )
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(
                              height: 100,
                            ),
                            RoundedButton(
                              buttonText: 'Login',
                            ),
                            SizedBox(
                              height: 80,
                            ),
                            Container(
                              child: Text(
                                'CreateNewAccount',
                                style: kBodyText,
                              ),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Colors.white, width: 1))),
                            ),
                            SizedBox(
                              height: 30,
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
