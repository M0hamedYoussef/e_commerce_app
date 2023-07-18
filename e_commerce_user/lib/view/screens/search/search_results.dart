import 'package:e_commerce/view/widgets/search/search_list.dart';
import 'package:flutter/material.dart';

class SearchResultsScreen extends StatelessWidget {
  const SearchResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SearchResultsList(),
    );
  }
}
