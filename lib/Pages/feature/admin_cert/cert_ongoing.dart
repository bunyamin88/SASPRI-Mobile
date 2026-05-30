import 'package:flutter/material.dart';
import 'package:saspri_mobile/Widget/second_appbar.dart';

class CertificationOnGoing extends StatelessWidget {
  const CertificationOnGoing({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SecondaryAppBar(title: "Sertifikasi Berjalan"),
      body: const Center(
        child: Text("List Sertifikasi Berjalan"),
      ),
    );
  }
}