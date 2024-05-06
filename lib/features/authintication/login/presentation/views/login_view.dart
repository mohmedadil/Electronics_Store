import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shoes_store/core/utlis/routes.dart';
import 'package:shoes_store/core/utlis/styles.dart';
import 'package:shoes_store/core/widgets/buttons.dart';
import 'package:shoes_store/core/widgets/snackbar.dart';
import 'package:shoes_store/features/authintication/login/presentation/views/widgets/custom_form_field.dart';

class LoginView extends StatefulWidget {
  LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  GlobalKey<FormState> formkey = GlobalKey();

  String? email, password;

  bool isLoading = false;
  bool isObsecure = true;
  bool isObsecureIcon = true;
  UserCredential? profile;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(
              top: 60,
              left: 20,
              right: 20,
            ),
            child: SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Form(
                  key: formkey,
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
                      CustomTextFormField(
                        hint: 'xyz@gmail.com',
                        onChange: (value) {
                          email = value;
                        },
                      ),
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
                      CustomTextFormField(
                        hint: '*********',
                        password: true,
                        obsecure: isObsecure,
                        obsecureIcon: isObsecureIcon,
                        onChange: (value) {
                          password = value;
                        },
                        isSecure: () {
                          setState(() {
                            isObsecure ? isObsecure = false : isObsecure = true;
                            isObsecureIcon
                                ? isObsecureIcon = false
                                : isObsecureIcon = true;
                          });
                        },
                      ),
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
                      ButtonAction(
                        color: Color(0xff0D6EFD),
                        text: 'Sign in',
                        onTap: () async {
                          isLoading = true;
                          setState(() {});
                          if (formkey.currentState!.validate()) {
                            try {
                              await loginuser();
                              showSnakBar(context, 'success');
                              GoRouter.of(context)
                                  .push(Routers.khome, extra: profile);
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'user-not-found') {
                                showSnakBar(
                                    context, 'no user found to this email');
                              } else if (e.code == 'wrong-password') {
                                showSnakBar(context,
                                    'wrong password provided for this user');
                              } else {
                                showSnakBar(context,
                                    'incorrect information please try again');
                              }
                            } catch (e) {
                              print(e);
                              showSnakBar(context,
                                  'There was an error , pls try again');
                            }
                          }
                          isLoading = false;
                          setState(() {});
                        },
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      const ButtonActionWithIcon(
                        icon: 'asset/images/google.png',
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
        ),
      ),
    );
  }

  Future<void> loginuser() async {
    var auth = FirebaseAuth.instance;
    UserCredential user = await auth.signInWithEmailAndPassword(
        email: email!, password: password!);

    profile = user;
  }
}
