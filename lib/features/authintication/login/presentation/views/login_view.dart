import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shoes_store/core/utlis/routes.dart';
import 'package:shoes_store/core/utlis/styles.dart';
import 'package:shoes_store/core/widgets/buttons.dart';
import 'package:shoes_store/features/authintication/login/presentation/views/widgets/custom_form_field.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(
            top: 60,
            left: 20,
            right: 20,
          ),
          child: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Hello Again!',
                    style: Styles.textStyle30.copyWith(
                        fontSize: 32,
                        fontWeight: FontWeight.w900,
                        color: const Color(0xff2B2B2B)),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Fill your details or continue with \n social media',
                    textAlign: TextAlign.center,
                    style: Styles.textStyle16
                        .copyWith(color: const Color(0xff707B81)),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Email Address',
                      style: Styles.textStyle16.copyWith(
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff2B2B2B)),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  const CustomTextFormField(hint: 'xyz@gmail.com'),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Password',
                      style: Styles.textStyle16.copyWith(
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff2B2B2B)),
                    ),
                  ),
                  const CustomTextFormField(hint: '*********', password: true),
                  const SizedBox(
                    height: 12,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        GoRouter.of(context).push(Routers.krecovery);
                      },
                      child: Text(
                        'Recovery Password',
                        style: Styles.textStyle16.copyWith(
                            color: const Color(0xff707B81), fontSize: 12),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const ButtonAction(
                    color: Color(0xff0D6EFD),
                    text: 'Sign in',
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const ButtonActionWithIcon(
                    color: Color(0xffF7F7F9),
                    text: 'Sign in with Google',
                    textColor: Colors.black,
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'New User?',
                          style: Styles.textStyle14,
                        ),
                        GestureDetector(
                          onTap: () {
                            GoRouter.of(context).push(Routers.kregister);
                          },
                          child: Text(
                            ' Create Account',
                            style: Styles.textStyle14.copyWith(
                                color: const Color(0xff1A1D1E),
                                fontWeight: FontWeight.w700),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
