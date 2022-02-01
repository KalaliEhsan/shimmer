import 'package:flutter/material.dart';
import 'package:shimmer_sample/shimmer.dart';
import 'package:shimmer_sample/shimmer_loading.dart';
import 'card_list_item.dart';
import 'gradient.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Demo Shimmer'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Shimmer(
          linearGradient: shimmerGradient,
          child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) => _buildListItem())),
      floatingActionButton: FloatingActionButton(onPressed: () {
        setState(() {
          _isLoading = !_isLoading;
        });
      }),
    );
  }

  Widget _buildListItem() {
    return ShimmerLoading(
      isLoading: _isLoading,
      child: CardListItem(
        isLoading: _isLoading,
      ),
    );
  }
}
