import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:parent_control/scr/blocs/service_bloc.dart';
import 'package:parent_control/scr/model/add_service_model.dart';
import 'package:parent_control/scr/ui/main_screen.dart';
import 'package:parent_control/scr/utils/add_service_name.dart';
import 'package:parent_control/scr/utils/add_service_type.dart';

class AlertsScreen extends StatefulWidget {
  const AlertsScreen({Key? key}) : super(key: key);

  @override
  _AlertsScreenState createState() => _AlertsScreenState();
}

class _AlertsScreenState extends State<AlertsScreen> {
  @override
  void initState() {
    serviceBloc.allService(activeUser.id);
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
          "Alerts Victoria",
          style: TextStyle(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w500,
              fontSize: 22,
              letterSpacing: 0.5,
              color: Color(0xFFFFFFFF)),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 72,
            width: width,
            margin:
                const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 12),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: const Color(0xFFFEFFC8),
            ),
            child: const Text(
              "At the end of the day, ask your child about his impressions on the Internet for the past day",
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
          Expanded(
            child: StreamBuilder<List<AddServiceModel>>(
                stream: serviceBloc.getService,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        return Container(
                          height: 56,
                          width: width,
                          margin: const EdgeInsets.only(
                            left: 16,
                            right: 16,
                            top: 4,
                            bottom: 4,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: const Color(0xFFFEFFC8),
                          ),
                          child: Row(
                            children: [
                              const SizedBox(width: 16),
                              AddServiceType().getServiceType(
                                snapshot.data![index].type,
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Text(
                                  AddServiceName().getServiceName(
                                    snapshot.data![index].type,
                                  ),
                                ),
                              ),
                              SvgPicture.asset(
                                "assets/icons/dislike.svg",
                              ),
                              const SizedBox(width: 16),
                              SvgPicture.asset(
                                "assets/icons/like.svg",
                              ),
                              const SizedBox(width: 16),
                            ],
                          ),
                        );
                      },
                      itemCount: snapshot.data!.length,
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
