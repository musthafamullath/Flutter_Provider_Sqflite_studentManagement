
import 'package:flutter/material.dart';

import '../../data/model/student.dart';
import '../../data/repository/student_repository.dart';

class StudentProvider extends ChangeNotifier {
  List<StudentModel> _allStudent = [];

  StudentRepository studentRepository = StudentRepository();

  List<StudentModel> get allStudent => _allStudent;

  fetchAllStudent({String? query}) async {
    var student = await studentRepository.getData(query ?? '');
    _allStudent = student;
    notifyListeners();
  }

  addStudent(StudentModel studentModel) {
    studentRepository.addData(studentModel);
    fetchAllStudent();
  }

  updateStudent(StudentModel studentModel) {
    studentRepository.updateData(studentModel);
    fetchAllStudent();
  }

  deleteStudent(int id) {
    studentRepository.deleteData(id);
    fetchAllStudent();
  }
}