import 'package:flutter/material.dart';
import 'package:shoes_store/features/home/presentation/views/widgets/profile_body.dart';

class AccountProfile extends StatelessWidget {
  const AccountProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AccountProfileBody(),
    );
  }
}
