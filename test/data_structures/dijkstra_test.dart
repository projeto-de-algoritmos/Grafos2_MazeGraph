import 'package:app/data_structures/dijkstra.dart';
import 'package:app/data_structures/lista_de_adjacencia.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Teste diskstra', () async {
    ListaDeAdjacencia<Color> listaDeAdjacencia = ListaDeAdjacencia<Color>();
    final character = listaDeAdjacencia.criarVertice(Colors.red, 1, 1);
    final ver12 = listaDeAdjacencia.criarVertice(Colors.black, 1, 2);
    final ver13 = listaDeAdjacencia.criarVertice(Colors.transparent, 1, 3);
    final ver21 = listaDeAdjacencia.criarVertice(Colors.transparent, 2, 1);
    final ver22 = listaDeAdjacencia.criarVertice(Colors.black, 2, 2);
    final ver23 = listaDeAdjacencia.criarVertice(Colors.transparent, 2, 3);
    final ver31 = listaDeAdjacencia.criarVertice(Colors.transparent, 3, 1);
    final ver32 = listaDeAdjacencia.criarVertice(Colors.transparent, 3, 2);
    //Result
    final ganhou = listaDeAdjacencia.criarVertice(Colors.yellow, 3, 3);

    /* listaDeAdjacencia.addAresta(inicio: ver12, destino: ver13); */

    final dijkstra = Dijkstra<Color>(listaDeAdjacencia);

    final result = dijkstra.shortestPathsImplementation2(character);

    print(result);
  });
}
