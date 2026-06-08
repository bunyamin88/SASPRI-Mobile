import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../main.dart';
import '../providers/auth_provider.dart';

class SplashPage
    extends ConsumerStatefulWidget {

  const SplashPage({
    super.key,
  });

  @override
  ConsumerState<SplashPage>
      createState() =>
          _SplashPageState();
}

class _SplashPageState
    extends ConsumerState<SplashPage> {

  @override
  void initState() {
    super.initState();

    Future.microtask(
      _initialize,
    );
  }

  Future<void> _initialize()
      async {

    await ref
        .read(
          authProvider.notifier,
        )
        .restoreSession();

    if (!mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) =>
            const MyHomePage(
          title: 'SASPRI',
        ),
      ),
    );
  }

  @override
  Widget build(
    BuildContext context,
  ) {

    return const Scaffold(
      body: Center(
        child:
            CircularProgressIndicator(),
      ),
    );
  }
}