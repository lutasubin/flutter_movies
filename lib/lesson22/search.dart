
//! tim kiem phim
import 'package:flutter/material.dart';

class MovieSearchDelegate extends SearchDelegate {
  final List<String> movies = [
    'Movie Title 1',
    'Movie Title 2',
    'Movie Title 3',
    // Thêm tên phim khác vào đây
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = ''; // Xóa tìm kiếm
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null); // Đóng hộp thoại tìm kiếm
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = movies
        .where((movie) => movie.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(results[index]),
          onTap: () {
            // Điều hướng đến trang chi tiết của bộ phim
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    MovieDetailScreen(movieTitle: results[index]),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = movies
        .where((movie) => movie.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestions[index]),
          onTap: () {
            query = suggestions[index]; // Chọn một gợi ý
            showResults(context); // Hiển thị kết quả
          },
        );
      },
    );
  }
}

class MovieDetailScreen extends StatelessWidget {
  final String movieTitle;

  const MovieDetailScreen({super.key, required this.movieTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          movieTitle,
          style: const TextStyle(color: Colors.amber),
        ),
        backgroundColor: const Color(0xFF0A0E21),
      ),
      body: Center(
        child: Text(
          'Details for $movieTitle',
          style: const TextStyle(color: Colors.amber, fontSize: 24),
        ),
      ),
    );
  }
}
