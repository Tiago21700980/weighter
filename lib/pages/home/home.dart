import 'package:flutter/material.dart';

import '../../widgets/bottom_navigation.dart';
import 'widgets/graph.dart';
import 'widgets/stats.dart';
import 'widgets/header.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppHeader(),
          RecentWeights(),

          Graph(),
          BottomNavigation(),
        ],
      ),
    );
  }
}
