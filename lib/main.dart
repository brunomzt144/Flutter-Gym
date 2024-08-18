import 'package:flutter/material.dart';

void main() {
    runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext  
 context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Gerenciador  de Exercícios'),
        ),
        body: const ExerciseForm(),
      ),
    );
  }
}
class ExerciseForm extends StatefulWidget {
  const ExerciseForm({super.key});

  @override
  State<ExerciseForm> createState() => _ExerciseFormState();
}

class _ExerciseFormState extends State<ExerciseForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  String _selectedDay = 'Segunda'; // Valor inicial
  int _repetitions = 0;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(labelText: 'Nome do Exercício'),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor, insira o nome do exercício';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _descriptionController,
            decoration: const InputDecoration(labelText: 'Descrição'),
            maxLines: 3,
          ),
          DropdownButtonFormField(
            value: _selectedDay,
            items: const [
              DropdownMenuItem(
                value: 'Segunda',
                child: Text('Segunda-feira'),
              ),
              // ... outros dias da semana
            ],
            onChanged: (String? newValue) {
              setState(() {
                _selectedDay = newValue!;
              });
            },
            decoration: const InputDecoration(labelText: 'Dia'),
          ),
          TextFormField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Repetições'),
            onChanged: (value) {
              setState(() {
                _repetitions = int.tryParse(value) ?? 0;
              });
            },
          ),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // Lógica para salvar o exercício (implementar)
                print('Nome: ${_nameController.text}');
                print('Descrição: ${_descriptionController.text}');
                print('Dia: $_selectedDay');
                print('Repetições: $_repetitions');
              }
            },
            child: const Text('Salvar'),
          ),
        ],
      ),
    );
  }
}