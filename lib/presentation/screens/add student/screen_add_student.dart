import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_management_squflite_provider/core/assets.dart';
import 'package:student_management_squflite_provider/presentation/controllers/image_picker_provider.dart';
import 'package:student_management_squflite_provider/presentation/screens/add%20student/widgets/custom_btn.dart';
import 'package:student_management_squflite_provider/presentation/screens/add%20student/widgets/section.dart';
import '../../../core/colors.dart';
import '../../../core/constants.dart';

class ScreenAddStudent extends StatelessWidget {
  ScreenAddStudent({super.key});
  final nameController = TextEditingController();
  final dobController = TextEditingController();
  final genderController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final emailController = TextEditingController();
  final departmentController = TextEditingController();
  final rollNumberController = TextEditingController();
  final studentClassController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                kHeight(MediaQuery.of(context).size.height * 0.04),
                Consumer<ImagePickerProvider>(
                  builder: (context, imageProvider, child) {
                    return   headAndImageSection(
                      text: "Add New \nStudent Info",
                      onTap: () {
                        imageProvider.pickImageFromGallery();
                      },
                      image: imageProvider.image.path == ''
                          ? Image.asset(
                              studentImage,
                              fit: BoxFit.fill,
                              filterQuality: FilterQuality.high,
                              color: kAqua,
                            ).image
                          : Image.file(imageProvider.image).image, 
                          context: context,
                    );
                  },
                 
                ),
              
                 kHeight(MediaQuery.of(context).size.height * 0.04),
                personalInfoSection(
                  nameController: nameController,
                  dobController: dobController,
                  genderController: genderController,
                  phoneNumberController: phoneNumberController,
                  emailController: emailController,
                ),
                 kHeight(MediaQuery.of(context).size.height * 0.04),
                otherDetailSection(
                  departmentController: departmentController,
                  rollNumberController: rollNumberController,
                  studentClassController: studentClassController,
                ),
                kHeight(MediaQuery.of(context).size.height * 0.04),
              ],
            ),
          ),
        ),
      ),
        floatingActionButton: CustomAddButton(
        nameController: nameController,
        dobController: dobController,
        genderController: genderController,
        phoneNumberController: phoneNumberController,
        emailController: emailController,
        departmentController: departmentController,
        rollNumberController: rollNumberController,
        studentClassController: studentClassController,
        formkey: formKey,
      ),
     
    );
  }
}