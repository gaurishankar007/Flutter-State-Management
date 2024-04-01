import 'package:flutter/material.dart';

import '../model/animal.dart';
import '../model/person.dart';
import '../rxBloc/search_result.dart';

class SearchResultView extends StatelessWidget {
  final Stream<SearchResult?> searchResult;
  const SearchResultView({
    super.key,
    required this.searchResult,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SearchResult?>(
      stream: searchResult,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final result = snapshot.data;

          if (result is SearchResultError) {
            return Text(
              "Got Error: ${result.error} (May Be Live server is not on for the json files)",
            );
          } else if (result is SearchResultLoading) {
            return const CircularProgressIndicator();
          } else if (result is SearchResultEmpty) {
            return const Text("No results found try search term. Try with another one!");
          } else if (result is SearchResultWithResult) {
            final results = result.results;

            return Expanded(
              child: ListView.separated(
                itemCount: results.length,
                separatorBuilder: (context, index) => const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  final item = results[index];
                  final String title;

                  if (item is Animal) {
                    title = 'Animal';
                  } else if (item is Person) {
                    title = 'Person';
                  } else {
                    title = "Unknown";
                  }

                  return ListTile(
                    title: Text(title),
                    subtitle: Text(item.toString()),
                  );
                },
              ),
            );
          }
        }

        return const Text("Waiting....");
      },
    );
  }
}
