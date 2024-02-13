import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_management_squflite_provider/presentation/screens/main%20screen/main_screen.dart';
import 'presentation/controllers/image_picker_provider.dart';
import 'presentation/controllers/student_provider.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => StudentProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ImagePickerProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Student Management',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blueGrey
          )
        ),
        
        home: const MainScreen(),
      ),
    );
  }
}
