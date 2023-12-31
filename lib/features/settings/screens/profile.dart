import 'package:flutter/material.dart';
import 'package:sculptgen/common/widgets/appbar/appbar.dart';
import 'package:sculptgen/common/widgets/text/section_heading.dart';
import 'package:sculptgen/features/settings/screens/widgets/profile_menu.dart';
import 'package:sculptgen/utils/constants/sizes.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FAppBar(
        title:
            Text('Profile', style: Theme.of(context).textTheme.headlineMedium),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(FSizes.defaultSpace),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundImage:
                        AssetImage('assets/images/content/user.png'),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: const Text('Change Profile picture')),
                ]),
              ),

              ///Details
              const SizedBox(
                height: FSizes.spaceBtwItems / 2,
              ),
              const Divider(),
              const SizedBox(height: FSizes.spaceBtwItems),
              const FSectionHeading(title: 'Personal Information'),
              const SizedBox(height: FSizes.spaceBtwItems),

              TProfileMenu(
                title: 'Name',
                value: 'Shreyansh Jain',
                onPressed: () {},
              ),
              TProfileMenu(
                title: 'Contact',
                value: '+91 9494315111',
                onPressed: () {},
              ),
              TProfileMenu(
                title: 'Date of Birth',
                value: '22 November 2002',
                onPressed: () {},
              ),

              const SizedBox(
                height: FSizes.spaceBtwItems / 2,
              ),
              const Divider(),
              const SizedBox(height: FSizes.spaceBtwItems),
              const FSectionHeading(title: 'College Information'),
              const SizedBox(height: FSizes.spaceBtwItems),

              TProfileMenu(
                title: 'Registration Number',
                value: '21BSA10012',
                onPressed: () {},
              ),
              TProfileMenu(
                title: 'Email',
                value: 'shreyansh.jain2021@vitbhopal.ac.in',
                onPressed: () {},
              ),
              TProfileMenu(
                title: 'Year of Joining',
                value: '2021',
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
