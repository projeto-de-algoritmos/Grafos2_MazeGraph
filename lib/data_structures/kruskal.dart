import 'dart:math';

import 'package:app/data_structures/aresta.dart';
import 'package:app/data_structures/vertices.dart';

class Conjunto {
  final int pai;
  final int rank;

  Conjunto({required this.pai, required this.rank});
}

class KruskalAlgorithm {
  List<Conjunto> conjuntos = [];
  List<Aresta<dynamic>> arestas = [];

  List<Aresta<dynamic>> gerarLabirinto(List<Vertice<dynamic>> vertices) {
    for (int i = 0; i < vertices.length; i++) {
      conjuntos.add(Conjunto(pai: i, rank: 0));
    }

    final random = Random();
    vertices.shuffle(random);

    for (int i = 0; i < vertices.length - 1; i++) {
      final inicio = vertices[i];
      final destino = vertices[i + 1];
      final aresta = Aresta<dynamic>(inicio: inicio, destino: destino);
      arestas.add(aresta);
    }

    arestas.shuffle(random);

    final labirinto = <Aresta<dynamic>>[];

    for (var aresta in arestas) {
      final inicioConjunto = encontrarConjunto(aresta.inicio.indexX);
      final destinoConjunto = encontrarConjunto(aresta.destino.indexX);

      if (inicioConjunto != destinoConjunto) {
        unirConjuntos(inicioConjunto, destinoConjunto);
        labirinto.add(aresta);
      }
    }

    return labirinto;
  }

  int encontrarConjunto(int verticeIndex) {
    if (conjuntos[verticeIndex].pai != verticeIndex) {
      conjuntos[verticeIndex] = Conjunto(
        pai: encontrarConjunto(conjuntos[verticeIndex].pai),
        rank: conjuntos[verticeIndex].rank,
      );
    }
    return conjuntos[verticeIndex].pai;
  }

  void unirConjuntos(int vertice1, int vertice2) {
    final raiz1 = encontrarConjunto(vertice1);
    final raiz2 = encontrarConjunto(vertice2);

    if (conjuntos[raiz1].rank < conjuntos[raiz2].rank) {
      conjuntos[raiz1] = Conjunto(pai: raiz2, rank: conjuntos[raiz1].rank);
    } else if (conjuntos[raiz1].rank > conjuntos[raiz2].rank) {
      conjuntos[raiz2] = Conjunto(pai: raiz1, rank: conjuntos[raiz2].rank);
    } else {
      conjuntos[raiz2] = Conjunto(pai: raiz1, rank: conjuntos[raiz2].rank + 1);
    }
  }
}
