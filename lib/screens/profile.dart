import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:millions_recipe/reciep_icons.dart';
import 'package:millions_recipe/screens/setting.dart';
import 'package:provider/provider.dart';

import '../api/shared_preference/shared_preference.dart';
import '../providers/theme_provider.dart';
import 'edit_profile.dart';

class Profile extends StatefulWidget {
  const Profile({
    super.key,
  });
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late String userName;
  late bool darkMode;

  @override
  void initState() {
    userName = UserPreferences.getName() ?? "Guest";

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(top: 35, left: 25, right: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                profileHeader(),
                accountCard(),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  margin: const EdgeInsets.only(top: 15),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondaryContainer,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 14),
                          child: Padding(
                            padding: EdgeInsets.only(left: 20.0),
                            child: Text(
                              'Theam',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Manrope',
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        ListTile(
                          dense: true,
                          leading: themeChange.isDarkMode
                              ? const Icon(Icons.dark_mode_outlined)
                              : const Icon(ReciepIcons.ph_sun_dim),
                          title: themeChange.isDarkMode
                              ? const Text('Dark Mode')
                              : const Text('Light Mode'),
                          trailing: CupertinoSwitch(
                            activeColor: Colors.white38,
                            thumbColor: Colors.green.shade900,
                            trackColor: Colors.black12,
                            value: themeChange.isDarkMode,
                            onChanged: (value) {
                              themeChange.toggleTheme();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                profileOtherCard()
              ],
            ),
          ),
        ));
  }

  Card accountCard() => Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondaryContainer,
              borderRadius: BorderRadius.circular(10)),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 14),
                child: Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text(
                    'Account',
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              ListTile(
                dense: true,
                leading: Icon(ReciepIcons.cil_fridge),
                title: Text('My Fridge'),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              ListTile(
                dense: true,
                leading: Icon(ReciepIcons.health),
                title: Text('My Health'),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              ListTile(
                dense: true,
                leading: Icon(ReciepIcons.list),
                title: Text('My Meal Planner'),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              ListTile(
                dense: true,
                leading: Icon(ReciepIcons.goal),
                title: Text('My Goals'),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ],
          ),
        ),
      );

  Card profileOtherCard() => Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        margin: const EdgeInsets.only(top: 15),
        child: Container(
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondaryContainer,
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 14),
                child: Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Text(
                    'Other',
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: 'Manrope',
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              const ListTile(
                dense: true,
                leading: Icon(ReciepIcons.chat),
                title: Text('Forum'),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const SettingPage(),
                  ));
                },
                dense: true,
                leading: const Icon(ReciepIcons.setting),
                title: const Text('Setting'),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
              const ListTile(
                dense: true,
                leading: Icon(ReciepIcons.ph_code),
                title: Text('Meet the Developer'),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              const ListTile(
                dense: true,
                leading: Icon(ReciepIcons.share),
                title: Text('Invite Friends'),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ],
          ),
        ),
      );

  Widget profileHeader() => ListTile(
        leading: Container(
          width: 55,
          height: 55,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: Image.asset('assets/Ellipse 7.png'),
        ),
        title: Text(
          userName,
          style: const TextStyle(
              fontWeight: FontWeight.w500, fontSize: 14, fontFamily: 'Manrope'),
        ),
        subtitle: const Text(
          'Junior Chef',
          style: TextStyle(
              fontWeight: FontWeight.w400, fontSize: 12, fontFamily: 'Manrope'),
        ),
        trailing: GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const EditProfile(),
            ));
          },
          child: Container(
            width: 87.5,
            height: 30.7,
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                  colors: [
                    Color(0xff15BE77),
                    Color(0xff53E88B),
                  ],
                ),
                borderRadius: BorderRadius.circular(10)),
            child: const Center(
              child: Text(
                "Edit",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            ),
          ),
        ),
      );
}
