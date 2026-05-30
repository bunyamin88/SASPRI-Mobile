import 'package:flutter/material.dart';
import 'package:saspri_mobile/Widget/second_appbar.dart';

class ActivityHistory extends StatelessWidget {
  const ActivityHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SecondaryAppBar(title: "Riwayat Aktivitas"),
      body: const Center(
        child: Text("Detail Riwayat Aktivitas"),
      ),
    );
  }
}