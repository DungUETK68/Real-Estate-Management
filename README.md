# 🏢 Hệ thống Quản lý Bất động sản (Real Estate Management System)

Một ứng dụng Web toàn diện hỗ trợ quản lý, vận hành và quảng bá hệ thống cho thuê bất động sản, văn phòng và tòa nhà. Dự án tích hợp Elasticsearch để tối ưu hóa trải nghiệm tìm kiếm của khách hàng.

## 🚀 Công nghệ và Thư viện cốt lõi (Tech Stack)

### **Backend**
* **Ngôn ngữ:** Java 8
* **Framework:** Spring Boot (2.0.9.RELEASE)
* **Build Tool:** Gradle (Groovy DSL)
* **Web & Data:** 
    * Spring Web MVC, Spring Data JPA / Hibernate (MySQL).
    * **Spring Data Elasticsearch 3.0** (Kết nối Elasticsearch 6.8.x).
* **Bảo mật:** Spring Security (Phân quyền MANAGER, STAFF, USER).

### **Frontend**
* **Template Engine:** JSP, JSTL.
* **Layout Manager:** SiteMesh (2.4.2) - Decorator pattern.
* **Tương tác dữ liệu:** jQuery AJAX kết hợp RESTful APIs.

### **Database & Deployment**
* **Cơ sở dữ liệu:** MySQL 8.x.
* **Search Engine:** **Elasticsearch 6.8.23** (Hỗ trợ tìm kiếm mờ, tìm kiếm văn bản tốc độ cao).
* **Containerization:** Triển khai qua Docker và Docker Compose (Gồm 3 service: backend, db, elasticsearch).

---

## ✨ Các chức năng nổi bật (Key Features)

### 1. Tìm kiếm thông minh với Elasticsearch (Mới)
* **Tối ưu tìm kiếm khách hàng:** Trang chủ sử dụng Elasticsearch để tìm kiếm tòa nhà theo tên, giúp phản hồi nhanh và chính xác hơn.
* **Đồng bộ dữ liệu thời gian thực:** Tự động cập nhật dữ liệu lên Elasticsearch mỗi khi thêm, sửa hoặc xóa tòa nhà trong hệ thống Admin.

### 2. Quản lý Tòa nhà & Bất động sản (Admin)
* **Quản lý đa tiêu chí:** Tìm kiếm tòa nhà nâng cao trong trang Admin bằng MySQL.
* **Phân công công việc:** Admin phân công tòa nhà cho nhân viên quản lý (Many-to-Many).

---

## ⚙️ Hướng dẫn cài đặt và khởi chạy (Getting Started)

### Bước 1: Khởi động bằng Docker (Khuyến nghị)
Đảm bảo bạn đã cài đặt Docker và Docker Compose. Chạy lệnh:
```bash
docker-compose up --build -d
```
Hệ thống sẽ khởi chạy MySQL, Elasticsearch và Backend tự động.

### Bước 2: Đồng bộ dữ liệu lên Elasticsearch
Sau khi ứng dụng khởi chạy lần đầu, bạn cần đẩy dữ liệu từ MySQL sang Elasticsearch bằng cách truy cập (quyền Admin):
`http://localhost:8081/admin/building/import-es`

### Bước 3: Truy cập ứng dụng
* **Trang chủ khách hàng:** `http://localhost:8081/trang-chu`
* **Trang quản trị (Admin):** `http://localhost:8081/admin/home`

---

## 📂 Lưu ý về Git
**KHÔNG** push các thư mục sau lên GitHub:
* `/build/`: Thư mục chứa các file đã biên dịch của Gradle.
* `/.gradle/`: Thư mục cache của Gradle.
* `/target/`: Thư mục build cũ của Maven.
* `.idea/`: Cấu hình riêng của IDE.

Các thư mục này đã được liệt kê trong `.gitignore`.
