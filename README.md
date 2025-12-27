📽️ Flutter Movies App — Dự án cá nhân

Ứng dụng xem thông tin phim sử dụng TMDB API (The Movie Database), xây dựng theo Clean Architecture và BLoC state management.

Tác giả: Nguyễn Đức Thành
GitHub: https://github.com/lutasubin/flutter_movies

🧠 Mục tiêu dự án

Ứng dụng này được thiết kế để:

✔ Thực hành kiến trúc phần mềm chuẩn
✔ Tách biệt rõ ràng giữa UI / domain / data
✔ Quản lý state hiệu quả với BLoC
✔ Học cách tích hợp API phim (TMDB)
✔ Dễ mở rộng tính năng trong tương lai

📁 Cấu trúc dự án
/
├── android/
├── ios/
├── lib/
│   ├── Movies_App/
│   │   ├── core/
│   │   │   ├── apis/
│   │   │   ├── common/
│   │   │   ├── enums/
│   │   │   ├── services/
│   │   │   ├── theme/
│   │   │   └── utils/
│   │   ├── features/
│   │   │   ├── auth/
│   │   │   │   └── login/
│   │   │   ├── home/
│   │   │   └── profile/
│   │   └── root_page.dart
│   ├── firebase_options.dart
│   ├── main.dart
├── l10n/
├── gen/
├── pubspec.yaml
└── README.md

🛠️ Công nghệ & Packages chính
Loại	Công nghệ / Package
Framework	Flutter, Dart
State Management	flutter_bloc
Networking	Dio
Env Config	flutter_dotenv
Localization	Flutter Localization (l10n)
Dependency Injection	get_it (nếu dùng)
Navigation	go_router (tùy code)
Theming / UI	Material 3, custom Theme
Firebase	Firebase Core, Auth, Firestore (tùy sử dụng)
🧩 Kiến trúc
🚀 Clean Architecture

Dự án tách thành 3 tầng rõ rệt:

Presentation  → UI + BLoC
Domain        → Entities + UseCases
Data          → Repositories + DataSources

🧠 layers giải thích
🧪 Data

Chịu trách nhiệm lấy dữ liệu từ TMDB API hoặc Firebase

Chứa: models, repository implementation, datasource

Mapping JSON → Models

📚 Domain

Định nghĩa business logic thuần

Có: entities, usecases, abstract repositories

Không phụ thuộc Flutter

🎨 Presentation

UI widgets + pages

BLoC cho state management

BLoC events → states

📌 Feature theo module
🧑‍💻 Auth – Login

Xử lý đăng nhập user

Có thể dùng Firebase Auth

BLoC quản lý trạng thái đăng nhập

Login Flow:

UI → LoginEvent → AuthBloc → AuthState → UI

🏡 Home

Hiển thị danh sách phim

Có phân loại phim: Popular, Top Rated, Now Playing

Load từ TMDB API

👤 Profile

Hiển thị thông tin người dùng

Chức năng logout

🌀 Root Navigator

Tập trung điều hướng giữa các feature chính:

Splash / Onboarding (nếu có)

Login

Main (Home + Profile)

📌 Localization (Đa ngôn ngữ)

Dự án hỗ trợ đa ngôn ngữ trong l10n/:

app_en.arb — English

app_vi.arb — Vietnamese

Bạn có thể mở rộng thêm các locale khác.

📥 Cách cài đặt & chạy dự án
1️⃣ Clone repo
git clone https://github.com/lutasubin/flutter_movies.git
cd flutter_movies

2️⃣ Tạo file .env

Tại thư mục gốc, tạo file .env và thêm:

TMDB_API_KEY=YOUR_API_KEY
TMDB_BASE_URL=https://api.themoviedb.org/3


Lấy API key miễn phí tại: https://www.themoviedb.org/
 
GitHub

3️⃣ Cài packages
flutter pub get

4️⃣ Khởi chạy
flutter run


Hoặc chọn thiết bị mục tiêu: Android / iOS / Web

📊 API Endpoints (TMDB)

Dự án sử dụng API TMDB chính:

Endpoint	Mục đích
/movie/popular	Lấy phim phổ biến
/movie/top_rated	Lấy phim được đánh giá cao
/movie/now_playing	Phim đang chiếu
/search/movie	Tìm kiếm phim

(Tuỳ vào code có thể có thêm endpoint khác)

🧠 Bloc Pattern

Tất cả state management trong UI đều qua BLoC:

Event → Bloc → Emit State → UI rebuild


Ưu điểm:

✔ Tách UI khỏi business logic
✔ Dễ test
✔ Dễ mở rộng

🏆 Feature nâng cao có thể thêm

Đây là gợi ý để bạn phát triển project:

✔ Tìm kiếm phim
✔ Favorites / Watchlist
✔ Trailers bằng YouTube API
✔ Offline cache (Hive / Isar)
✔ Dark mode
✔ Firebase Firestore lưu user data

❗ Lưu ý & Best Practices
🔐 Không commit API Key

Đảm bảo .env không bị commit lên GitHub.

🧪 Testing

Bạn có thể thêm:

Unit test cho Usecases

BLoC test cho states

Widget test cho UI

🤝 Góp ý & đóng góp

hãy góp ý qua ducthanh22112004@gmail.com

📝 License

Dự án theo MIT License — bạn có thể sử dụng hoặc mở rộng cho mục đích học tập & công việc.
