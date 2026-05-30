import 'package:flutter/material.dart';
import 'package:saspri_mobile/Widget/second_appbar.dart';

class RegistrationRegionRequest extends StatelessWidget {
  const RegistrationRegionRequest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SecondaryAppBar(title: "Pendaftaran Wilayah"),
      body: const Center(
        child: Text("Detail Pendaftaran Wilayah"),
      ),
    );
  }
}