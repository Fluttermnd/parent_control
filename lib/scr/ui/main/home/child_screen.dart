import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:parent_control/scr/blocs/user_bloc.dart';
import 'package:parent_control/scr/model/user_model.dart';
import 'package:parent_control/scr/ui/main/home/edit_user_screen.dart';
import 'package:parent_control/scr/ui/main_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isFirst = true;

  @override
  void initState() {
    userBloc.allUser();
    super.initState();
  }

  PageController controller = PageController(viewportFraction: 0.95);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFF59AFFF),
      appBar: AppBar(
        backgroundColor: const Color(0xFF59AFFF),
        elevation: 0,
        title: const Text(
          "Home",
          style: TextStyle(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
            fontSize: 22,
            letterSpacing: 0.5,
            color: Color(0xFFFFFFFF),
          ),
        ),
      ),
      body: StreamBuilder<List<UserModel>>(
        stream: userBloc.getRegister,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<UserModel> data = snapshot.data!;
            if (isFirst) {
              activeUser = data[0];
            }
            return PageView.builder(
              itemCount: data.length,
              scrollDirection: Axis.horizontal,
              controller: controller,
              onPageChanged: (_index) {
                activeUser = data[_index];
              },
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(
                    top: 24,
                    bottom: 42,
                    left: 4,
                    right: 4,
                  ),
                  width: width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 160,
                        color: Colors.transparent,
                        child: Stack(
                          children: [
                            Container(
                              height: 160,
                              width: double.infinity,
                              color: Colors.transparent,
                              child: data[index].image == ""
                                  ? Container(
                                      height: 160,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        color: Colors.white,
                                      ),
                                      padding: const EdgeInsets.only(top: 16),
                                      child: data[index].gender == "1"
                                          ? Container(
                                              padding: const EdgeInsets.only(
                                                top: 24,
                                                right: 58,
                                              ),
                                              alignment: Alignment.bottomRight,
                                              child: SvgPicture.asset(
                                                "assets/icons/boy.svg",
                                              ),
                                            )
                                          : Container(
                                              padding: const EdgeInsets.only(
                                                top: 24,
                                                right: 58,
                                              ),
                                              alignment: Alignment.bottomRight,
                                              child: SvgPicture.asset(
                                                "assets/icons/girl.svg",
                                              ),
                                            ),
                                    )
                                  : ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(8),
                                        topRight: Radius.circular(8),
                                      ),
                                      child: Image.file(
                                        File(data[index].image),
                                        height:
                                            MediaQuery.of(context).size.width -
                                                32,
                                        width: 160,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 160,
                              padding: const EdgeInsets.only(
                                bottom: 16,
                                left: 16,
                                right: 16,
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Expanded(
                                    child: Text(
                                      data[index].name,
                                      style: const TextStyle(
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 32,
                                        letterSpacing: 0.5,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) {
                                            return UserSettingsScreen(
                                              data: data[index],
                                            );
                                          },
                                        ),
                                      );
                                    },
                                    child: SvgPicture.asset(
                                      "assets/icons/settings.svg",
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        },
      ),
    );
  }
}
