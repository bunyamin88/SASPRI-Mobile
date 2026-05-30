import 'package:flutter/material.dart';
import 'package:saspri_mobile/Pages/feature/certification/activity_history.dart';
import 'package:saspri_mobile/Pages/feature/certification/cert_history.dart';
import 'package:saspri_mobile/Pages/feature/certification/cert_submission.dart';
import 'package:saspri_mobile/Pages/feature/region/cert_detail.dart';
import 'package:saspri_mobile/Pages/feature/region/member_list.dart';
import 'package:saspri_mobile/Pages/feature/region/org_details.dart';
//import 'package:saspri_mobile/Widget/card/vertical_card.dart';
// import 'package:saspri_mobile/Widget/button/nav_button.dart';
import 'package:saspri_mobile/Widget/progress_bar.dart';
import 'package:saspri_mobile/Widget/region_card/region_rep_card.dart';
import 'package:saspri_mobile/Widget/region_choice.dart';
import 'package:saspri_mobile/Widget/user_card/user_card.dart';
import 'package:saspri_mobile/helper/enum.dart';
import 'package:saspri_mobile/models/feature_item.dart';
import 'package:saspri_mobile/models/user.dart';


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
  final User user;
  CertPage({super.key, required this.user});
  final listFeatureItems = [
  FeatureItem(
    icon: Icons.history_outlined,
    label: "Riwayat Aktivitas",
    page: ActivityHistory(),
    allowedRoles: [
      UserRole.member,
      UserRole.rep,
    ],
  ),

  FeatureItem(
    icon: Icons.archive_outlined,
    label: "Riwayat Sertifikasi",
    page: CertificationHistory(),
    allowedRoles: [
      UserRole.member,
      UserRole.rep,
    ],
  ),

  FeatureItem(
    icon: Icons.upload_file_outlined,
    label: "Ajukan Sertifikasi",
    page: CertificationSubmission(),
    allowedRoles: [
      UserRole.rep,
    ],
  ),
];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child : FeatureGrid(
              role: user.role,
              features: listFeatureItems,
            )
    );
  }
}

class RegionPage extends StatelessWidget {
  final User user;
  RegionPage({super.key, required this.user});
  final listFeatureItems = [
  FeatureItem(
    icon: Icons.list_alt,
    label: "Profil Kawasan",
    page: OrganizationDetails(),
    allowedRoles: [
      UserRole.member,
      UserRole.rep,
    ],
  ),

  FeatureItem(
    icon: Icons.verified,
    label: "Sertifikat Kawasan",
    page: CertificateDetail(),
    allowedRoles: [
      UserRole.member,
      UserRole.rep,
    ],
  ),

  FeatureItem(
    icon: Icons.group,
    label: "Anggota Kawasan",
    page: MemberList(),
    allowedRoles: [
      UserRole.member,
      UserRole.rep,
    ],
  ),
];
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child : FeatureGrid(
              role: user.role,
              features: listFeatureItems,
              
            )
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

