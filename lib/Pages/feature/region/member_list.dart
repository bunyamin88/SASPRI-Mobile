import 'package:flutter/material.dart';
import 'package:saspri_mobile/Widget/second_appbar.dart';

class MemberList extends StatelessWidget {
  const MemberList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SecondaryAppBar(title: "Anggota Kawasan"),
      body: const Center(
        child: Text("List Anggota"),
      ),
    );
  }
}