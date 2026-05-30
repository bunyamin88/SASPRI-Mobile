import 'package:flutter/material.dart';
import 'package:saspri_mobile/Widget/second_appbar.dart';

class PeerTeamRequest extends StatelessWidget {
  const PeerTeamRequest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SecondaryAppBar(title: "Pengajuan Tim Sebaya"),
      body: const Center(
        child: Text("List Pengajuan Tim Sebaya"),
      ),
    );
  }
}