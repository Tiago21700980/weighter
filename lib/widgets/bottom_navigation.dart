import 'dart:ui';

import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 75,
      color: Color(0xfff8f8f8),
      // Ox para decimal, ff no idea não percebi muito bem mas é background do backgroud?, f8f8f8 é a cor que desejo
      child: IconTheme(
        data: IconThemeData(color: Color(0xffabadb4)), // ff é para fully opaque
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Transform.translate(
              offset: Offset(0,25),
              child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('/form');
                  },
                  child: Column(
                    children: [
                      Icon(Icons.workspaces_outline),
                      Text("Novo Registo")
                    ],
                  )),
            ),
            //Text("Novo Registo"),
            Transform.translate(
              // para poder levantar um pouco o botao do meio jaja for funsies
              offset: Offset(0, -5),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacementNamed('/');
                },
                child: Container(
                    padding: const EdgeInsets.all(13),
                    // const here its because its always gonna stay the same
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          colors: [Color(0xff92e2ff), Color(0xff1ebdf8)],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black45,
                            offset: Offset(4, 4),
                            blurRadius: 4,
                          )
                          // bro this is some bulshit you dont want to even try again
                        ]),
                    child: Icon(
                      Icons.home,
                      color: Colors.white,
                    )),
              ),
            ),
            Transform.translate(
              offset: Offset(0, 25),
              child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed('/details');
                  },
                  child: Column(
                    children: [
                      Icon(Icons.library_books_rounded),
                      Text("Registos")
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
