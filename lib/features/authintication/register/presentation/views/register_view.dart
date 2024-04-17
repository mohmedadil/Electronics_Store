import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:shoes_store/core/utlis/routes.dart';
import 'package:shoes_store/core/utlis/styles.dart';
import 'package:shoes_store/core/widgets/buttons.dart';
import 'package:shoes_store/core/widgets/snackbar.dart';
import 'package:shoes_store/features/authintication/login/presentation/views/widgets/custom_form_field.dart';

class RegisterView extends StatefulWidget {
  RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  String? email;
  String? name;
  String? password;
  bool isObsecure = true;
  bool isObsecureIcon = true;
  GlobalKey<FormState> formkey = GlobalKey();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 25, left: 20, right: 20),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Form(
                  key: formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xffF7F7F9)),
                            child: IconButton(
                                onPressed: () {
                                  GoRouter.of(context).pop();
                                },
                                icon: Icon(Icons.arrow_back))),
                      ),
                      Text(
                        'Register Account',
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
                          'Your Name',
                          style: Styles.textStyle16.copyWith(
                              fontWeight: FontWeight.w500,
                              color: const Color(0xff2B2B2B)),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      CustomTextFormField(
                        hint: 'xxxxxxxx',
                        onChange: (value) {
                          name = value;
                        },
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
                          isSecure: () {
                            setState(() {
                              isObsecure
                                  ? isObsecure = false
                                  : isObsecure = true;
                              isObsecureIcon
                                  ? isObsecureIcon = false
                                  : isObsecureIcon = true;
                            });
                          },
                          onChange: (value) {
                            password = value;
                          }),
                      const SizedBox(
                        height: 12,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      ButtonAction(
                        color: const Color(0xff0D6EFD),
                        text: 'Sign up',
                        onTap: () async {
                          isLoading = true;
                          setState(() {});
                          if (formkey.currentState!.validate()) {
                            try {
                              await registerUser();

                              // ignore: use_build_context_synchronously
                              showSnakBar(context,
                                  'Email Had Created ! , please Login');
                              GoRouter.of(context).pop();
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'weak-password') {
                                // ignore: use_build_context_synchronously
                                showSnakBar(context,
                                    'The password provided is too weak');
                              } else if (e.code == 'email-already-in-use') {
                                // ignore: use_build_context_synchronously
                                showSnakBar(context,
                                    'The account already exists for that email');
                              } else {
                                showSnakBar(context,
                                    'There was an error , pls try again');
                              }
                            } catch (e) {
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
                        text: 'Sign up with Google',
                        textColor: Colors.black,
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 47),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Already Have Account?',
                              style: Styles.textStyle14,
                            ),
                            GestureDetector(
                              onTap: () {
                                GoRouter.of(context).push(Routers.kLogin);
                              },
                              child: Text(
                                '  Login in',
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

  Future<void> registerUser() async {
    var auth = FirebaseAuth.instance;
    UserCredential user = await auth.createUserWithEmailAndPassword(
        email: email!, password: password!);
    await user.user?.updateDisplayName(name);
  }
}
