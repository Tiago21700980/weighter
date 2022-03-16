import 'package:flutter/material.dart';
import 'package:weighter/pages/details/widgets/registos.dart';


import 'package:weighter/pages/details/widgets/steps.dart';

import '../../widgets/bottom_navigation.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Steps(),
          Graphs(),
          BottomNavigation()
        ],
      ),

    );
  }
}
