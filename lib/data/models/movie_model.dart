import 'package:flutter_firebase/domain/entities/movie.dart';

class MovieModel extends Movie {
  MovieModel({
    required super.id,
    required super.title,
    required super.overview,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'],
      title: json['title'],
      overview: json['overview'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'overview': overview,
    };
  }
}

//!MovieModel là một lớp dữ liệu (model) mở rộng từ lớp thực thể Movie trong tầng domain.
//!Lớp này giúp chuyển đổi giữa dữ liệu dạng JSON và đối tượng trong ứng dụng.
//!fromJson(): Tạo đối tượng MovieModel từ dữ liệu JSON (thường là từ API).
//!toJson(): Chuyển đổi đối tượng MovieModel thành JSON (thường để gửi dữ liệu đến API hoặc lưu trữ).
