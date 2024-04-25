import 'package:flutter/material.dart';
import 'package:flutter_gestao_veiculos/veiculo.dart';

class VeiculoCadastroScreen extends StatefulWidget {
  const VeiculoCadastroScreen({super.key});

  @override
  State<VeiculoCadastroScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<VeiculoCadastroScreen> {
  final fabricanteController = TextEditingController();
  final modeloController = TextEditingController();
  final anoFabricaController = TextEditingController();
  final placaController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Center(
          child: Text(
            "Cadastro de Veículos",
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            children: [
              TextField(
                controller: fabricanteController,
                decoration: const InputDecoration(label: Text("Fabricante")),
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              TextField(
                controller: modeloController,
                decoration: const InputDecoration(label: Text("Modelo")),
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              TextField(
                controller: anoFabricaController,
                decoration:
                    const InputDecoration(label: Text("Ano de Fabricação")),
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              TextField(
                controller: placaController,
                decoration: InputDecoration(label: Text("Placa")),
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: double.infinity,
                child: FloatingActionButton(
                  heroTag: "veiculo.cadastro.salvar",
                  onPressed: () {
                    String? fabricante = fabricanteController.text;
                    String? modelo = modeloController.text;
                    String? anoFabrica = anoFabricaController.text;
                    String? placa = placaController.text;

                    Veiculo veiculo = Veiculo(
                        fabricante: fabricante,
                        modelo: modelo,
                        anoFabrica: anoFabrica,
                        placa: placa);

                    Navigator.pop(context, veiculo);
                  },
                  child: const Text("Salvar"),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: FloatingActionButton(
                  heroTag: "veiculo.cadastro.voltar",
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Voltar"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
