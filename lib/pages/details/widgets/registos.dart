import 'package:flutter/material.dart';
import 'package:weighter/models/registo_de_peso.dart';

class Graphs extends StatelessWidget {
  const Graphs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Registos Recentes",
              style: Theme.of(context).textTheme.headline1,
            ),
            Expanded(
              child: ListView.separated(
                  //so assim nao dá, tenho de dar wrap com um widget
                  itemCount: registos.length,
                  itemBuilder: (context, index) {
                    return RegistCard(
                      registo: registosRecentes[index],
                    );
                  }, separatorBuilder: (context, index) => SizedBox(height: 20 ,),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class RegistCard extends StatelessWidget {
  final RegistoDePeso registo;

  const RegistCard({Key? key, required this.registo}) : super(key: key);

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
        style: Theme.of(context).textTheme.headline1,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Peso: " + registo.pesoStr + " Kg"),
            // aqui Peso
            Text("Sentia-se " + registo.setimento.toString() + " de 5"),
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
                Text("Registado a " + registo.data) // aqui Data do registo
              ],
            )
          ],
        ),
      ),
    );
  }
}

List<RegistoDePeso> registosRecentes = registos.reversed.toList();
