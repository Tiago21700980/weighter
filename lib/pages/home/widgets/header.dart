import 'package:flutter/material.dart';

class AppHeader extends StatelessWidget {
  const AppHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 130,
      child: Stack(
        children: [
          CustomPaint(
            painter: HeaderPainter(),
            size: Size(double.infinity,200)
          ),
          Positioned(
            top: 15,
            left: 20,
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.menu,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            top: 25,
            right: 35,
            child: CircleAvatar(
              minRadius: 25,
              maxRadius: 50,
              foregroundImage: AssetImage('lib/assets/pfp.jpg'),
            ),
          ),
          Positioned(
            left: 33,
            bottom: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, //mete tudo alinhado à esquerda
              children: [
                Text(
                  'Hello',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
                Text(
                  'Dogger',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class HeaderPainter extends CustomPainter{

  @override
  void paint(Canvas canvas, Size size) {

    Paint backgroundColor = Paint()..color = Colors.blue;
    Paint circles40 = Paint()..color = Colors.white.withAlpha(40);
    Paint circles85 = Paint()..color = Colors.white.withAlpha(85);


    canvas.drawRect(Rect.fromPoints(
        Offset(0,0),
        Offset(size.width,size.height)),
        backgroundColor);

    canvas.drawCircle(Offset(size.width * .6, 10), 30, circles85);
    canvas.drawCircle(Offset(size.width * .5, size.height * .66), 66, circles40);
    canvas.drawCircle(Offset(size.width * .96, size.height * .1), 35, circles40);
    canvas.drawCircle(Offset(size.width * .87, size.height * .9), 40, circles85);

    canvas.drawCircle(Offset(size.width * .6, 10), 15, circles40);
    canvas.drawCircle(Offset(size.width * .5, size.height * .66), 33, circles85);
    canvas.drawCircle(Offset(size.width * .96, size.height * .1), 17.5, circles85);
    canvas.drawCircle(Offset(size.width * .87, size.height * .9), 20, circles40);



  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
  // assim que criarmos o pattern fica feito e tá bom, nao preciso disto para repintar
  // para o graph vou precisar disto

}
