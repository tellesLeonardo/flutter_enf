import 'package:flutter/material.dart';

class FraminghamFormFemale extends StatefulWidget {
  const FraminghamFormFemale({Key? key}) : super(key: key);

  @override
  State<FraminghamFormFemale> createState() => _FraminghamFormFemaleState();
}

class _FraminghamFormFemaleState extends State<FraminghamFormFemale> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _ldlController = TextEditingController();
  final TextEditingController _hdlController = TextEditingController();
  final TextEditingController _systolicController = TextEditingController();
  final TextEditingController _diastolicController = TextEditingController();
  bool _isDiabetic = false;
  bool _isSmoker = false;

  String? _riskPercentage;

  void _calculateRisk() {
    if (_formKey.currentState!.validate()) {
      final int age = int.parse(_ageController.text);
      final double ldl = double.parse(_ldlController.text);
      final double hdl = double.parse(_hdlController.text);
      final int systolic = int.parse(_systolicController.text);
      final int diastolic = int.parse(_diastolicController.text);

      int points = 0;

      // Calcular pontos de idade
      if (age < 30) points -= 9;
      if (age >= 30 && age <= 34) points -= 9;
      if (age >= 35 && age <= 39) points -= 4;
      if (age >= 40 && age <= 44) points += 0;
      if (age >= 45 && age <= 49) points += 3;
      if (age >= 50 && age <= 54) points += 6;
      if (age >= 55 && age <= 59) points += 7;
      if (age >= 60 && age <= 64) points += 8;
      if (age >= 65 && age <= 69) points += 8;
      if (age >= 70 && age <= 74) points += 8;

      // Calcular pontos de LDL
      if (ldl < 100) points -= 2;
      if (ldl >= 100 && ldl <= 129) points += 0;
      if (ldl >= 130 && ldl <= 159) points += 0;
      if (ldl >= 160 && ldl <= 189) points += 2;
      if (ldl >= 190) points += 2;

      // Calcular pontos de HDL
      if (hdl < 35) points += 5;
      if (hdl >= 35 && hdl <= 44) points += 2;
      if (hdl >= 45 && hdl <= 49) points += 1;
      if (hdl >= 50 && hdl <= 59) points += 0;
      if (hdl >= 60) points -= 2;

      // Calcular pontos de pressão arterial
      // 120 init
      if (systolic < 120 && diastolic < 80) points -= 3;
      if (systolic < 120 && diastolic >= 80 && diastolic <= 89) points += 0;
      if (systolic < 120 && diastolic >= 90 && diastolic <= 99) points += 2;
      if (systolic < 120 && diastolic >= 100) points += 3;
      // 120 finish

      // 120-129 init
      if (systolic >= 120 && systolic <= 129 && diastolic <= 89) points += 0;
      if (systolic >= 120 && systolic <= 129 && diastolic >= 90 && diastolic <= 99) points += 2;
      if (systolic >= 120 && systolic <= 129 && diastolic >= 100) points += 3;
      // 120-129 finish

      // 130-139 init
      if (systolic >= 130 && systolic <= 139 && diastolic <= 89) points += 0;
      if (systolic >= 130 && systolic <= 139 && diastolic >= 90 && diastolic <= 99) points += 2;
      if (systolic >= 130 && systolic <= 139 && diastolic >= 100) points += 3;
      // 130-139 finish

      // 140-159 init
      if (systolic >= 140 && systolic <= 159 && diastolic <= 99) points += 2;
      if (systolic >= 140 && systolic <= 159 && diastolic >= 100) points += 3;
      // 140-159 finish

      // 160> init
      if (systolic >= 160) points += 3;
      // 160> finish

      // Calcular pontos por diabetes
      if (_isDiabetic) points += 4;

      // Calcular pontos por tabagismo
      if (_isSmoker) points += 2;

      // Determinar risco baseado no total de pontos
      final Map<int, String> riskTable = {
        -2: "1%",
        -1: "2%",
        0: "2%",
        1: "2%",
        2: "3%",
        3: "3%",
        4: "4%",
        5: "5%",
        6: "6%",
        7: "7%",
        8: "8%",
        9: "9%",
        10: "11%",
        11: "13%",
        12: "15%",
        13: "17%",
        14: "20%",
        15: "24%",
        16: "27%",
        17: ">32%"
      };

      setState(() {
        _riskPercentage = points < -2 ? "1%" : riskTable.containsKey(points) ? riskTable[points] : ">32%";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: ListView(
          children: [
            TextFormField(
              controller: _ageController,
              decoration: const InputDecoration(labelText: 'Idade'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) return 'Informe a idade';
                return null;
              },
            ),
            TextFormField(
              controller: _ldlController,
              decoration: const InputDecoration(labelText: 'LDL (mg/dL)'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) return 'Informe o LDL';
                return null;
              },
            ),
            TextFormField(
              controller: _hdlController,
              decoration: const InputDecoration(labelText: 'HDL (mg/dL)'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) return 'Informe o HDL';
                return null;
              },
            ),
            TextFormField(
              controller: _systolicController,
              decoration: const InputDecoration(labelText: 'Pressão Sistólica (mmHg)'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) return 'Informe a pressão sistólica';
                return null;
              },
            ),
            TextFormField(
              controller: _diastolicController,
              decoration: const InputDecoration(labelText: 'Pressão Diastólica (mmHg)'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) return 'Informe a pressão diastólica';
                return null;
              },
            ),
            SwitchListTile(
              title: const Text('Diabetes'),
              value: _isDiabetic,
              onChanged: (value) {
                setState(() {
                  _isDiabetic = value;
                });
              },
            ),
            SwitchListTile(
              title: const Text('Fumante'),
              value: _isSmoker,
              onChanged: (value) {
                setState(() {
                  _isSmoker = value;
                });
              },
            ),
            ElevatedButton(
              onPressed: _calculateRisk,
              child: const Text('Calcular Risco'),
            ),
            if (_riskPercentage != null)
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  'Risco cardiovascular em 10 anos: $_riskPercentage',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
