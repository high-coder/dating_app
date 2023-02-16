// ignore_for_file: use_build_context_synchronously

import 'package:dating_app_final/screens/homeScreen/mainHome.dart';
import 'package:dating_app_final/screens/login/login_screen.dart';
import 'package:dating_app_final/utils/our_colours.dart';

import 'package:flutter/material.dart';

import 'package:pin_code_fields/pin_code_fields.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen({super.key, this.phoneno});

  String otp = '';
  final String? phoneno;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 36,
                height: 36,
                margin: const EdgeInsets.only(top: 28, left: 24),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(.04),
                    border: Border.all(width: 1, color: MyColors.white12)),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white.withOpacity(.92),
                    size: 18,
                  ),
                ),
              ),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Flexible(
                      child: Container(
                        margin:
                            const EdgeInsets.only(top: 28, left: 24, right: 24),
                        width: double.infinity,
                        child: RichText(
                          text: TextSpan(
                            text: 'Enter the ',
                            // style: CustomTextStyle.H2.copyWith(
                            //   color: Colors.white.withOpacity(.92),
                            // ),
                            style: TextStyle(color: Colors.black),
                            children: [
                              TextSpan(
                                text: 'Code',
                                style: TextStyle(color: Colors.pinkAccent),
                                // style: CustomTextStyle.H2.copyWith(
                                //   color: Color(0xffD682FF),
                                // ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin:
                          const EdgeInsets.only(top: 20, left: 24, right: 24),
                      width: double.infinity,
                      child: Wrap(
                        children: [
                          Text(
                            'We sent a code on $phoneno. Make sure you have mobile signal to recieve the code',
                            // style: CustomTextStyle.B1.copyWith(
                            //   color: Colors.white.withOpacity(.60),
                            // ),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      child: Container(
                          height: 64,
                          margin: const EdgeInsets.only(
                              left: 24, top: 18, right: 24),
                          child: PinCodeTextField(
                            autoFocus: true,
                            keyboardType: TextInputType.number,
                            // textStyle: CustomTextStyle.H2
                            //     .copyWith(color: Colors.white.withOpacity(.92)),
                            pinTheme: PinTheme(
                              shape: PinCodeFieldShape.box,
                              borderRadius: BorderRadius.circular(5),
                              fieldHeight: 50,
                              inactiveColor: Colors.black.withOpacity(.12),
                              selectedColor: Colors.black.withOpacity(.92),
                              activeColor: Colors.black.withOpacity(.12),
                            ),
                            appContext: context,
                            length: 6, onChanged: (String value) {},
                          )),
                    ),
                    GestureDetector(
                      onTap: () {
                        // _navigateToOTPScreen(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
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
                        child: Text('Continue',
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
}
