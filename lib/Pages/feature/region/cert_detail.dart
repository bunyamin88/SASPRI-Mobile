import 'package:flutter/material.dart';
import 'package:saspri_mobile/Widget/second_appbar.dart';

class CertificateDetail extends StatelessWidget {
  const CertificateDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SecondaryAppBar(title: "Sertifikat"),
      body: const Center(
        child: Text("Detail Sertifikat"),
      ),
    );
  }
}