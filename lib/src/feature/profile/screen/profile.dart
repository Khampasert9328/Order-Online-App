
import 'package:flutter/material.dart';
import 'package:order_online_app/src/feature/profile/component/body_profile.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BodyProfile(),
    );
  }
}