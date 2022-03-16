import 'package:flutter/material.dart';

import '../../../models/registo_de_peso.dart';

class RecentWeights extends StatelessWidget {

  const RecentWeights({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 30,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.arrow_forward, size: 15),
                  Text(
                    'Peso Médio Ultimos 7 Dias',
                    style: Theme
                        .of(context)
                        .textTheme
                        .headline1,
                  ),
                  Text(' teste')
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.arrow_forward, size: 15),
                  Text(
                    'Peso Médio Ultimos 30 Dias',
                    style: Theme
                        .of(context)
                        .textTheme
                        .headline1,
                  ),
                  Text(' teste')
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.arrow_forward, size: 15),
                  Text(
                    ' % Variaçao do Peso Médio Ultimos 7 Dias',
                    style: Theme
                        .of(context)
                        .textTheme
                        .headline1,
                  ),
                  Text(' teste')
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.arrow_forward, size: 15),
                  Text(
                    'Média do indicador como se sente  7 dias',
                    style: Theme
                        .of(context)
                        .textTheme
                        .headline1,
                  ),
                  Text('teste2'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.arrow_forward, size: 15),
                  Text(
                    'Média do indicador como se sente  30 dias',
                    style: Theme
                        .of(context)
                        .textTheme
                        .headline1,
                  ),
                  Text('teste2'),
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          width: double.infinity,
          height: 100,
          child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
              scrollDirection: Axis.horizontal,
              itemCount: 2,
              itemBuilder: (context, index) {
                return Registo(
                  registo: registosPrimeiroUltimo[index],
                );
              }, separatorBuilder: (context, index) => SizedBox(width: 11,),),
        )
      ],
    );
  }
}

class Registo extends StatelessWidget {

  final RegistoDePeso registo;

  const Registo({Key? key, required this.registo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      width: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          colorFilter: ColorFilter.mode(
            Color(0xff1ebdf8),
            BlendMode.lighten,
          ),
          image: registo.image,
          fit: BoxFit.cover,
        ),
      ),
      alignment: Alignment.bottomLeft,
      padding: const EdgeInsets.all(10),
      child: DefaultTextStyle.merge(
        style: Theme
            .of(context)
            .textTheme
            .headline2,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Peso: " +registo.pesoStr + " Kg"),
            // aqui Peso
            Text("Sentia-se " + registo.setimento.toString() + " de 1 a 5"),
            // aqui Como se sente hoje
            Row(
              children: [
                Icon(
                  Icons.call_received_rounded,
                  size: 15,
                  color: Colors.black87,
                ),
                SizedBox(
                  width: 3,
                ),
                Text("Registado a "+registo.data) // aqui Data do registo
              ],
            )
          ],
        ),
      ),
    );
  }
}

List<RegistoDePeso> registosPrimeiroUltimo = [
  registos[0],
  registos[registos.length - 1],
];
