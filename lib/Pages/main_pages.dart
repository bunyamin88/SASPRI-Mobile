import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saspri_mobile/helper/colorpallate.dart';
import 'package:saspri_mobile/pages/feature/admin_cert/cert_ongoing.dart';
import 'package:saspri_mobile/pages/feature/admin_cert/peerteam_req.dart';
import 'package:saspri_mobile/pages/feature/admin_verify/region_regist_req.dart';
import 'package:saspri_mobile/pages/feature/admin_verify/rep_change_req.dart';
import 'package:saspri_mobile/pages/feature/certification/activity_history.dart';
import 'package:saspri_mobile/pages/feature/certification/cert_history.dart';
import 'package:saspri_mobile/pages/feature/certification/cert_submission.dart';
import 'package:saspri_mobile/pages/feature/region/cert_detail.dart';
import 'package:saspri_mobile/pages/feature/region/member_list.dart';
import 'package:saspri_mobile/pages/feature/region/org_details.dart';
//import 'package:saspri_mobile/Widget/card/vertical_card.dart';
// import 'package:saspri_mobile/Widget/button/nav_button.dart';
import 'package:saspri_mobile/Widget/progress_bar.dart';
import 'package:saspri_mobile/Widget/region_card/region_rep_card.dart';
import 'package:saspri_mobile/Widget/region_choice.dart';
import 'package:saspri_mobile/Widget/user_card/user_card.dart';
import 'package:saspri_mobile/helper/enum.dart';
import 'package:saspri_mobile/models/feature_item.dart';
import 'package:saspri_mobile/models/user.dart';

import 'package:saspri_mobile/providers/auth_provider.dart';
import 'package:saspri_mobile/widget/button/primary_button.dart';
import 'package:flutter_svg/flutter_svg.dart';


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

class LoginPage extends ConsumerStatefulWidget {

  const LoginPage({
    super.key,
  });

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {

  final usernameController =
      TextEditingController();

  final passwordController =
      TextEditingController();

  @override
  Widget build(
    BuildContext context,
  ) {

    return Column(
      children: [

        SvgPicture.asset("assets/matasapi.svg", height: 150, width: 150,),
        SizedBox( height: 24,),

        TextField(

          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Username",
          ),
          controller:
              usernameController,
        ),
        SizedBox( height: 24,),

        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Password",
          ),
          controller:
              passwordController,
          obscureText: true,
          obscuringCharacter: "*",
        ),
        SizedBox( height: 24,),

        PrimaryButton(
          onPressed: () async {

            await ref
                .read(
                  authProvider
                      .notifier,
                )
                .login(
                  usernameController.text,
                  passwordController.text,
                );
          },
          text: "Login",
          backgroundColor: ColorPallate.primary,
        ),
      ],
    );
  }
}

class CertPage extends ConsumerWidget {
  const CertPage({super.key});

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {

    final auth = ref.watch(authProvider);

    final user = auth.user;

    if (user == null) {
      return const Center(
        child: Text(
          "Silakan login terlebih dahulu",
        ),
      );
    }

    final listFeatureItems = [
      FeatureItem(
        icon: Icons.history_outlined,
        label: "Riwayat Aktivitas",
        page: ActivityHistoryPage(
          user: user,
        ),
        allowedRoles: [
          UserRole.member,
          UserRole.coor,
        ],
      ),

      FeatureItem(
        icon: Icons.archive_outlined,
        label: "Riwayat Sertifikasi",
        page: CertificationHistoryPageState(
          user: user,
        ),
        allowedRoles: [
          UserRole.member,
          UserRole.coor,
        ],
      ),

      FeatureItem(
        icon: Icons.upload_file_outlined,
        label: "Ajukan Sertifikasi",
        page: CertificationSubmissionPage(),
        allowedRoles: [
          UserRole.coor,
        ],
      ),
    ];

    return Container(
      padding: const EdgeInsets.all(8),
      child: FeatureGrid(
        role: user.role,
        features: listFeatureItems,
      ),
    );
  }
}

class RegionPage extends ConsumerWidget {
  const RegionPage({super.key});

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {

    final auth = ref.watch(authProvider);

    final user = auth.user;

    if (user == null) {
      return const Center(
        child: Text(
          "Silakan login terlebih dahulu",
        ),
      );
    }

    final listFeatureItems = [
      FeatureItem(
        icon: Icons.list_alt,
        label: "Profil Kawasan",
        page: OrganizationDetails(
          user: user,
        ),
        allowedRoles: [
          UserRole.member,
          UserRole.coor,
        ],
      ),

      FeatureItem(
        icon: Icons.verified,
        label: "Sertifikat Kawasan",
        page: CertificateDetail(),
        allowedRoles: [
          UserRole.member,
          UserRole.coor,
        ],
      ),

      FeatureItem(
        icon: Icons.group,
        label: "Anggota Kawasan",
        page: MemberList(
          user: user,
        ),
        allowedRoles: [
          UserRole.member,
          UserRole.coor,
        ],
      ),
    ];

    return Container(
      padding: const EdgeInsets.all(8),
      child: FeatureGrid(
        role: user.role,
        features: listFeatureItems,
      ),
    );
  }
}

class ProfilPage extends ConsumerWidget {
  final VoidCallback onLogout;
  const ProfilPage({
    super.key,
    required this.onLogout,
  });

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {

    final user =
        ref.watch(authProvider).user;

    if (user == null) {
      return const Center(
        child: Text(
          "Belum login",
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Text(
            "Name: ${user.username}",
          ),
          Text(
            "Role: ${user.role.label}",
          ),
          SizedBox(
            width: 200,
            child: PrimaryButton(
              onPressed: () {
                ref
                    .read(
                      authProvider.notifier,
                    )
                    .logout();
                    onLogout();
              },
              text: "Logout",
              backgroundColor: ColorPallate.primary,
            ),
          )
        ],
      ),
    );
  }
}

class AdminCertPage extends ConsumerWidget {
  const AdminCertPage({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {

    final user =
        ref.watch(authProvider).user;

    if (user == null) {
      return const Center(
        child: Text(
          "Silakan login terlebih dahulu",
        ),
      );
    }

    final listFeatureItems = [
      FeatureItem(
        icon: Icons.update,
        label: "Sertifikasi Berjalan",
        page: CertificationOnGoing(),
        allowedRoles: [
          UserRole.admin,
        ],
      ),

      FeatureItem(
        icon: Icons.switch_account,
        label: "Pemilihan Tim Sebaya",
        page: PeerTeamRequest(),
        allowedRoles: [
          UserRole.admin,
        ],
      ),
    ];

    return Container(
      padding: const EdgeInsets.all(8),
      child: FeatureGrid(
        role: user.role,
        features: listFeatureItems,
      ),
    );
  }
}

class AdminVerifyPage extends ConsumerWidget {
  const AdminVerifyPage({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {

    final user =
        ref.watch(authProvider).user;

    if (user == null) {
      return const Center(
        child: Text(
          "Silakan login terlebih dahulu",
        ),
      );
    }

    final listFeatureItems = [
      FeatureItem(
        icon: Icons.app_registration_outlined,
        label: "Pendaftaran Kawasan",
        page: RegistrationRegionRequest(),
        allowedRoles: [
          UserRole.admin,
        ],
      ),

      FeatureItem(
        icon: Icons.switch_account,
        label: "Pergantian Wali",
        page: RepresentativeChangeRequest(),
        allowedRoles: [
          UserRole.admin,
        ],
      ),
    ];

    return Container(
      padding: const EdgeInsets.all(8),
      child: FeatureGrid(
        role: user.role,
        features: listFeatureItems,
      ),
    );
  }
}

