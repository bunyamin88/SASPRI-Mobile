import 'package:flutter/material.dart';
import 'package:saspri_mobile/Widget/second_appbar.dart';

class RepresentativeChangeRequest extends StatelessWidget {
  const RepresentativeChangeRequest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SecondaryAppBar(title: "Perubahan Wali"),
      body: const Center(
        child: Text("List Permintaan Perubahan Wali"),
      ),
    );
  }
}