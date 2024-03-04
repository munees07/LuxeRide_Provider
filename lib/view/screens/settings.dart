import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:luxeride/controller/settings_provider.dart';
import 'package:luxeride/view/subscreens/about.dart';
import 'package:luxeride/view/subscreens/piechart.dart';
import 'package:luxeride/view/subscreens/privacy.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SettingsProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Container(
            color: const Color(0x00f3f5f7),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Gap(50),
                const Padding(
                  padding: EdgeInsets.all(15),
                  child: Text(
                    'SETTINGS',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                const Gap(30),
                SettingsTile(
                    icon: const Icon(CupertinoIcons.info),
                    text: 'ABOUT',
                    onpressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const AboutPage()));
                    }),
                const Gap(30),
                SettingsTile(
                    icon: const Icon(Icons.privacy_tip_outlined),
                    text: 'PRIVACY POLICY',
                    onpressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const PrivacyPage()));
                    }),
                const Gap(30),
                SettingsTile(
                    icon: const Icon(CupertinoIcons.chart_bar_circle),
                    text: 'CHART',
                    onpressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const PieChartPage()));
                    }),
                const Gap(30),
                SettingsTile(
                    icon: const Icon(Icons.restart_alt),
                    text: 'RESET',
                    onpressed: () {
                      provider.resetdialoguebox(context);
                    }),
                const Gap(30),
                SettingsTile(
                    icon: const Icon(Icons.logout),
                    text: 'LOGOUT',
                    onpressed: () {
                      provider.logoutDialogueBox(context);
                      
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SettingsTile extends StatelessWidget {
  const SettingsTile({
    super.key,
    required this.icon,
    required this.text,
    required this.onpressed,
  });
  final Icon icon;
  final String text;
  final VoidCallback onpressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: ListTile(
          leading: icon,
          title: Text(
            text,
            style: const TextStyle(fontSize: 12),
          )),
    );
  }
}
