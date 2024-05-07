import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:Electronic_Store/core/utlis/routes.dart';
import 'package:Electronic_Store/core/utlis/styles.dart';
import 'package:Electronic_Store/core/widgets/buttons.dart';
import 'package:Electronic_Store/features/authintication/login/presentation/views/widgets/custom_form_field.dart';

class VerificationView extends StatelessWidget {
  const VerificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 25, left: 20, right: 20),
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Color(0xffF7F7F9)),
                      child: IconButton(
                          onPressed: () {
                            GoRouter.of(context).pop();
                          },
                          icon: Icon(Icons.arrow_back))),
                ),
                Text(
                  'OTP Verification',
                  style: Styles.textStyle30.copyWith(
                      fontSize: 32,
                      fontWeight: FontWeight.w900,
                      color: const Color(0xff2B2B2B)),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  'Please check your email to see the\n verification code',
                  textAlign: TextAlign.center,
                  style: Styles.textStyle16
                      .copyWith(color: const Color(0xff707B81)),
                ),
                const SizedBox(
                  height: 30,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'OTP Code',
                    textAlign: TextAlign.center,
                    style: Styles.textStyle16.copyWith(
                        color: const Color(0xff2B2B2B),
                        fontWeight: FontWeight.w600,
                        fontSize: 21),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        width: 70,
                        height: 56,
                        child: const CustomTextFormFieldForNumbers(hint: 'x')),
                    Container(
                        width: 70,
                        height: 56,
                        child: const CustomTextFormFieldForNumbers(hint: 'x')),
                    Container(
                        width: 70,
                        height: 56,
                        child: const CustomTextFormFieldForNumbers(hint: 'x')),
                    Container(
                        width: 70,
                        height: 56,
                        child: const CustomTextFormFieldForNumbers(hint: 'x')),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                const ButtonAction(
                  color: Color(0xff0D6EFD),
                  text: 'verify',
                ),
                const SizedBox(
                  height: 24,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
