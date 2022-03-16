import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import '../../../models/registo_de_peso.dart';

class Graph extends StatelessWidget {
  const Graph({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      // tenta ocupar as much space as it can, empurra o widget de baixo
      child: SizedBox(
        width: double.infinity,
        child: GraphArea(),
      ),
    );
  }
}

class GraphArea extends StatefulWidget {
  const GraphArea({Key? key}) : super(key: key);

  @override
  _GraphAreaState createState() => _GraphAreaState();
}

class _GraphAreaState extends State<GraphArea>
    with SingleTickerProviderStateMixin {
  int size = 100;

  late AnimationController _animationController;

  /*List<DataPoint> data = [
    DataPoint(day: 1, peso: 20),
    DataPoint(day: 2, peso: 50),
    DataPoint(day: 3, peso: 70),
    DataPoint(day: 4, peso: 30),
    DataPoint(day: 5, peso: 90),
  ];*/

  List<DataPoint> data = [
    DataPoint(day: 1, peso: registosGraph[0].pesoInt),
    DataPoint(day: 2, peso: registosGraph[1].pesoInt),
    DataPoint(day: 3, peso: registosGraph[2].pesoInt),
    DataPoint(day: 4, peso: registosGraph[3].pesoInt),
    DataPoint(day: 5, peso: registosGraph[4].pesoInt),
    DataPoint(day: 6, peso: registosGraph[5].pesoInt),
    DataPoint(day: 7, peso: registosGraph[6].pesoInt),
    DataPoint(day: 8, peso: registosGraph[7].pesoInt),
    DataPoint(day: 9, peso: registosGraph[8].pesoInt),
    DataPoint(day: 10, peso: registosGraph[9].pesoInt),
    DataPoint(day: 11, peso: registosGraph[10].pesoInt),
    DataPoint(day: 12, peso: registosGraph[11].pesoInt),
    DataPoint(day: 13, peso: registosGraph[12].pesoInt),
    DataPoint(day: 14, peso: registosGraph[13].pesoInt),
    DataPoint(day: 15, peso: registosGraph[14].pesoInt),
  ];

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 2500));
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _animationController.forward(from: 0.0);
      },
      child: CustomPaint(
          painter: GraphPainter(_animationController.view, data: data)),
    );
  }
}

class GraphPainter extends CustomPainter {
  late final List<DataPoint> data;
  final Animation<double> _size;
  final Animation<double> _dotsize;

  GraphPainter(Animation<double> animation, {required this.data})
      : _size = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            // opah o tuturial recomendou lmao
            // opah o tuturial recomendou lmao
            parent: animation,
            curve: Interval(0.0, 0.75, curve: Curves.easeInOutCubicEmphasized), //acaba a animaçao em 3/4 do tempo de animaçao
          ),
        ),
        _dotsize = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: animation,
            curve: Interval(0.5, 1, curve: Curves.easeInOutCubicEmphasized),
          ),
        ),
        super(
            repaint:
                animation); // olha para os valores de animation e se mudarem dá repaint KINDA

  @override
  void paint(Canvas canvas, Size size) {
    var xSpacing = size.width / (data.length - 1);

    // IP P P P P P P .. P PI

    // procurar o maior peso

    var maxWeight = data //p de previus c de current para encortar esta linha
        .fold<DataPoint>(data[0], (p, c) => p.peso > c.peso ? p : c)
        .peso;

    var yRatio = size.height / maxWeight;
    var curveOffset = xSpacing * 0.3;

    List<Offset> offsets = [];

    var currentX = 0.0;

    for (int i = 0; i < data.length; i++) {
      var y = size.height -
          (data[i].peso * yRatio * _size.value); //FUCKING FINALLY CRLAHS

      offsets.add(Offset(currentX, y));

      currentX += xSpacing;
    }

    Paint linePaint = Paint()
      ..color = Color(0xff30c3f9)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0;

    Paint shadowPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..maskFilter = ui.MaskFilter.blur(ui.BlurStyle.solid, 3)
      ..strokeWidth = 3.0;

    Paint fillPaint = Paint()
      ..shader = ui.Gradient.linear(
          Offset(size.width / 2, 0), Offset(size.width / 2, size.height), [
        Color(0xff30c3f9),
        Colors.white,
      ])
      ..color = Colors.blue
      ..style = PaintingStyle.fill
      ..strokeWidth = 3.0;

    Paint dotOutlinePaint = Paint()
      ..color = Colors.white.withAlpha(100)
      ..strokeWidth = 8;

    Paint dotCenter = Paint()
      ..color = Color(0xff30c3f9)
      ..strokeWidth = 8;

    Path linePath = Path();

    Offset currentOffset = offsets[0];

    linePath.moveTo(currentOffset.dx, currentOffset.dy);

    for (int i = 1; i < offsets.length; i++) {
      var x = offsets[i].dx;
      var y = offsets[i].dy;

      var c1x = currentOffset.dx + curveOffset;
      var c1y = currentOffset.dy;
      var c2x = x - curveOffset;
      var c2y = y;

      linePath.cubicTo(c1x, c1y, c2x, c2y, x, y);
      currentOffset = offsets[i];
    }

    Path fillPath = Path.from(linePath);
    fillPath.lineTo(size.width, size.height);
    fillPath.lineTo(0, size.height);

    canvas.drawPath(fillPath, fillPaint);
    canvas.drawPath(linePath, shadowPaint);
    canvas.drawPath(linePath, linePaint);

    canvas.drawCircle(offsets[7], 15 * _dotsize.value, dotOutlinePaint);
    canvas.drawCircle(offsets[7], 7 * _dotsize.value, dotCenter);
  }

  @override
  bool shouldRepaint(covariant GraphPainter oldDelegate) {

    return data != oldDelegate.data; // assim muda sempre que o que estiver na variavel data mudar
  }
}

class DataPoint {
  final int day;
  final int peso;

  DataPoint({
    required this.day,
    required this.peso,
  });
}

List<RegistoDePeso> registosGraph = registos;
