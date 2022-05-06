import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:parent_control/scr/blocs/task_bloc.dart';
import 'package:parent_control/scr/model/task_model.dart';
import 'package:parent_control/scr/ui/main/task/add_tasks_screen.dart';
import 'package:parent_control/scr/ui/main/task/edit_tasks_screen.dart';
import 'package:parent_control/scr/ui/main_screen.dart';
import 'package:parent_control/scr/utils/date.dart';
import 'package:parent_control/scr/utils/utils.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  _TaskScreenState createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  final DateTime _now = DateTime.now();
  DateTime _selectedDay = DateTime.now();

  @override
  void initState() {
    _selectedDay = _now;
    taskBloc.allTask(activeUser.id);
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
        centerTitle: true,
        title: Text(
          "Tasks " + activeUser.name,
          style: const TextStyle(
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
            fontSize: 22,
            letterSpacing: 0.5,
            color: Color(0xFFFFFFFF),
          ),
        ),
        actions: [
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: activeUser.image == ""
                  ? Container()
                  : Image.file(
                      File(activeUser.image),
                      height: 48,
                      width: 48,
                      fit: BoxFit.cover,
                    ),
            ),
          ),
          const SizedBox(width: 16),
        ],
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
          right: 8,
          left: 8,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Container(
              height: 80,
              width: width,
              color: Colors.transparent,
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedDay = _now.add(const Duration(days: 0));
                        });
                      },
                      child: Center(
                        child: Container(
                          height: 32,
                          width: 32,
                          margin: const EdgeInsets.only(
                            top: 24,
                            left: 8,
                            right: 8,
                            bottom: 24,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(32),
                            color: _selectedDay ==
                                    _now.add(const Duration(days: 0))
                                ? const Color(0xFF0051EE)
                                : Colors.transparent,
                          ),
                          child: Center(
                            child: Text(
                              Utils().getWeek(
                                _now.add(const Duration(days: 0)).weekday,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedDay = _now.add(const Duration(days: 1));
                        });
                      },
                      child: Center(
                        child: Container(
                          height: 32,
                          width: 32,
                          margin: const EdgeInsets.only(
                            top: 24,
                            left: 8,
                            right: 8,
                            bottom: 24,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(32),
                            color: _selectedDay ==
                                    _now.add(const Duration(days: 1))
                                ? const Color(0xFF0051EE)
                                : Colors.transparent,
                          ),
                          child: Center(
                            child: Text(
                              Utils().getWeek(
                                _now.add(const Duration(days: 1)).weekday,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedDay = _now.add(const Duration(days: 2));
                        });
                      },
                      child: Center(
                        child: Container(
                          height: 32,
                          width: 32,
                          margin: const EdgeInsets.only(
                            top: 24,
                            left: 8,
                            right: 8,
                            bottom: 24,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(32),
                            color: _selectedDay ==
                                    _now.add(const Duration(days: 2))
                                ? const Color(0xFF0051EE)
                                : Colors.transparent,
                          ),
                          child: Center(
                            child: Text(
                              Utils().getWeek(
                                _now.add(const Duration(days: 2)).weekday,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedDay = _now.add(const Duration(days: 3));
                        });
                      },
                      child: Center(
                        child: Container(
                          height: 32,
                          width: 32,
                          margin: const EdgeInsets.only(
                            top: 24,
                            left: 8,
                            right: 8,
                            bottom: 24,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(32),
                            color: _selectedDay ==
                                    _now.add(const Duration(days: 3))
                                ? const Color(0xFF0051EE)
                                : Colors.transparent,
                          ),
                          child: Center(
                            child: Text(
                              Utils().getWeek(
                                _now.add(const Duration(days: 3)).weekday,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedDay = _now.add(const Duration(days: 4));
                        });
                      },
                      child: Center(
                        child: Container(
                          height: 32,
                          width: 32,
                          margin: const EdgeInsets.only(
                            top: 24,
                            left: 8,
                            right: 8,
                            bottom: 24,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(32),
                            color: _selectedDay ==
                                    _now.add(const Duration(days: 4))
                                ? const Color(0xFF0051EE)
                                : Colors.transparent,
                          ),
                          child: Center(
                            child: Text(
                              Utils().getWeek(
                                _now.add(const Duration(days: 4)).weekday,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedDay = _now.add(const Duration(days: 5));
                        });
                      },
                      child: Center(
                        child: Container(
                          height: 32,
                          width: 32,
                          margin: const EdgeInsets.only(
                            top: 24,
                            left: 8,
                            right: 8,
                            bottom: 24,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(32),
                            color: _selectedDay ==
                                    _now.add(const Duration(days: 5))
                                ? const Color(0xFF0051EE)
                                : Colors.transparent,
                          ),
                          child: Center(
                            child: Text(
                              Utils().getWeek(
                                _now.add(const Duration(days: 5)).weekday,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedDay = _now.add(const Duration(days: 6));
                        });
                      },
                      child: Center(
                        child: Container(
                          height: 32,
                          width: 32,
                          margin: const EdgeInsets.only(
                            top: 24,
                            left: 8,
                            right: 8,
                            bottom: 24,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(32),
                            color: _selectedDay ==
                                    _now.add(const Duration(days: 6))
                                ? const Color(0xFF0051EE)
                                : Colors.transparent,
                          ),
                          child: Center(
                            child: Text(
                              Utils().getWeek(
                                _now.add(const Duration(days: 6)).weekday,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 1,
              width: width,
              margin: const EdgeInsets.only(
                left: 8,
                right: 8,
              ),
              color: const Color(0xFFE4E4E4),
            ),
            Container(
              width: width,
              margin: const EdgeInsets.only(
                top: 24,
                bottom: 8,
                right: 8,
                left: 8,
              ),
              child: Center(
                child: Text(
                  Month().getMonthFormat(_selectedDay.month) +
                      " ${_selectedDay.day}, ${_selectedDay.year}",
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
            Expanded(
              child: StreamBuilder<List<TaskModel>>(
                stream: taskBloc.getTask,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<TaskModel> data = snapshot.data!;
                    return ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return EditTaskScreen(
                                    userId: activeUser.id,
                                    dateTime: _selectedDay,
                                  );
                                },
                              ),
                            );
                          },
                          child: Container(
                            height: 64,
                            width: width,
                            margin: const EdgeInsets.only(
                              top: 4,
                              left: 8,
                              right: 8,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color(0xFF9BEDFF),
                            ),
                            child: Row(
                              children: [
                                const SizedBox(width: 16),
                                Expanded(
                                  child: Text(
                                    data[index].task,
                                    style: const TextStyle(
                                      fontStyle: FontStyle.normal,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16,
                                      color: Color(0xFF000000),
                                    ),
                                  ),
                                ),
                                const Text(
                                  "",
                                  style: TextStyle(
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16,
                                    letterSpacing: 0.5,
                                    color: Color(0xFF000000),
                                  ),
                                ),
                                const SizedBox(width: 4),
                                SvgPicture.asset(
                                  "assets/icons/right.svg",
                                ),
                                const SizedBox(width: 4),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                  return Container();
                },
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return AddTaskScreen(
                        userId: activeUser.id,
                        dateTime: _selectedDay,
                      );
                    },
                  ),
                );
              },
              child: Container(
                height: 56,
                width: width,
                margin: const EdgeInsets.only(
                  top: 16,
                  bottom: 16,
                  left: 32,
                  right: 32,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: const Color(0xFF0051EE),
                ),
                child: const Center(
                  child: Text(
                    "+Add tasks",
                    style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      letterSpacing: 0.5,
                      color: Colors.white,
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
