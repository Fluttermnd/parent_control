import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:parent_control/scr/blocs/user_bloc.dart';
import 'package:parent_control/scr/model/user_model.dart';

class UserSettingsScreen extends StatefulWidget {
  final UserModel data;

  const UserSettingsScreen({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  _UserSettingsScreenState createState() => _UserSettingsScreenState();
}

class _UserSettingsScreenState extends State<UserSettingsScreen> {
  final TextEditingController _controllerName = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  String? imageFile;
  String gender = "1";
  bool isNext = true;

  @override
  void initState() {
    _controllerName.text = widget.data.name;
    gender = widget.data.gender;
    imageFile = widget.data.image == "" ? null : widget.data.image;
    _controllerName.addListener(() {
      if (_controllerName.text.length > 3) {
        setState(() {
          isNext = true;
        });
      } else {
        setState(() {
          isNext = false;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFF59AFFF),
      appBar: AppBar(
        backgroundColor: const Color(0xFF59AFFF),
        elevation: 0,
        title: const Text(
          "Profile Settings",
          style: TextStyle(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
            fontSize: 22,
            letterSpacing: 0.5,
            color: Color(0xFFFFFFFF),
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(
          top: 16,
          left: 16,
          right: 16,
          bottom: 24,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  const SizedBox(height: 40),
                  Center(
                    child: imageFile == null
                        ? GestureDetector(
                            onTap: () async {
                              final XFile? image = await _picker.pickImage(
                                  source: ImageSource.gallery);
                              setState(() {
                                imageFile = image!.path;
                              });
                            },
                            child: Container(
                              height: 128,
                              width: 128,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: const Color(0xFFF5F5F5),
                                  width: 1,
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Spacer(),
                                  Image.asset("assets/images/image.png"),
                                  const Spacer(),
                                  const Text(
                                    "Click here to upload a photo",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                      letterSpacing: 0.5,
                                      color: Color(0xFF818181),
                                    ),
                                  ),
                                  const Spacer(),
                                ],
                              ),
                            ),
                          )
                        : Container(
                            height: 128,
                            width: 128,
                            color: Colors.transparent,
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.file(
                                    File(imageFile!),
                                    height: 128,
                                    width: 128,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                  top: 4,
                                  right: 4,
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        imageFile = null;
                                      });
                                    },
                                    child: const Icon(Icons.close),
                                  ),
                                )
                              ],
                            ),
                          ),
                  ),
                  const SizedBox(height: 48),
                  Row(
                    children: [
                      const Spacer(),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                gender = "1";
                              });
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 270),
                              curve: Curves.easeInOut,
                              height: 72,
                              width: 72,
                              padding: const EdgeInsets.only(top: 12),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                color: gender == "1"
                                    ? const Color(0xFF59AFFF)
                                    : const Color(0xFF59AFFF).withOpacity(0.3),
                              ),
                              child: SvgPicture.asset(
                                "assets/icons/man.svg",
                              ),
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            "Boy",
                            style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              letterSpacing: 0.5,
                              color: Color(0xFF000000),
                            ),
                          )
                        ],
                      ),
                      const Spacer(),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                gender = "2";
                              });
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 270),
                              curve: Curves.easeInOut,
                              height: 72,
                              width: 72,
                              padding: const EdgeInsets.only(top: 12),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(18),
                                color: gender == "2"
                                    ? const Color(0xFF59AFFF)
                                    : const Color(0xFF59AFFF).withOpacity(0.3),
                              ),
                              child: SvgPicture.asset(
                                "assets/icons/woman.svg",
                              ),
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            "Girl",
                            style: TextStyle(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              letterSpacing: 0.5,
                              color: Color(0xFF000000),
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                    ],
                  ),
                  const SizedBox(height: 28),
                  Container(
                    height: 56,
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xFFF5F5F5),
                        width: 1,
                      ),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: TextField(
                      controller: _controllerName,
                      style: const TextStyle(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        letterSpacing: 0.5,
                        color: Color(0xFF818181),
                      ),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Name",
                        hintStyle: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          letterSpacing: 0.5,
                          color: Color(0xFF818181),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                if (isNext) {
                  UserModel data = UserModel(
                    id: widget.data.id,
                    name: _controllerName.text,
                    gender: gender,
                    image: imageFile ?? "",
                  );
                  userBloc.update(data);
                  Navigator.pop(context);
                }
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 270),
                curve: Curves.easeInOut,
                height: 56,
                width: width,
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: isNext ? Colors.blue : const Color(0xFFF5F5F5),
                    width: 1,
                  ),
                  color: isNext ? Colors.blue : Colors.white,
                  borderRadius: BorderRadius.circular(32),
                ),
                child: Center(
                  child: Text(
                    "Save",
                    style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      letterSpacing: 0.5,
                      color: isNext ? Colors.white : const Color(0xFF818181),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                if (isNext) {
                  userBloc.delete(widget.data.id);
                  Navigator.pop(context);
                }
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 270),
                curve: Curves.easeInOut,
                height: 56,
                width: width,
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(32),
                ),
                child: const Center(
                  child: Text(
                    "delete",
                    style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      letterSpacing: 0.5,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
