import 'package:flutter/material.dart';

void main() {
  runApp(const FraminghamApp());
}

class FraminghamApp extends StatelessWidget {
  const FraminghamApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ToggleScreen(showMaleScreen: true),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ToggleScreen extends StatefulWidget {
  final bool showMaleScreen;

  // Construtor para inicializar showMaleScreen
  const ToggleScreen({super.key, required this.showMaleScreen});

  @override
  _ToggleScreenState createState() => _ToggleScreenState();
}

class _ToggleScreenState extends State<ToggleScreen> {
  late bool isMale;

  @override
  void initState() {
    super.initState();
    isMale =
        widget.showMaleScreen; // Inicialize com o valor fornecido pelo widget
  }

  // 'MULHERES'

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isMale ? Colors.blue[100] : Colors.pink[100],
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: isMale
                ? const Color.fromARGB(255, 6, 36, 82)
                : const Color.fromARGB(255, 255, 0, 127),
            padding: const EdgeInsets.all(16.0),
            child: const Center(
              child: Text(
                'PREVENÇÃO CLÍNICA DE DOENÇA CARDIOVASCULAR, CEREBROVASCULAR E RENAL CRÔNICA',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Container(
            margin:
                const EdgeInsets.only(top: 16.0), // Adicionando margin no topo
            child: const Text('ESCORE DE FRAMINGHAM (REVISADO)',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                )),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Center(
              child: Text(
                isMale ? 'HOMENS' : 'MULHERES',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 8, 41, 90),
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                // Primeira Coluna
                Expanded(
                  child: Container(
                    child: isMale
                        ? FraminghamTableScreen(mychildren: [
                            SectionTable('Tabela homen 1'),
                            SectionTable('Tabela homen 2')
                          ])
                        : FraminghamTableScreen(mychildren: [
                            SectionTable('Tabela mulher 1'),
                            SectionTable('Tabela mulher 2')
                          ]),
                  ),
                ),
                // Segunda Coluna
                Expanded(
                  child: Container(
                    child: isMale
                        ? FraminghamTableScreen(
                            mychildren: [SectionTable('Tabela homen 3')])
                        : FraminghamTableScreen(
                            mychildren: [SectionTable('Tabela mulher 3')]),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  isMale = !isMale;
                });
              },
              child: Text(isMale ? 'Tabela Homens' : 'Tabela Mulheres'),
            ),
          ),
        ],
      ),
    );
  }
}

class FraminghamTableScreen extends StatelessWidget {
  late List<SectionTable> mychildren;

  // Construtor com parâmetro
  FraminghamTableScreen({Key? key, required this.mychildren}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: mychildren,
    );
  }
}

class PlaceholderWidget extends StatelessWidget {
  final String text;

  const PlaceholderWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: const TextStyle(
            fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black54),
        textAlign: TextAlign.center,
      ),
    );
  }
}

// Widget para cada tabela
// precisa ser contruido para criar as tabelas com valores que vem de fora
class SectionTable extends StatelessWidget {
  final String title;

  const SectionTable(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Text(
        title,
        style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 0, 0, 0)),
      ),
    );
  }
}
