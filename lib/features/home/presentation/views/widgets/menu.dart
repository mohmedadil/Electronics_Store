import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:Electronic_Store/core/utlis/routes.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    print('hellooo');
    return Container(
      child: Drawer(
          backgroundColor: const Color(0xffFFFFFF),
          elevation: 0,
          child: ListView(
            children: [
              const MyHeader(),
              const ListTile(
                title: Text(
                  'Profile',
                  style: TextStyle(
                      color: Color(0xff0D0D26),
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                ),
                leading: Icon(
                  FontAwesomeIcons.user,
                  size: 20,
                ),
              ),
              ListTile(
                title: const Text(
                  'My cart',
                  style: TextStyle(
                      color: Color(0xff0D0D26),
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                ),
                leading: Image.asset('asset/images/bag-2.png'),
              ),
              const ListTile(
                title: Text(
                  'Favourite',
                  style: TextStyle(
                      color: Color(0xff0D0D26),
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                ),
                leading: Icon(
                  FontAwesomeIcons.heart,
                  size: 20,
                ),
              ),
              const ListTile(
                title: Text(
                  'orders',
                  style: TextStyle(
                      color: Color(0xff0D0D26),
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                ),
                leading: Icon(
                  FontAwesomeIcons.truckFast,
                  size: 20,
                ),
              ),
              const ListTile(
                title: Text(
                  'Setting',
                  style: TextStyle(
                      color: Color(0xff0D0D26),
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                ),
                leading: Icon(
                  FontAwesomeIcons.gear,
                  size: 20,
                ),
              ),
              GestureDetector(
                onTap: () async {
                  try {
                    await signout(context);
                  } catch (e) {
                    print(e.toString());
                  }
                },
                child: const ListTile(
                  title: Text(
                    'Logout',
                    style: TextStyle(
                        color: Color(0xffE30000),
                        fontWeight: FontWeight.w500,
                        fontSize: 15),
                  ),
                  leading: Icon(
                    FontAwesomeIcons.arrowRightFromBracket,
                    size: 20,
                    color: Color(0xffE30000),
                  ),
                ),
              )
            ],
          )),
    );
  }

  Future<void> signout(BuildContext context) async {
    var auth = FirebaseAuth.instance;
    await auth.signOut();
    GoRouter.of(context).pushReplacement(Routers.kLogin);
  }
}

class MyHeader extends StatelessWidget {
  const MyHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      padding: const EdgeInsets.only(top: 20),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(
          height: 80,
          margin: const EdgeInsets.only(bottom: 10),
          decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image:
                  DecorationImage(image: AssetImage('asset/images/test.png'))),
        ),
        const Text(
          'Mohamed Adel',
          style: TextStyle(
              color: Color(0xff0D0D26),
              fontSize: 20,
              fontWeight: FontWeight.w500),
        ),
        const Text(
          'mohmedadil797@gmail.com',
          style: TextStyle(color: Color(0xff95969D)),
        ),
      ]),
    );
  }
}
