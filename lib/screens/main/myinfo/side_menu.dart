import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfoli/constants.dart';
import 'package:portfoli/main.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:file_picker/file_picker.dart';
import 'area_info_text.dart';
import 'coding.dart';
import 'knowledges.dart';
import 'my_info.dart';
import 'skills.dart';

// ignore: must_be_immutable
class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  File? file;
  chooseFileFromPC() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      print("================================ $result");
      file = File(result.files.single.path!);
      setState(() {});
      return File(result.files.single.path!);
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            MyInfo(),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(defaultPadding),
                child: Column(
                  children: [
                    AreaInfoText(title: "Residence", text: "Cairo, Egypt"),
                    AreaInfoText(title: "City", text: "Kafr El-Sheikh"),
                    AreaInfoText(title: "Age", text: "25"),
                    Skills(),
                    SizedBox(height: defaultPadding),
                    Coding(),
                    Knowledges(),
                    Divider(),
                    SizedBox(height: defaultPadding / 2),
                    TextButton(
                      onPressed: () {
                        chooseFileFromPC();
                        sharedPreferences!.setString("cv", file!.path);
                        // print(
                        //   "=get ============${sharedPreferences!.getString("cv")}",
                        // );
                      },
                      child: FittedBox(
                        child: Row(
                          children: [
                            Text(
                              "DOWNLOAD CV",
                              style: TextStyle(
                                color:
                                    Theme.of(
                                      context,
                                    ).textTheme.bodyLarge!.color,
                              ),
                            ),
                            SizedBox(width: defaultPadding / 2),
                            SvgPicture.asset("assets/icons/download.svg"),
                            SizedBox(width: defaultPadding / 2),
                            if (sharedPreferences!.getString("cv") != "")
                              Text("Uploaded"),
                            if (sharedPreferences!.getString("cv") != "")
                              Icon(Icons.check_circle, color: Colors.green),
                          ],
                        ),
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(top: defaultPadding),
                      color: Color(0xFF24242E),
                      child: Row(
                        children: [
                          Spacer(),
                          IconButton(
                            onPressed: () async {
                              await launchUrl(
                                Uri.parse(
                                  "https://www.linkedin.com/in/fares-sallam-0459711b6/",
                                ),
                              );
                            },
                            icon: SvgPicture.asset("assets/icons/linkedin.svg"),
                          ),
                          IconButton(
                            onPressed: () async {
                              await launchUrl(
                                Uri.parse(
                                  "https://github.com/FaresSallam75?tab=repositories",
                                ),
                              );
                            },
                            icon: SvgPicture.asset("assets/icons/github.svg"),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset("assets/icons/twitter.svg"),
                          ),
                          IconButton(
                            onPressed: () {
                              launchUrl(
                                Uri.parse(
                                  "https://mail.google.com/mail/u/0/?tab=rm&ogbl#inbox",
                                ),
                              );
                            },
                            icon: SvgPicture.asset(
                              "assets/icons/google.svg",
                              height: 20.0,
                              width: 20.0,
                            ),
                          ),
                          Spacer(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
