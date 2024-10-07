import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:helpinghand/features/service/models/requested_service.dart';
import 'package:progress_line/progress_line.dart';

import '../../../Utils/progressMapper.dart';
import '../../../core/app_style.dart';
import '../models/expert_service.dart';


class ExpertProgress extends StatefulWidget {
  final StudentId user;
  final Service service;
  const ExpertProgress({super.key, required this.user,required this.service});

  @override
  State<ExpertProgress> createState() => _TaskProgressFrameState();
}

class _TaskProgressFrameState extends State<ExpertProgress> {
  double _value = 0.0;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(bottom: Radius.circular(10)),
      child: Container(
          padding: const EdgeInsets.all(25),
          width: double.infinity,
          color: const Color(0xFFE3EEDA),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset(
                        "assets/profile.jpg",
                        height: 70,
                        width: 70,
                      )),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: const EdgeInsets.only(left: 10),
                          child: Text(
                            widget.service.serviceId.serviceTypeId.typename,
                            style: style14Semibold(),
                          )),
                      Row(
                        children: [
                          ProgressLineWidget(
                            end: Text(
                                "${(ProgressMapper(widget.service.status).progressVal * 100).toStringAsFixed(0)}%"),
                            percent: ProgressMapper(widget.service.status).progressVal,
                            lineWidth: 20,
                            lineColors: const [
                              Colors.green,
                            ],
                            bgColor: Colors.grey.withOpacity(0.4),
                            innerPadding: const EdgeInsets.all(20),
                            width: 100,
                            height: 60,
                            callback: (value) {
                              setState(() {
                                _value = value;
                              });
                            },
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            "View Details",
                            style: style14Medium(),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
              Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    "${widget.user.firstname} ${widget.user.lastname}",
                    style: style16(),
                  ))
            ],
          )),
    );
  }
}
