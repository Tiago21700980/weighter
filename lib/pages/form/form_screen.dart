import 'package:flutter/material.dart';

import '../../widgets/bottom_navigation.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {

  late String name;
  late int peso;
  bool comeu = false;
  late int sentimento = 1;
  late String Obs;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildNameField(){
    return TextFormField(
      decoration: InputDecoration(labelText:"Name"),
      validator: (String? value){
        if(value!.isEmpty){
          return 'Nane is Required';
        }
      },
      onSaved: (String? value){
        name = value!;
      },
    );
  }

  // Widget _buildPeso(){
  //   return null;
  // }
  //
  // Widget _buildComeu(){
  //   return null;
  // }
  //
  // Widget _buildSentimento(){
  //   return null;
  // }
  //
  // Widget _buildObs(){
  //   return null;
  // }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(24),
            child: Form(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildNameField(),
                // _buildComeu(),
                // _buildPeso(),
                // _buildSentimento(),
                // _buildObs(),
                SizedBox(height: 100,),
                ElevatedButton(
                  child: Text("Registar",
                  style: TextStyle(
                    color: Colors.blue,fontSize: 16
                  ),
                  ),
                  onPressed: () => {},
                )
              ],
            ),),
          ),

          BottomNavigation(),


        ],
      ),
    );
  }
}
