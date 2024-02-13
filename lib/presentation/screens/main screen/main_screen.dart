import 'package:flutter/material.dart';
import 'package:student_management_squflite_provider/core/assets.dart';
import '../../../core/constants.dart';
import '../add student/screen_add_student.dart';
import '../student list/screen_student_list.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Center(
          child: Stack(
            fit: StackFit.expand,
            children: [
              Positioned(
                top: 100,
                left: 20,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    kHeight(MediaQuery.of(context).size.height *0.2/10),
                    Text(
                      "WELCOME TO \nSTUDENT MANAGEMENT APP",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).hintColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              kHeight(MediaQuery.of(context).size.height *0.03/10),
               Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 100),
                      child: Text(
                        "Manage Your Students \nDetails",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).hintColor,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Image.asset(
                      managementIcon,
                      width: MediaQuery.of(context).size.width * 0.6,
                      
                      color: Theme.of(context).dividerColor,
                    ),
                    kHeight(MediaQuery.of(context).size.height *0.3/10),
                    _mainPageBtn(
                      btnText: 'Add New Student',
                          onPressed: () =>
                              Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ScreenAddStudent(),
                          )),
                      context: context,
                    ),
                    kHeight(MediaQuery.of(context).size.height *0.3/10),
                    _mainPageBtn(
                      btnText: 'View All Students',
                          onPressed: () =>
                              Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const ScreenStudentList(),
                          )),
                      context: context,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
    MaterialButton _mainPageBtn(
      {required String btnText,
      required void Function()? onPressed,
      required BuildContext context}) {
    return MaterialButton(
      padding: const EdgeInsets.fromLTRB(100, 15, 100, 15),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: Theme.of(context).dividerColor.withOpacity(0.5),
      textColor: Theme.of(context).colorScheme.onSurface,
      onPressed: onPressed,
      child: Text(
        btnText,
        style: const TextStyle(fontSize: 15),
      ),
    );
  }
}
