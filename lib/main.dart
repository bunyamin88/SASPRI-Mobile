import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:saspri_mobile/pages/main_pages.dart';
import 'package:saspri_mobile/pages/splash_page.dart';
import 'package:saspri_mobile/providers/auth_provider.dart';

import 'package:saspri_mobile/Widget/main_appbar.dart';
import 'package:saspri_mobile/Widget/nav_button_list.dart';

import 'package:saspri_mobile/helper/colorpallate.dart';
import 'package:saspri_mobile/helper/enum.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SASPRI',

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(
            103,
            58,
            183,
            1,
          ),
        ),
      ),

      home: const SplashPage(),
    );
  }
}

class MyHomePage
    extends ConsumerStatefulWidget {

  const MyHomePage({
    super.key,
    required this.title,
  });

  final String title;

  @override
  ConsumerState<MyHomePage>
      createState() =>
          _MyHomePageState();
}

class _MyHomePageState
    extends ConsumerState<MyHomePage> {
  
  @override
  void initState() {
    super.initState();

    ref.listenManual(
      authProvider,
      (previous, next) {

        if (
          previous?.status ==
              AuthStatus
                  .authenticated &&
          next.status ==
              AuthStatus
                  .unauthenticated
        ) {

          setState(() {

            currentIndex = 0;

          });
        }

        if (
          previous?.status ==
              AuthStatus
                  .unauthenticated &&
          next.status ==
              AuthStatus
                  .authenticated
        ) {

          setState(() {

            currentIndex = 0;

          });
        }

      },
    );
  }

  int currentIndex = 0;

  @override
  Widget build(
    BuildContext context,
  ) {

    final auth =
        ref.watch(authProvider);

    final user = auth.user;

    final role =
        user?.role ??
        UserRole.guest;

    final name =
        user?.username ??
        "Guest";

    final pages = <Widget>[
      const MainPage(),

      /// sesuaikan dengan constructor
      RegionPage(),

      CertPage(),

      AdminVerifyPage(),

      AdminCertPage(),

      ProfilPage(
        onLogout: () {

          setState(() {
            currentIndex = 0;
          });

        },
      ),

      const LoginPage(),
    ];

    return Scaffold(
      backgroundColor:
          ColorPallate.background,

      appBar: MainAppBar(
        name: name,
        role: role.label,
        onNotificationTap: () {},
      ),

      body: Center(
        child: SingleChildScrollView(
          child: pages[currentIndex],
        ),
      ),

      bottomNavigationBar: SafeArea(
        child: NavButtonList(
          currentIndex: currentIndex,
          onChanged: (index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}