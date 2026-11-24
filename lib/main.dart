
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController nota1Controller = TextEditingController();
  TextEditingController nota2Controller = TextEditingController();
  TextEditingController nota3Controller = TextEditingController();
  TextEditingController nota4Controller = TextEditingController();

  String _infoText = "Informe suas notas";

  void _resetFields() {
    nota1Controller.clear();
    nota2Controller.clear();
    nota3Controller.clear();
    nota4Controller.clear();

    setState(() {
      _infoText = "Informe suas notas";
    });
  }

  void _calcular() {

    if (nota1Controller.text.isEmpty ||
        nota2Controller.text.isEmpty ||
        nota3Controller.text.isEmpty ||
        nota4Controller.text.isEmpty) {

      setState(() {
        _infoText = "Preencha todas as notas!";
      });

      return;
    }

    setState(() {

      double nota1 = double.parse(
          nota1Controller.text.replaceAll(',', '.'));

      double nota2 = double.parse(
          nota2Controller.text.replaceAll(',', '.'));

      double nota3 = double.parse(
          nota3Controller.text.replaceAll(',', '.'));

      double nota4 = double.parse(
          nota4Controller.text.replaceAll(',', '.'));

      double media = (nota1 + nota2 + nota3 + nota4) / 4;

      if (media <= 5.0) {
        _infoText =
            "Sua média foi: ${media.toStringAsPrecision(2)}.\n\nVocê ficou com R. Precisa estudar muito!";

      } else if (media <= 8.0) {
        _infoText =
            "Sua média foi: ${media.toStringAsPrecision(2)}.\n\nVocê ficou com B. Precisa estudar um pouco mais!";

      } else {
        _infoText =
            "Sua média foi: ${media.toStringAsPrecision(2)}.\n\nVocê ficou com MB. Foi aprovado com excelência!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text('Calculadora de Média'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 5, 136, 243),

        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _resetFields,
          ),
        ],
      ),

      backgroundColor: const Color.fromARGB(255, 175, 209, 236),

      body: SingleChildScrollView(

        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),

          child: Center(

            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: 450.0,
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,

                children: <Widget>[

                  SizedBox(height: 10),

                  Icon(
                    Icons.school,
                    size: 140.0,
                    color: Colors.blue,
                  ),

                  SizedBox(height: 15),

                  TextField(
                    controller: nota1Controller,
                    keyboardType: TextInputType.numberWithOptions(decimal: true),

                    decoration: InputDecoration(
                      labelText: "Nota 1",
                      filled: true,
                      fillColor: Colors.white,

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),

                    textAlign: TextAlign.center,

                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.blue,
                    ),
                  ),

                  SizedBox(height: 15),

                  TextField(
                    controller: nota2Controller,
                    keyboardType: TextInputType.numberWithOptions(decimal: true),

                    decoration: InputDecoration(
                      labelText: "Nota 2",
                      filled: true,
                      fillColor: Colors.white,

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),

                    textAlign: TextAlign.center,

                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.blue,
                    ),
                  ),

                  SizedBox(height: 15),

                  TextField(
                    controller: nota3Controller,
                    keyboardType: TextInputType.numberWithOptions(decimal: true),

                    decoration: InputDecoration(
                      labelText: "Nota 3",
                      filled: true,
                      fillColor: Colors.white,

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),

                    textAlign: TextAlign.center,

                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.blue,
                    ),
                  ),

                  SizedBox(height: 15),

                  TextField(
                    controller: nota4Controller,
                    keyboardType: TextInputType.numberWithOptions(decimal: true),

                    decoration: InputDecoration(
                      labelText: "Nota 4",
                      filled: true,
                      fillColor: Colors.white,

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),

                    textAlign: TextAlign.center,

                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.blue,
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: 20, bottom: 10),

                    child: SizedBox(
                      height: 45,

                      child: ElevatedButton(
                        onPressed: _calcular,

                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                        ),

                        child: Text(
                          'Calcular Média',

                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 20),

                    child: Text(
                      _infoText,

                      textAlign: TextAlign.center,

                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 22,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}