import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_management_squflite_provider/presentation/screens/student%20details/widgets/custom_meterial_btn.dart';
import 'package:student_management_squflite_provider/presentation/screens/student%20details/widgets/detail_section.dart';
import 'package:student_management_squflite_provider/presentation/screens/student%20details/widgets/profile_image_widget.dart';
import '../../../core/colors.dart';
import '../../../core/constants.dart';
import '../../controllers/student_provider.dart';
import '../update student/screen_update_student.dart';

class ScreenStudentDetail extends StatelessWidget {
  const ScreenStudentDetail({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    final studentProvider = Provider.of<StudentProvider>(context);
    return SafeArea(
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        body: Stack(
          children: [
            DetailProfileImageWidget(
              student: studentProvider.allStudent[index],
            ),
            StudentDetailWidget(
              student: studentProvider.allStudent[index],
            ),
          ],
        ),
        floatingActionButton: Padding(
          padding: EdgeInsets.zero,
          child: Container(
            color: kBlueGrey,
            padding: EdgeInsets.zero,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.075,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                kWidth(MediaQuery.of(context).size.width * 0.07/10),
                CustomMaterialButton(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ScreenUpdateStudent(
                          studentModel: studentProvider.allStudent[index],
                        ),
                      ),
                    );
                  },
                  text: 'Update Profile',
                ),
                kWidth(MediaQuery.of(context).size.width * 0.05/10),
                CustomMaterialButton(
                  onTap: () {
                    studentProvider
                        .deleteStudent(studentProvider.allStudent[index].id!);
                    Navigator.pop(context);
                  },
                  text: 'Remove Profile',
                ),
                kWidth(MediaQuery.of(context).size.width * 0.07/10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
