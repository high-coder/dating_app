import 'package:dating_app_final/screens/login/otp_screen.dart';

import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

class PhoneNumberScreen extends StatelessWidget {
  static const String routeNamed = '/phone_number_screen';

  PhoneNumberScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Container(
                        margin:
                            const EdgeInsets.only(top: 92, left: 26, right: 52),
                        width: 312,
                        child: RichText(
                          text: const TextSpan(
                            text: 'Welcome to ',
                            style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w700,
                                color: Colors.black
                                // letterSpacing: -.25,
                                // height: 36,
                                ),
                            children: [
                              TextSpan(
                                text: 'Dating',
                                // style: CustomTextStyle.H2.copyWith(
                                //   color: const Color(0xffD682FF),
                                // ),
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.pinkAccent,
                                  // letterSpacing: -.25,
                                  // height: 36,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                        height: 400,
                        width: 400,
                        child: Lottie.network(
                            'https://assets3.lottiefiles.com/packages/lf20_XRMbLmFEl3.json')),
                    SizedBox(
                      height: 40,
                    ), //Spacer(flex: 1),
                    Flexible(
                      child: Container(
                        margin:
                            const EdgeInsets.only(top: 20, left: 24, right: 24),
                        width: double.infinity,
                        child: Text(
                          'Enter your phone number and we will send you a message with the code',
                          // style: CustomTextStyle.B1.copyWith(
                          //     color: Colors.white.withOpacity(.60))
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Container(
                      width: double.infinity,
                      margin:
                          const EdgeInsets.only(left: 24, top: 30, right: 24),
                      child: GestureDetector(
                        onTap: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              flex: 2,
                              child: TextField(
                                autofocus: true,
                                keyboardType: TextInputType.number,
                                // style: CustomTextStyle.L1.copyWith(
                                //   color: Colors.white.withOpacity(.92),
                                // ),
                                decoration: InputDecoration(
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 1,
                                      color: Colors.white,
                                    ),
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      width: 1,
                                      color: Colors.white,
                                    ),
                                  ),
                                  focusColor: Colors.white,
                                  hintText: 'Enter Phone Number',
                                  // hintStyle: CustomTextStyle.L1.copyWith(
                                  //     color: Colors.white.withOpacity(.32))
                                ),
                                cursorColor: const Color(0xffD682FF),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    GestureDetector(
                      onTap: () {
                        _navigateToOTPScreen(context);

                        // ignore: use_build_context_synchronously
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        height: 48,
                        margin:
                            const EdgeInsets.only(top: 17, left: 26, right: 24),
                        decoration: (true)
                            ? BoxDecoration(
                                // color: const Color(0xffD682FF),
                                borderRadius: BorderRadius.circular(47),
                                gradient: const LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [
                                    Colors.red,
                                    Colors.pinkAccent,
                                  ],
                                  stops: [.1, .7],
                                ),
                                border: Border.all(
                                  color: const Color(0xffd682ff),
                                  width: 0.75,
                                ),
                              )
                            : BoxDecoration(
                                borderRadius: BorderRadius.circular(47),
                                color: Colors.white.withOpacity(.04),
                              ),
                        child: Text('Continue with phone →',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToOTPScreen(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => OtpScreen()));
  }
}
