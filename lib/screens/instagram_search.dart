import 'package:flutter/material.dart';


class InstaGramSearch extends StatefulWidget {
  const InstaGramSearch({Key? key}) : super(key: key);

  @override
  _InstaGramSearchState createState() => _InstaGramSearchState();
}

class _InstaGramSearchState extends State<InstaGramSearch> {
  final TextEditingController _searchController = TextEditingController();
  List<String> _searchResults = [];

  // Mock data for search results (Replace with actual image URLs)
  final List<String> _mockResults = List.generate(
    50,
    (index) => 'https://images.pexels.com/photos/28238606/pexels-photo-28238606.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1', // Replace with actual image URLs
  );

  void _performSearch(String query) {
    setState(() {
      // Filter based on query
      _searchResults = _mockResults
          .where((image) => image.contains(query))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          decoration: const InputDecoration(
            hintText: 'Search',
            border: InputBorder.none,
          ),
          onChanged: _performSearch,
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Pops the current route off the navigator
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.clear),
            onPressed: () {
              _searchController.clear();
              _performSearch(''); // Clear search results
            },
          )
        ],
      ),
      body: _searchResults.isEmpty
          ? const Center(child: Text('No results found.'))
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // Number of columns in the grid
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 4.0,
              ),
              itemCount: _searchResults.length,
              itemBuilder: (context, index) {
                return Image.network(
                  _searchResults[index],
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Center(child: Icon(Icons.error)); // Handle image loading errors
                  },
                );
              },
            ),
    );
  }
}
