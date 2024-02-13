import 'package:flutter/material.dart';
import 'package:student_management_squflite_provider/core/colors.dart';
import 'package:student_management_squflite_provider/presentation/screens/student%20details/widgets/info_widget.dart';
import 'package:student_management_squflite_provider/presentation/screens/student%20details/widgets/main_title.dart';

import '../../../../core/constants.dart';
import '../../../../data/model/student.dart';

class StudentDetailWidget extends StatelessWidget {
  const StudentDetailWidget({super.key, required this.student});
  final StudentModel student;
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      maxChildSize: 0.8,
      minChildSize: 0.6,
      builder: (context, scrollController) {
        return Container(
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            color: kBlueGrey,
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      height: 4,
                      width: 30,
                      decoration: BoxDecoration(
                        color: kLightblack,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                  kHeight(MediaQuery.of(context).size.height * 0.02),
                  MainTitle(student: student),
                  kHeight(MediaQuery.of(context).size.height * 0.03),
                  kDivider,
                  kHeight(MediaQuery.of(context).size.height * 0.02),
                  InfoWidget(
                    heading: 'Personal information',
                    heading2: 'Other details',
                    student: student,
                  ),
                  kHeight(MediaQuery.of(context).size.height * 0.05),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
