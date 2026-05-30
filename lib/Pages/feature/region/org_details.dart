import 'package:flutter/material.dart';
import 'package:saspri_mobile/Widget/second_appbar.dart';

class OrganizationDetails extends StatelessWidget {
  const OrganizationDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SecondaryAppBar(title: "Detail Kawasan"),
      body: const Center(
        child: Text("Detail Kawasan"),
      ),
    );
  }
}