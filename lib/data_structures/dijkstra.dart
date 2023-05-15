import 'package:app/data_structures/grafo.dart';
import 'package:app/data_structures/lista_de_adjacencia.dart';
import 'package:app/data_structures/pair_comparable.dart';
import 'package:app/data_structures/priority_queue.dart';
import 'package:app/data_structures/vertices.dart';

class Dijkstra<E> {
  Dijkstra(this.graph);
  final Grafo<E> graph;

  Map<Vertice<E>, Pair<E>?> shortestPaths(Vertice<E> source) {
    final queue = PriorityQueue<Pair<E>>(priority: Priority.min);
    final visited = <Vertice<E>>{};
    final paths = <Vertice<E>, Pair<E>?>{};

    for (final vertex in graph.vertices) {
      paths[vertex] = null; // Descrevemos a distancia como null (infinito)
    }

    queue.enqueue(Pair(0, source));
    paths[source] = Pair(0);
    visited.add(source);

    while (!queue.isEmpty) {
      final current = queue.dequeue()!;

      final savedDistance = paths[current.vertice]!.distancia;
      if (current.distancia > savedDistance) continue;

      visited.add(current.vertice!);
      final listOfEdges =
          (graph as ListaDeAdjacencia<E>).conecoes[current.vertice!];

      for (final edge in listOfEdges!) {
        final neighbor = edge.destino;

        if (visited.contains(neighbor)) continue;

        final weight = edge.peso ?? 0;
        final totalDistance = current.distancia + weight;

        final knownDistance = paths[neighbor]?.distancia ?? 0;

        if (totalDistance < knownDistance) {
          paths[neighbor] = Pair(totalDistance, current.vertice);
          queue.enqueue(Pair(totalDistance, neighbor));
        }
      }
    }
    return paths;
  }

  List<Vertice<E>> shortestPathsImplementation2(Vertice<E> source) {
    return [];
  }
}
