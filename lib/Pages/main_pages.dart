import 'package:flutter/material.dart';
//import 'package:saspri_mobile/Widget/card/vertical_card.dart';
// import 'package:saspri_mobile/Widget/button/nav_button.dart';
import 'package:saspri_mobile/Widget/progress_bar.dart';
import 'package:saspri_mobile/Widget/region_card/region_rep_card.dart';
import 'package:saspri_mobile/Widget/region_choice.dart';
import 'package:saspri_mobile/Widget/user_card/user_card.dart';
import 'package:saspri_mobile/helper/enum.dart';


class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int currentIndex = 0;

  // final List<Widget> pages = [
  // ];

  void changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
            padding: EdgeInsets.all(16),
            child: Column(
              spacing: 8,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              
            children: [
                RegionRepCard(
                  initial: 'A',
                  name: 'Cisarua, Bogor, Jawa Barat',
                  code: '12345',
                  submissionDate: '2023-10-01',
                  status: 'Selesai Tidak Lulus',
                ),
                UserCard(
                  //labelLeft: 'b',
                  textLeft1: "Ahmad Afif",
                  textLeft2: "caisura, bogor, jabar",
                  //textLeft3: "01-10-2023",
                  //textRight1: "Natalia",
                  textRight2: "Butuh Persetujuan",
                  iconright: Icons.pending_actions
                ),
                ProgressBar(
                  steps: [
                    "Self-Review",
                    "Peer-Review",
                    "External Review",
                    "Selesai",
                  ],
                  currentStep: 3,
                  state: ProgressBarState.normal
                ),
              ],    
            ),
          );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class CertPage extends StatelessWidget {
  const CertPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child : RegionChoice(role: UserRole.admin,)
    );
  }
}

class RegionPage extends StatelessWidget {
  const RegionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child : RegionChoice(role: UserRole.admin,)
    );
  }
}

class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class AdminCertPage extends StatelessWidget {
  const AdminCertPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class AdminVerifyPage extends StatelessWidget {
  const AdminVerifyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

