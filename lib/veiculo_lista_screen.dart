import 'package:flutter/material.dart';
import 'package:flutter_gestao_veiculos/veiculo.dart';
import 'package:flutter_gestao_veiculos/veiculo_cadastro_screen.dart';

class VeiculoListaScreen extends StatefulWidget {
  const VeiculoListaScreen({super.key});

  @override
  State<VeiculoListaScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<VeiculoListaScreen> {
  final List<Veiculo> veiculos = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Center(
            child: Text(
          "Lista de Veículos",
          style: TextStyle(color: Colors.white, fontSize: 25),
        )),
      ),
      floatingActionButton: FloatingActionButton(
          heroTag: "veiculo.lista.add",
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const VeiculoCadastroScreen(),
                )).then((value) {
              if (value != null) {
                Veiculo veiculoAdicionado = value;

                setState(() {
                  veiculos.add(veiculoAdicionado);
                });
              }
            });
          },
          child: const Icon(Icons.add)),
      body: ListView.builder(
        itemCount: veiculos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: retornarComponenteVeiculo(index),
          );
        },
      ),
    );
  }

  Widget retornarComponenteVeiculo(int index) {
    Veiculo veiculo = veiculos[index];
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Text("Fabricante ${veiculo.fabricante}",
              style: const TextStyle(fontSize: 20)),
          Text("Modelo ${veiculo.modelo}",
              style: const TextStyle(fontSize: 20)),
          Text("Ano Fabricação ${veiculo.anoFabrica}",
              style: const TextStyle(fontSize: 20)),
          Text(
            "Placa ${veiculo.placa}",
            style: const TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
