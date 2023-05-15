import 'package:app/data_structures/vertices.dart';

class Pair<T> extends Comparable<Pair<T>> {
  Pair(this.distancia, [this.vertice]);
  double distancia;
  Vertice<T>? vertice;

  @override
  int compareTo(Pair<T> other) {
    if (distancia == other.distancia) return 0;
    if (distancia > other.distancia) return 1;
    return -1;
  }

  @override
  String toString() => '($distancia, $vertice)';
}
