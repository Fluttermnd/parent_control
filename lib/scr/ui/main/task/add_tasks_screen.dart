import 'dart:io';

import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:parent_control/scr/blocs/task_bloc.dart';
import 'package:parent_control/scr/model/task_model.dart';
import 'package:parent_control/scr/ui/main_screen.dart';
import 'package:parent_control/scr/utils/date.dart';
import 'package:parent_control/scr/widget/color_widget.dart';
class AddTaskScreen extends StatefulWidget {
  final int userId;
  final DateTime dateTime;

  const AddTaskScreen({
    Key? key,
    required this.userId,
    required this.dateTime,
  }) : super(key: key);

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final TextEditingController _controllerTaskName = TextEditingController();
  bool response = false;
  DateTime start = DateTime.now(), end = DateTime.now();
  Color type = Colors.white;

  @override
  void initState() {
    _controllerTaskName.addListener(() {
      if (_controllerTaskName.text.length > 3) {
        setState(() {
          response = true;
        });
      } else {
        setState(() {
          response = false;
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
        title: Row(
          children: [
            Center(
              child: Text(
                "Tasks " + activeUser.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w500,
                  fontSize: 22,
                  letterSpacing: 0.5,
                  color: Color(0xFFFFFFFF),
                ),
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.file(
                File(activeUser.image),
                height: 48,
                width: 48,
              ),
            ),
          ],
        ),
      ),
      body: Container(
        width: width,
        margin: const EdgeInsets.only(
          top: 4,
          left: 16,
          right: 16,
          bottom: 16,
        ),
        padding: const EdgeInsets.only(
          right: 16,
          left: 16,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Container(
              width: width,
              margin: const EdgeInsets.only(
                top: 24,
                bottom: 20,
              ),
              child: Center(
                child: Text(
                  Month().getMonthFormat(widget.dateTime.month) +
                      " ${widget.dateTime.day}, ${widget.dateTime.year}",
                  style: const TextStyle(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    letterSpacing: 0.5,
                    color: Color(0xFF252525),
                  ),
                ),
              ),
            ),
            Container(
              width: width,
              margin: const EdgeInsets.only(
                bottom: 16,
              ),
              color: Colors.white,
              padding: const EdgeInsets.only(left: 16),
              child: Center(
                child: TextField(
                  controller: _controllerTaskName,
                  style: const TextStyle(
                    fontStyle: FontStyle.normal,
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    letterSpacing: 0.5,
                    color: Color(0xFF000000),
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: activeUser.name,
                    hintStyle: const TextStyle(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      letterSpacing: 0.5,
                      color: Color(0xFF000000),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      BottomPicker.time(
                        height: 324,
                        title: "Start time for the task",
                        titleStyle: const TextStyle(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Color(0xFF252525),
                        ),
                        onSubmit: (index) {
                          setState(() {
                            start = index;
                          });
                        },
                        bottomPickerTheme: BOTTOM_PICKER_THEME.blue,
                        use24hFormat: true,
                      ).show(context);
                    },
                    child: Container(
                      height: 56,
                      color: Colors.white,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "assets/icons/clock.svg",
                          ),
                          const SizedBox(width: 8),
                          Text(
                            start.hour.toString() +
                                ":" +
                                start.minute.toString(),
                            style: const TextStyle(
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              letterSpacing: 0.5,
                              color: Color(0xFF000000),
                            ),
                          ),
                          const SizedBox(width: 24),
                          SvgPicture.asset(
                            "assets/icons/bottom.svg",
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      BottomPicker.time(
                        height: 324,
                        title: "Finish time for the task",
                        titleStyle: const TextStyle(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Color(0xFF252525),
                        ),
                        onSubmit: (index) {
                          setState(() {
                            end = index;
                          });
                        },
                        bottomPickerTheme: BOTTOM_PICKER_THEME.blue,
                        use24hFormat: true,
                      ).show(context);
                    },
                    child: Container(
                      height: 56,
                      color: Colors.white,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "assets/icons/clock.svg",
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              end.hour.toString() + ":" + end.minute.toString(),
                              style: const TextStyle(
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                letterSpacing: 0.5,
                                color: Color(0xFF000000),
                              ),
                            ),
                          ),
                          SvgPicture.asset(
                            "assets/icons/bottom.svg",
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                  backgroundColor: Colors.transparent,
                  context: context,
                  isScrollControlled: true,
                  builder: (BuildContext context) {
                    return ColorWidget(
                      selected: (Color index) {
                        setState(() {
                          type = index;
                        });
                      },
                    );
                  },
                );
              },
              child: Container(
                height: 56,
                margin: const EdgeInsets.only(
                  top: 8,
                  left: 16,
                  right: 16,
                ),
                child: Row(
                  children: [
                    Container(
                      height: 24,
                      width: 24,
                      decoration: BoxDecoration(
                        color: type,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    const Expanded(
                      child: Text(
                        "Default color",
                        style: TextStyle(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          letterSpacing: 0.5,
                          color: Color(0xFF000000),
                        ),
                      ),
                    ),
                    SvgPicture.asset(
                      "assets/icons/bottom.svg",
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                if (response) {
                  TaskModel data = TaskModel(
                    task: _controllerTaskName.text,
                    userId: widget.userId,
                  );
                  taskBloc.saveTask(data);
                  Navigator.pop(context);
                }
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                height: 56,
                width: width,
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: response ? Colors.blue : const Color(0xFFF5F5F5),
                    width: 1,
                  ),
                  color: response ? Colors.blue : Colors.white,
                  borderRadius: BorderRadius.circular(32),
                ),
                child: Center(
                  child: Text(
                    "Add",
                    style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      letterSpacing: 0.5,
                      color: response ? Colors.white : const Color(0xFF818181),
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
