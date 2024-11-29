import 'package:flutter/material.dart';
import 'framingham_form.dart';
import 'framingham_data.dart';
import 'framingham_form_female.dart';

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
    isMale = widget.showMaleScreen;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isMale ? Colors.blue[100] : Colors.pink[100],
      body: SingleChildScrollView( // Envolva o corpo com SingleChildScrollView
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
              margin: const EdgeInsets.only(top: 16.0),
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
                    color: const Color.fromARGB(255, 8, 41, 90),
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            // Usando Wrap para comportar as tabelas uma ao lado da outra
            Wrap(
              spacing: 16.0, // Espaço entre as tabelas
              runSpacing: 16.0, // Espaço entre as linhas
              children: [
                Container(
                  child:  isMale ? DataTableWidget(MaleData.agePointsTable, 'Tabela de Idade') : DataTableWidget(FemaleData.agePointsTable, 'Tabela de Idade'),
                ),
                Container(
                  child: isMale ? DataTableWidget(MaleData.ldlCholesterolTable, 'LDL- colesterol') : DataTableWidget(FemaleData.ldlCholesterolTable, 'LDL- colesterol'),
                ),
                Container(
                  child: isMale ? DataTableWidget(MaleData.hdlCholesterolTable, 'HDL- colesterol') : DataTableWidget(FemaleData.hdlCholesterolTable, 'HDL- colesterol'),
                ),
                Container(
                  child: isMale ? DataTableWidget(MaleData.diabetesTable, 'Tabela Diabetes') : DataTableWidget(FemaleData.diabetesTable, 'Tabela Diabetes'),
                ),
                Container(
                  child: isMale ? DataTableWidget(MaleData.smokingTable, 'Tabela Tabagismo') : DataTableWidget(FemaleData.smokingTable, 'Tabela Tabagismo'),
                ),
                Container(
                  child: isMale ? DataTableWidget(MaleData.bloodPressureTable, 'Pressão Sistólica (mmHg) | Pressão Diastólica (mmHg)') : DataTableWidget(FemaleData.bloodPressureTable, 'Pressão Sistólica (mmHg) | Pressão Diastólica (mmHg)'),
                ),
                Container(
                  child: isMale ? DataTableWidget(MaleData.sumPointsTable, 'Tabela probabilidades') : DataTableWidget(FemaleData.sumPointsTable, 'Tabela probabilidades'),
                ),
                // Adicione mais tabelas se necessário
              ],
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              child: FraminghamForm(),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    isMale = !isMale;
                  });
                },
                child: Text(isMale ? 'Mudar para Tabela Mulheres' : 'Mudar para Tabela Homens'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class DataTableWidget extends StatelessWidget {
  final List<List<String>> data;
  final String tableTitle;

  DataTableWidget(this.data, this.tableTitle);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                tableTitle,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            // Adicionando SingleChildScrollView para rolagem horizontal
            SingleChildScrollView(
              scrollDirection: Axis.horizontal, // Permite rolar horizontalmente
              child: DataTable(
                columns: data[0].map((column) {
                  return DataColumn(label: Text(column));
                }).toList(),
                rows: data.sublist(1).map((row) {
                  return DataRow(
                    cells: row.map((cell) {
                      return DataCell(Text(cell));
                    }).toList(),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
