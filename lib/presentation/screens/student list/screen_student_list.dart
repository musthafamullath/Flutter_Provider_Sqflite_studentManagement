import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:student_management_squflite_provider/presentation/screens/student%20list/widgets/custom_appbar.dart';
import 'package:student_management_squflite_provider/presentation/screens/student%20list/widgets/list_card.dart';
import '../../../core/colors.dart';
import '../../controllers/student_provider.dart';
import '../add student/widgets/sub_heading.dart';
import '../student details/screen_student_details.dart';

class ScreenStudentList extends StatelessWidget {
 const ScreenStudentList({super.key});
 
  @override
  Widget build(BuildContext context) {
     context.read<StudentProvider>().fetchAllStudent();
    return SafeArea(
      child: Scaffold(
        appBar: const PreferredSize(
          preferredSize:  Size.fromHeight(200),
          child:  CustomAppBarWidget(),
        ),
        body:  Center(
              child: Consumer<StudentProvider>(builder: (context, studentModel, child) {
                return studentModel.allStudent.isNotEmpty 
                   ? ListView.builder(
                      padding: const EdgeInsets.only(bottom: 20),
                      itemCount: studentModel.allStudent.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => ScreenStudentDetail(
                                index: index,
                              ),
                            ),
                          ),
                          child: ListCardWidget(
                            studentModel: studentModel.allStudent[index],
                          ),
                        );
                      },
                    )
                  :  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset("assets/icons/empty_list_image.json",width: 250,height: 250),
                      const SubHeadingWidget(
                          text: "List is Empty!!!",
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: kAmber),
                    ],
                  );
              },)
                
            ),
      ),
    );
  }
}