import 'package:flutter/material.dart';

void main() {
  runApp(const BankingApp());
}

class BankingApp extends StatelessWidget {
  const BankingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplicação Bancária',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const BankingForm(),
    );
  }
}

class BankingForm extends StatefulWidget {
  const BankingForm({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BankingFormState createState() => _BankingFormState();
}

class _BankingFormState extends State<BankingForm> {
  final _formKey = GlobalKey<FormState>();

  // Controladores para os campos de entrada
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _accountController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulário Bancário'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              // Campo de nome
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Nome Completo',
                  icon: Icon(Icons.person),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira seu nome completo';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),

              // Campo de número da conta
              TextFormField(
                controller: _accountController,
                decoration: const InputDecoration(
                  labelText: 'Numero da Conta',
                  icon: Icon(Icons.account_balance),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o número da conta';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),

              // Campo de valor
              TextFormField(
                controller: _amountController,
                decoration: const InputDecoration(
                  labelText: 'Valor',
                  icon: Icon(Icons.attach_money),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o valor';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),

              // Campo de descrição
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Descrição',
                  icon: Icon(Icons.description),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira uma descrição';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),

              // Botão de envio
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    // Aqui você pode adicionar a lógica para processar os dados
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processando Dados')),
                    );
                  }
                },
                child: const Text('Enviar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
