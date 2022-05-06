import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:parent_control/scr/blocs/service_bloc.dart';
import 'package:parent_control/scr/database/database_helper.dart';
import 'package:parent_control/scr/ui/main_screen.dart';
import 'package:parent_control/scr/utils/add_service_name.dart';
import 'package:parent_control/scr/utils/add_service_type.dart';

import '../../../model/add_service_model.dart';

class AddServiceScreen extends StatefulWidget {
  const AddServiceScreen({Key? key}) : super(key: key);

  @override
  _AddServiceScreenState createState() => _AddServiceScreenState();
}

class _AddServiceScreenState extends State<AddServiceScreen> {
  @override
  initState() {
    _getData();
    super.initState();
  }

  List<int> selected = [0, 0, 0, 0, 0, 0];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFF59AFFF),
      appBar: AppBar(
        backgroundColor: const Color(0xFF59AFFF),
        elevation: 0,
        title: const Text(
          "Add Service",
          style: TextStyle(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w500,
              fontSize: 22,
              letterSpacing: 0.5,
              color: Color(0xFFFFFFFF)),
        ),
      ),
      body: ListView(
        children: [
          Container(
            height: 72,
            width: width,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: const Color(0xFFFEFFC8),
            ),
            child: const Text(
              "We will help you track your child's activity in the chosen apps",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.w400,
                fontSize: 16,
                letterSpacing: 0.5,
                color: Color(0xFF000000),
              ),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: selected.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () async {
                  if (selected[index] == 0) {
                    AddServiceModel data = AddServiceModel(
                      userId: activeUser.id,
                      type: index + 1,
                    );
                    selected[index] = await serviceBloc.saveService(data);
                    setState(() {});
                  } else {
                    serviceBloc.deleteService(selected[index], activeUser.id);
                    setState(() {
                      selected[index] = 0;
                    });
                  }
                },
                child: Container(
                  height: 72,
                  width: width,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Container(
                        child: AddServiceType().getServiceType(index + 1),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Text(
                          AddServiceName().getServiceName(index + 1),
                          style: const TextStyle(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            letterSpacing: 0.5,
                            color: Color(0xFF000000),
                          ),
                        ),
                      ),
                      selected[index] == 0
                          ? Container(
                              height: 24,
                              width: 24,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  color: const Color(0xFF000000),
                                  width: 2,
                                ),
                                color: Colors.white,
                              ),
                            )
                          : Container(
                              height: 24,
                              width: 24,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: const Color(0xFF59AFFF),
                              ),
                              child: SvgPicture.asset(
                                "assets/icons/okey.svg",
                                height: 4,
                                width: 4,
                              ),
                            ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Future<void> _getData() async {
    final DatabaseHelper _databaseHelper = DatabaseHelper();
    List<AddServiceModel> data =
        await _databaseHelper.getAddService(activeUser.id);
    for (int i = 0; i < data.length; i++) {
      selected[data[i].type - 1] = data[i].id;
    }
    setState(() {});
  }
}
