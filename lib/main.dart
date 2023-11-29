import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'notifiers/child_notifier.dart';
import 'view/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ChildNotifier(),
      child: const MaterialApp(
        title: 'Christmess',
        home: HomeScreen(),
      ),
    );
  }
}
