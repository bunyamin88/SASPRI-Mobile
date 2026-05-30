import 'package:flutter/material.dart';
import 'package:saspri_mobile/Widget/second_appbar.dart';

class CertificationSubmission extends StatelessWidget {
  const CertificationSubmission({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SecondaryAppBar(title: "Pengajuan Sertifikasi"),
      body: const Center(
        child: Text("Detail Pengajuan Sertifikasi"),
      ),
    );
  }
}