Flutter Movies App

Flutter Movies App là ứng dụng xem thông tin phim được phát triển bằng Flutter, sử dụng API The Movie Database (TMDB) để hiển thị danh sách phim, chi tiết phim và các thông tin liên quan.

Dự án được xây dựng nhằm mục đích học tập – thực hành Flutter, rèn luyện kỹ năng:

Xây dựng UI/UX

Làm việc với REST API

Quản lý state

Tổ chức cấu trúc project Flutter

📌 Thông tin dự án

Tên dự án: Flutter Movies App

Nền tảng: Flutter (Android / iOS / Web)

Loại dự án: Cá nhân

Tác giả: Nguyễn Đức Thành

GitHub: https://github.com/lutasubin/flutter_movies

🧠 Mô tả chi tiết

Ứng dụng cho phép người dùng:

Xem danh sách phim đang thịnh hành

Xem phim được đánh giá cao

Xem thông tin chi tiết của từng bộ phim

Hiển thị poster, mô tả, ngày phát hành, điểm đánh giá

Trải nghiệm giao diện hiện đại, dễ sử dụng

Ứng dụng hướng tới tính đơn giản – dễ mở rộng – dễ bảo trì, phù hợp để phát triển thêm các tính năng nâng cao trong tương lai.

✨ Tính năng chính
🎞️ Danh sách phim

Hiển thị phim phổ biến (Popular Movies)

Hiển thị phim được đánh giá cao (Top Rated)

Load dữ liệu từ TMDB API

📄 Chi tiết phim

Poster phim chất lượng cao

Tên phim

Mô tả nội dung

Ngày phát hành

Điểm đánh giá (rating)

📱 Giao diện

Responsive UI

Tối ưu hiển thị cho nhiều kích thước màn hình

Thiết kế theo Material Design

🧩 Công nghệ sử dụng
Công nghệ	Mô tả
Flutter	Framework phát triển ứng dụng đa nền tảng
Dart	Ngôn ngữ lập trình
REST API	Lấy dữ liệu phim
TMDB API	Nguồn dữ liệu phim
HTTP / Dio	Gọi API
Cached Network Image	Cache ảnh poster
State Management	setState / Provider / BLoC (tuỳ phiên bản)
🗂️ Cấu trúc thư mục
lib/
├── models/        # Model dữ liệu (Movie, Response...)
├── services/      # Gọi API, xử lý dữ liệu
├── screens/       # Các màn hình chính
│   ├── home/
│   ├── detail/
├── widgets/       # Widget tái sử dụng
├── constants/     # Hằng số, API URL
└── main.dart      # Entry point của app


Cấu trúc được tổ chức rõ ràng, dễ đọc, dễ bảo trì và mở rộng.

🔑 API Configuration

Ứng dụng sử dụng The Movie Database API.

Bước 1: Đăng ký API Key

Truy cập: https://www.themoviedb.org/

Đăng ký tài khoản và tạo API Key

Bước 2: Thêm API Key vào project

Tạo file .env tại thư mục gốc:

TMDB_API_KEY=YOUR_API_KEY
BASE_URL=https://api.themoviedb.org/3


⚠️ Không commit API Key lên GitHub

🚀 Cách chạy dự án
1️⃣ Clone project
git clone https://github.com/lutasubin/flutter_movies.git
cd flutter_movies

2️⃣ Cài đặt package
flutter pub get

3️⃣ Chạy ứng dụng
flutter run

🎯 Định hướng phát triển

Trong tương lai, dự án có thể mở rộng thêm:

🔍 Tìm kiếm phim

❤️ Danh sách phim yêu thích

🌙 Dark Mode

▶️ Xem trailer phim (YouTube)

💾 Lưu dữ liệu offline

🔐 Đăng nhập người dùng (Firebase)

🧪 Mục tiêu học tập

Dự án giúp rèn luyện:

✔ Flutter UI
✔ Làm việc với API
✔ Xử lý JSON
✔ Tổ chức project thực tế
✔ Tư duy phát triển ứng dụng mobile

🤝 Đóng góp

Mọi đóng góp đều được hoan nghênh:

Fork repository

Tạo branch mới

Commit code

Tạo Pull Request

📄 License

Dự án được phát hành theo MIT License
Bạn có thể tự do sử dụng cho mục đích học tập và phát triển.

👨‍💻 Tác giả

Nguyễn Đức Thành
🎓 Flutter Developer
📧 GitHub: https://github.com/lutasubin
