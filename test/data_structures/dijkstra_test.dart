import 'package:app/data_structures/dijkstra.dart';
import 'package:app/data_structures/lista_de_adjacencia.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Teste diskstra', () async {
    ListaDeAdjacencia<Color> listaDeAdjacencia = ListaDeAdjacencia<Color>();

    final verA = listaDeAdjacencia.criarVertice(Colors.black, 1, 1);
    final verB = listaDeAdjacencia.criarVertice(Colors.black, 1, 2);
    final verC = listaDeAdjacencia.criarVertice(Colors.black, 1, 3);
    final verD = listaDeAdjacencia.criarVertice(Colors.black, 1, 4);
    final verE = listaDeAdjacencia.criarVertice(Colors.black, 1, 5);

    listaDeAdjacencia.addAresta(inicio: verA, destino: verB, peso: 4);
    listaDeAdjacencia.addAresta(inicio: verA, destino: verC, peso: 2);
    listaDeAdjacencia.addAresta(inicio: verB, destino: verC, peso: 3);
    listaDeAdjacencia.addAresta(inicio: verB, destino: verD, peso: 2);
    listaDeAdjacencia.addAresta(inicio: verB, destino: verE, peso: 3);
    listaDeAdjacencia.addAresta(inicio: verC, destino: verB, peso: 3);
    listaDeAdjacencia.addAresta(inicio: verC, destino: verD, peso: 4);
    listaDeAdjacencia.addAresta(inicio: verC, destino: verE, peso: 5);
    listaDeAdjacencia.addAresta(inicio: verE, destino: verD, peso: 5);

    final dijkstra = Dijkstra<Color>(listaDeAdjacencia);

    final result = dijkstra.shortestPaths(verA);

    print(listaDeAdjacencia);

    print(result);
  });
}
