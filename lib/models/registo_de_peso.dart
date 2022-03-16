import 'package:flutter/material.dart';

class RegistoDePeso {
  final AssetImage image;
  final bool comeu;
  final String pesoStr;
  final pesoInt;// talvez seja int??
  final int setimento; // o que é que sentes? borboletas.
  final String data;

  //final DateTime data;

  RegistoDePeso({
    required this.image,
    required this.comeu,
    required this.pesoStr,
    required this.pesoInt,
    required this.setimento,
    required this.data,
    // required this.data vai ser para quando for DateTime
  });
}

final List<RegistoDePeso> registos = [
  RegistoDePeso(
    image: AssetImage('lib/assets/pesos.jpg'),
    pesoStr: "100",
    pesoInt: 90,
    comeu: false,
    setimento: 3,
    data: "10/03/2022",
    //data: "12"
  ),
  RegistoDePeso(
    image: AssetImage('lib/assets/pesos.jpg'),
    pesoStr: "90",
    pesoInt: 20,
    comeu: false,
    setimento: 3,
    data: "11/03/2022",
    //data: "12"
  ),
  RegistoDePeso(
    image: AssetImage('lib/assets/pesos.jpg'),
    pesoStr: "30",
    pesoInt: 50,
    comeu: false,
    setimento: 3,
    data: "12/03/2022",
    //data: "12"
  ),
  RegistoDePeso(
    image: AssetImage('lib/assets/pesos.jpg'),
    pesoStr: "70",
    pesoInt: 40,
    comeu: false,
    setimento: 3,
    data: "13/03/2022",
    //data: "12"
  ),
  RegistoDePeso(
    image: AssetImage('lib/assets/pesos.jpg'),
    pesoStr: "60",
    pesoInt: 20,
    comeu: false,
    setimento: 3,
    data: "14/03/2022",
    //data: "12"
  ),
  RegistoDePeso(
    image: AssetImage('lib/assets/pesos.jpg'),
    pesoStr: "90",
    pesoInt: 60,
    comeu: false,
    setimento: 3,
    data: "15/03/2022",
    //data: "12"
  ),
  RegistoDePeso(
    image: AssetImage('lib/assets/pesos.jpg'),
    pesoStr: "80",
    pesoInt: 30,
    comeu: false,
    setimento: 3,
    data: "16/03/2022",
    //data: "12"
  ),
  RegistoDePeso(
    image: AssetImage('lib/assets/pesos.jpg'),
    pesoStr: "70",
    pesoInt: 80,
    comeu: false,
    setimento: 3,
    data: "17/03/2022",
    //data: "12"
  ),
  RegistoDePeso(
    image: AssetImage('lib/assets/pesos.jpg'),
    pesoStr: "60",
    pesoInt: 70,
    comeu: false,
    setimento: 3,
    data: "18/03/2022",
    //data: "12"
  ),RegistoDePeso(
    image: AssetImage('lib/assets/pesos.jpg'),
    pesoStr: "90",
    pesoInt: 40,
    comeu: false,
    setimento: 3,
    data: "19/03/2022",
    //data: "12"
  ),
  RegistoDePeso(
    image: AssetImage('lib/assets/pesos.jpg'),
    pesoStr: "80",
    pesoInt: 90,
    comeu: false,
    setimento: 3,
    data: "20/03/2022",
    //data: "12"
  ),
  RegistoDePeso(
    image: AssetImage('lib/assets/pesos.jpg'),
    pesoStr: "70",
    pesoInt: 20,
    comeu: false,
    setimento: 3,
    data: "21/03/2022",
    //data: "12"
  ),
  RegistoDePeso(
    image: AssetImage('lib/assets/pesos.jpg'),
    pesoStr: "60",
    pesoInt: 60,
    comeu: false,
    setimento: 3,
    data: "22/03/2022",
    //data: "12"
  ),
  RegistoDePeso(
    image: AssetImage('lib/assets/pesos.jpg'),
    pesoStr: "55",
    pesoInt: 70,
    comeu: false,
    setimento: 3,
    data: "23/03/2022",
    //data: "12"
  ),
  RegistoDePeso(
    image: AssetImage('lib/assets/pesos.jpg'),
    pesoStr: "50",
    comeu: false,
    pesoInt: 90,
    setimento: 3,
    data: "24/03/2022",
    //data: "12"
  ),
  RegistoDePeso(
    image: AssetImage('lib/assets/pesos.jpg'),
    pesoStr: "50",
    pesoInt: 40,
    comeu: false,
    setimento: 3,
    data: "25/03/2022",
    //data: "12"
  ),
];

