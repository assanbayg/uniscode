import 'package:flutter/material.dart';
import 'package:graphview/graphview.dart';
import 'package:uniscode/presentation/circle_node_widget.dart';

class GraphViewScreen extends StatefulWidget {
  static const routeName = '/graphview';
  const GraphViewScreen({super.key});

  @override
  State<GraphViewScreen> createState() => _GraphViewScreenState();
}

class _GraphViewScreenState extends State<GraphViewScreen> {
  final Graph graph = Graph();

  @override
  void initState() {
    // any json data you desire but i desire for sleep
    // but describe nodes and edges
    var jsonData = {
      'nodes': [
        {
          'id': '1',
          'value': 'Initiate',
          'description': 'The commencement point'
        },
        {
          'id': '2',
          'value': 'Subsequent',
          'description': 'Following in order or succession'
        },
        {
          'id': '3',
          'value': 'Sequential',
          'description': 'Arranged in a sequence'
        },
        {
          'id': '4',
          'value': 'Cognizant',
          'description': 'Aware and perceptive'
        },
        {
          'id': '5',
          'value': 'Ubiquitous',
          'description': 'Present everywhere at the same time'
        },
        {
          'id': '6',
          'value': 'Hella smart',
          'description': 'Present everywhere at the same time'
        },
      ],
      'edges': [
        {'source': '1', 'target': '2'},
        {'source': '2', 'target': '3'},
        {'source': '3', 'target': '4'},
        {'source': '4', 'target': '5'},
        {'source': '1', 'target': '6'},
        {'source': '2', 'target': '6'},
      ],
    };

    // create nodes from json
    var nodeMap = <String, Node>{};
    for (var nodeData in jsonData['nodes']!) {
      var node = Node.Id(nodeData['value']);
      graph.addNode(node);
      nodeMap[nodeData['id'] as String] = node;
    }

    // create edges from JSON
    for (var edgeData in jsonData['edges']!) {
      var sourceNode = nodeMap[edgeData['source']];
      var targetNode = nodeMap[edgeData['target']];
      graph.addEdge(sourceNode!, targetNode!);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InteractiveViewer(
        constrained: false,
        boundaryMargin: const EdgeInsets.all(100),
        minScale: 0.01,
        maxScale: 5.6,
        child: GraphView(
          graph: graph,
          algorithm: FruchtermanReingoldAlgorithm(),
          paint: Paint()
            ..color = Colors.green
            ..strokeWidth = 1
            ..style = PaintingStyle.stroke,
          builder: (Node node) {
            return CirlceNodeWidget(node);
          },
        ),
      ),
    );
  }
}
