import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'login.dart';
import 'search.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<String> imgList = [
    'asset/image/movie11.png',
    'asset/image/movie8.png',
    'asset/image/movie7.png',
  ];

  // Corresponding titles and genres
  final List<String> titles = [
    'Movie Title 1',
    'Movie Title 2',
    'Movie Title 3',
  ];

  final List<String> genres = [
    'Action',
    'Drama',
    'Comedy',
  ];

  final List<Map<String, dynamic>> movies = [
    {
      'image': 'asset/image/movie10..png',
      'title': 'Movie 10',
      'genre': 'Action',
      'rating': 2.3,
    },
    {
      'image': 'asset/image/movie2.jpg',
      'title': 'Movie 2',
      'genre': 'Drama',
      'rating': 7.5,
    },
    {
      'image': 'asset/image/movie1.jpg',
      'title': 'Movie 1',
      'genre': 'Comedy',
      'rating': 5.1,
    },
    {
      'image': 'asset/image/movie9.png',
      'title': 'Movie 9',
      'genre': 'Horror',
      'rating': 7.9,
    },
    {
      'image': 'asset/image/movie3.jpg',
      'title': 'Movie 3',
      'genre': 'Thriller',
      'rating': 6.1,
    },
    {
      'image': 'asset/image/movie5.jpg',
      'title': 'Movie 5',
      'genre': 'Sci-Fi',
      'rating': 7.3,
    },
    {
      'image': 'asset/image/movie12.png',
      'title': 'Movie 12',
      'genre': 'Romance',
      'rating': 8.0,
    },
    {
      'image': 'asset/image/movie6.jpg',
      'title': 'Movie 6',
      'genre': 'Animation',
      'rating': 8.2,
    },
    {
      'image': 'asset/image/movie4.jpg',
      'title': 'Movie 4',
      'genre': 'Documentary',
      'rating': 7.4,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0E21),
      appBar: AppBar(
        leading: const Icon(
          Icons.movie,
          size: 40,
          color: Colors.orange,
        ),
        title: const Text(
          'Phim Đang Chiếu',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF0A0E21),
        actions: [
          const Text(
            'HaNoi',
            style: TextStyle(color: Colors.amber),
          ),
          IconButton(
            icon: const Icon(
              Icons.location_on,
              color: Colors.amber,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(
              Icons.exit_to_app,
              color: Colors.amber,
            ),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Sign out'),
                      content:
                          const Text("Bạn có chắc chắn muốn đăng xuất không?"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context); // Đóng dialog
                          },
                          child: const Text("Hủy"),
                        ),
                        TextButton(
                          onPressed: () async {
                            // Gọi phương thức đăng xuất từ Firebase
                            await FirebaseAuth.instance.signOut(); // Đăng xuất
                            // ignore: use_build_context_synchronously
                            Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()),
                              (Route<dynamic> route) => false,
                            );
                          },
                          child: const Text("Đăng xuất"),
                        ),
                      ],
                    );
                  });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Sắp Chiếu',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            //! tu dong chuyen tap
            CarouselSlider(
              options: CarouselOptions(
                height: 300,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 2),
                enlargeCenterPage: true,
                aspectRatio: 16 / 9,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
              items: List.generate(imgList.length, (index) {
                return movieCard(
                    imgList[index], titles[index], genres[index], null);
              }),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Center(
                child: AnimatedSmoothIndicator(
                  activeIndex: _currentIndex,
                  count: imgList.length,
                  effect: const ExpandingDotsEffect(
                    activeDotColor: Colors.orange,
                    dotColor: Colors.grey,
                    dotHeight: 10,
                    dotWidth: 10,
                    expansionFactor: 4,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Đang Chiếu',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  IconButton(
                    onPressed: () {
                      showSearch(
                          context: context, delegate: MovieSearchDelegate());
                    },
                    icon: const Icon(
                      Icons.search,
                      color: Colors.amber,
                    ),
                  )
                ],
              ),
            ),
            // Create a horizontal ListView of movie cards
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                spacing: 8.0, // Horizontal spacing
                runSpacing: 8.0, // Vertical spacing
                children: movies.map((movie) {
                  return SizedBox(
                    width: (MediaQuery.of(context).size.width / 3) -
                        12, // Set width for each card
                    child: movieCard(movie['image']!, movie['title']!,
                        movie['genre']!, movie['rating']),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget movieCard(
      String imageUrl, String title, String genre, double? rating) {
    // Xác định màu sắc và nội dung dựa trên rating
    Color ratingColor;
    String ratingText;

    if (rating != null) {
      if (rating < 6.5) {
        ratingColor = Colors.grey; // Màu đỏ cho rating dưới 6.5
        ratingText = rating.toStringAsFixed(1);
      } else {
        ratingColor = Colors.orange; // Màu cam cho rating từ 6.5 trở lên
        ratingText = rating.toStringAsFixed(1);
      }
    } else {
      ratingColor = Colors.red; // Màu đỏ khi rating là null
      ratingText = 'Trending'; // Hiển thị 'Trending' khi rating là null
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  imageUrl,
                  width: 300,
                  height: 180,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                title,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
              Text(
                genre,
                style: const TextStyle(color: Colors.white70),
              ),
            ],
          ),
          // Đặt rating ở góc phải
          Positioned(
            top: 10,
            right: 10,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: ratingColor, // Sử dụng màu sắc đã xác định ở trên
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                ratingText,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
