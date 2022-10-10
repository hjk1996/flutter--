import 'dart:convert';

class Edge {
  final Set<int> edge;
  Edge({required this.edge});

  factory Edge.fromJson(Map<String, dynamic> json) {
    final String edgeString = json['edge'];
    var edge = jsonDecode(edgeString);
    edge = Set.from(edge);
    return Edge(edge: edge);
  }
}
