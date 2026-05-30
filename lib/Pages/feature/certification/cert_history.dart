import 'package:flutter/material.dart';
import 'package:saspri_mobile/Widget/second_appbar.dart';

class CertificationHistory extends StatelessWidget {
  const CertificationHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SecondaryAppBar(title: "Riwayat Sertifikasi"),
      body: const Center(
        child: Text("List Riwayat Sertifikasi"),
      ),
    );
  }
}