import 'package:flutter/material.dart';

import '../repository/api.dart';
import '../rxBloc/search_bloc.dart';
import '../widgets/search_result_view.dart';

class StateStreamingPage extends StatefulWidget {
  const StateStreamingPage({super.key});

  @override
  State<StateStreamingPage> createState() => _StateStreamingPageState();
}

class _StateStreamingPageState extends State<StateStreamingPage> {
  late final SearchBloc _searchBloc;

  @override
  void initState() {
    super.initState();
    _searchBloc = SearchBloc(api: Api());
  }

  @override
  void dispose() {
    _searchBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Behavior Subject Search State Streaming")),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * .7,
              child: TextField(
                decoration: const InputDecoration(
                  hintText: "Enter your search term here...",
                  enabledBorder: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(),
                ),
                onChanged: _searchBloc.search.add,
              ),
            ),
            const SizedBox(height: 15, width: double.maxFinite),
            SearchResultView(searchResult: _searchBloc.results),
          ],
        ),
      ),
    );
  }
}
