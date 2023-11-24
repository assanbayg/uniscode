import 'package:flutter/material.dart';
import 'package:graphview/graphview.dart';
import 'package:uniscode/presentation/widgets/circle_node_widget.dart';

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
          'value': 'Cultural Identity',
          'description':
              'The identity of a group or culture, including language, traditions, and beliefs'
        },
        {
          'id': '2',
          'value': 'Ethnicity',
          'description':
              'Categorization based on shared cultural traits, ancestry, nationality, or regional origin'
        },
        {
          'id': '3',
          'value': 'Heritage',
          'description':
              'Inherited traditions, customs, and attributes passed down through generations'
        },
        {
          'id': '4',
          'value': 'Diversity',
          'description':
              'Variety and differences within a group, society, or culture'
        },
        {
          'id': '5',
          'value': 'Acculturation',
          'description':
              'The process of adopting and integrating aspects of another culture'
        },
        {
          'id': '6',
          'value': 'Pluralism',
          'description':
              'The coexistence of diverse cultural groups, respecting and valuing differences'
        },
        {
          'id': '7',
          'value': 'Cosmopolitan',
          'description':
              'Familiar with and at ease in different cultures or parts of the world'
        },
        {
          'id': '8',
          'value': 'Syncretism',
          'description':
              'The blending or fusion of different cultural elements or beliefs'
        },
        {
          'id': '9',
          'value': 'Homogeneity',
          'description': 'Uniformity or similarity within a cultural group'
        },
        {
          'id': '10',
          'value': 'Hybridity',
          'description':
              'The combination of elements from different cultures, creating something new'
        }
      ],
      'edges': [
        {'source': '1', 'target': '2'},
        {'source': '1', 'target': '3'},
        {'source': '1', 'target': '4'},
        {'source': '2', 'target': '5'},
        {'source': '2', 'target': '6'},
        {'source': '3', 'target': '6'},
        {'source': '4', 'target': '8'},
        {'source': '4', 'target': '9'},
        {'source': '5', 'target': '8'},
        {'source': '5', 'target': '10'},
        {'source': '6', 'target': '7'},
        {'source': '6', 'target': '8'},
        {'source': '9', 'target': '10'}
      ]
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
    final args = ModalRoute.of(context)?.settings.arguments as String;

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
