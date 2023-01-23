import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class WeatherSearchScreen extends ConsumerStatefulWidget {
  const WeatherSearchScreen({super.key});

  @override
  ConsumerState<WeatherSearchScreen> createState() =>
      _WeatherSearchScreenState();
}

class _WeatherSearchScreenState extends ConsumerState<WeatherSearchScreen> {
  final TextEditingController _textController = TextEditingController();

  String get _text => _textController.text;

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('City Search')),
      body: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: TextField(
                controller: _textController,
                decoration: const InputDecoration(
                  labelText: 'City',
                  hintText: 'Chicago',
                ),
              ),
            ),
          ),
          IconButton(
            key: const Key('searchPage_search_iconButton'),
            icon: const Icon(Icons.search, semanticLabel: 'Submit'),
            onPressed: () async {
              Navigator.pop(context, _text);
            },
          )
        ],
      ),
    );
  }
}
