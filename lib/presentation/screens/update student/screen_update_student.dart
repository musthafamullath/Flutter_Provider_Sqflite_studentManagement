import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_management_squflite_provider/data/model/student.dart';
import 'package:student_management_squflite_provider/presentation/controllers/image_picker_provider.dart';
import 'package:student_management_squflite_provider/presentation/controllers/student_provider.dart';
import 'package:student_management_squflite_provider/presentation/screens/add%20student/widgets/section.dart';

import '../../../core/colors.dart';
import '../../../core/constants.dart';

class ScreenUpdateStudent extends StatefulWidget {
  const ScreenUpdateStudent({super.key, 
  required this.studentModel});


  final StudentModel studentModel ;

  @override
  State<ScreenUpdateStudent> createState() => _ScreenUpdateStudentState();
}

class _ScreenUpdateStudentState extends State<ScreenUpdateStudent> {
  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();

  final dobController = TextEditingController();

  final genderController = TextEditingController();

  final phoneNumberController = TextEditingController();

  final emailController = TextEditingController();

  final departmentController = TextEditingController();

  final rollNumberController = TextEditingController();

  final studentClassController = TextEditingController();


    @override
  void initState() {
    super.initState();
    nameController.text = widget.studentModel.name!;
    dobController.text = widget.studentModel.dob!;
    genderController.text = widget.studentModel.gender!;
    phoneNumberController.text = widget.studentModel.phoneNumber!;
    emailController.text = widget.studentModel.emailAddress!;
    departmentController.text = widget.studentModel.department!;
    rollNumberController.text = widget.studentModel.rollNumber!;
    studentClassController.text = widget.studentModel.studentClass!;
  }


  @override
  Widget build(BuildContext context) {
    final studentProvider =
        Provider.of<StudentProvider>(context, listen: false);
    final imagePickerProvider =
        Provider.of<ImagePickerProvider>(context, listen: false);

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                kHeight(MediaQuery.of(context).size.height * 0.04),
                Consumer<ImagePickerProvider>(
                  builder: (context,  imageProvider, child) {
                    return  headAndImageSection(
                      text: 'Edit Student \nInfo',
                      onTap: () {
                        imageProvider.pickImageFromGallery();
                      },
                    image: imageProvider.image.path == ''
                        ? Image.file(
                            File(widget.studentModel.profile!),
                          ).image
                        : Image.file(imageProvider.image).image, context:context,
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
                kHeight(MediaQuery.of(context).size.height * 0.02),
              ],
            ),
          ),
        ),
        floatingActionButton: MaterialButton(
          minWidth: MediaQuery.of(context).size.width * 0.25,
          height: MediaQuery.of(context).size.height * 0.07,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          color: kDarkBlue,
          onPressed: () {
            debugPrint('id on updating: ${widget.studentModel.id}');
            if (formKey.currentState!.validate()) {
              studentProvider.updateStudent(StudentModel(
                id: widget.studentModel.id,
                name: nameController.text,
                dob: dobController.text,
                gender: genderController.text,
                phoneNumber: phoneNumberController.text,
                emailAddress: emailController.text,
                profile: imagePickerProvider.image.path == ''
                    ? widget.studentModel.profile
                    : imagePickerProvider.image.path,
                department: departmentController.text,
                rollNumber: rollNumberController.text,
                studentClass: studentClassController.text,
              ));
              Navigator.pop(context);
                 ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Student details updated'),
                  backgroundColor: kBlueGrey,
                  margin: EdgeInsets.all(15),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            } else {
                 ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Must fill all the fields including profile'),
                  backgroundColor: kBlueGrey,
                  margin: EdgeInsets.all(15),
                  behavior: SnackBarBehavior.floating,
                ),
              );
            }
          },
          child: const Text(
            'Update',
            style: TextStyle(
              color: kWhiteColor,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}