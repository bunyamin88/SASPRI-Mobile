import 'package:flutter/material.dart';
import 'package:saspri_mobile/Pages/main_pages.dart';
import 'package:saspri_mobile/Widget/app_bar.dart';
import 'package:saspri_mobile/Widget/button/nav_button.dart';
import 'package:saspri_mobile/Widget/nav_button_list.dart';
import 'package:saspri_mobile/Widget/progress_bar.dart';
import 'package:saspri_mobile/Widget/region_card/region_admin_card.dart';
import 'package:saspri_mobile/Widget/region_choice.dart';
import 'package:saspri_mobile/Widget/user_card/user_card.dart';
import 'package:saspri_mobile/helper/colorpallate.dart';
import 'package:saspri_mobile/helper/enum.dart';
import 'Widget/region_card/region_rep_card.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: .fromSeed(seedColor: const Color.fromRGBO(103, 58, 183, 1)),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  UserRole role = UserRole.member;
  int currentIndex = 0;
  List<Widget> pages = [
    const MainPage(),
    const RegionPage(),
    const CertPage(),
    const AdminVerifyPage(),
    const AdminCertPage(),
    const ProfilPage(),
    const LoginPage(),
  ];
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done

    return Scaffold(
      backgroundColor: ColorPallate.background,
      appBar: MainAppBar(
              name: "Ahmad Afif",
              role: role.label,
              onNotificationTap: () {},
      ),
      body:  Center(
        child: SingleChildScrollView(
          child: pages[currentIndex]
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: NavButtonList(role: role, currentIndex: currentIndex, onChanged: (index) {
          setState(() {
            currentIndex = index;
          });
        })
      )
    );
  }
}
