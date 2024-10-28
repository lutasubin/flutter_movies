# Firebase Firestore là gì?
Firestore là một cơ sở dữ liệu NoSQL linh hoạt từ Firebase, được thiết kế để lưu trữ và đồng bộ hóa dữ liệu cho các ứng dụng di động và web. 
<br><br>
Khi sử dụng Firestore trong Flutter, bạn có thể lưu trữ dữ liệu theo kiểu tài liệu, truy vấn dữ liệu theo thời gian thực

# Thiết lập Firestore trong Flutter

##  Thêm Firebase vào dự án Flutter
- `Bước 1 - Cài đặt Firebase`: Tích hợp Firebase vào dự án Flutter (Đã tích hợp ở buổi học trước)
- `Bước 2 - Cài đặt Firebase Core`: Thêm Firebase core và Firestore vào pubspec.yaml
    ````yaml
    dependencies:
      firebase_core: ^2.12.0
      cloud_firestore: ^4.4.0
    ````
- `Bước 3 - Khởi tạo Firebase`: Trong hàm main() của ứng dụng, khởi tạo Firebase trước khi chạy ứng dụng.
    ````dart
    import 'package:firebase_core/firebase_core.dart';
    import 'package:flutter/material.dart';

    void main() async {
        WidgetsFlutterBinding.ensureInitialized();
        await Firebase.initializeApp();
        runApp(MyApp());
    }
    ````

## Cấu hình Firestore
Sau khi tích hợp Firebase vào dự án Flutter, bạn vào Firebase Console và kích hoạt dịch vụ Firebase Firestore 
- (Chọn `Create Database`)
- Tại mục `Set name and location` -> Nhấn `Next`
- Tại mục `Secure rules` -> Nhấn `Create`

Sau khi `Cloud Firestore` đã được tạo, bạn vào tab `Rules` và override nội dung trong tab bằng đoạn test sau:
````
service cloud.firestore {
  match /databases/{database}/documents {
    match /users/{userId} {
      allow read, write: if request.auth.uid == userId;
    }
  }
}
````


# Các thao tác cơ bản với Firestore
## Tạo một tài liệu (Create)
Firestore lưu trữ dữ liệu dưới dạng bộ sưu tập (collection) và tài liệu (document). Bạn có thể lưu trữ các tài liệu dưới các bộ sưu tập nhất định.
````dart
import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore firestore = FirebaseFirestore.instance;

Future<void> addUser(String userId, String name, String email) async {
  await firestore.collection('users').doc(userId).set({
    'name': name,
    'email': email,
  });
}
````

## Đọc dữ liệu (Read)
Firestore cung cấp hai cách để đọc dữ liệu: đọc một lần và theo dõi thời gian thực.

- Đọc một lần (One-time read):
  ````dart
  Future<void> getUser(String userId) async {
    DocumentSnapshot docSnapshot = await firestore.collection('users').doc(userId).get();
    if (docSnapshot.exists) {
        print("User Data: ${docSnapshot.data()}");
    } else {
        print("No such user");
    }
  }
  ````

- Theo dõi thời gian thực (Real-time listener):
  ````dart
  void listenToUser(String userId) {
    firestore.collection('users').doc(userId).snapshots().listen((snapshot) {
        print("User Data: ${snapshot.data()}");
    });
  }
  ````

## Cập nhật dữ liệu (Update)
Firestore cho phép bạn cập nhật một phần hoặc toàn bộ tài liệu:
  ````dart
  Future<void> updateUser(String userId, String name) async {
    await firestore.collection('users').doc(userId).update({
        'name': name,
    });
  }
  ````

## Xoá tài liệu (Delete)
Để xóa một tài liệu, bạn có thể sử dụng phương thức `delete()`:
  ````dart
  Future<void> deleteUser(String userId) async {
    await firestore.collection('users').doc(userId).delete();
  }
  ````