# Hệ thống Quản lý Bất động sản (Real Estate Management System)

Dự án Web Application hỗ trợ quản lý và vận hành hệ thống cho thuê bất động sản, văn phòng, tòa nhà. Ứng dụng được thiết kế theo kiến trúc đa tầng kết hợp với các tiêu chuẩn bảo mật và quản lý giao diện hiện đại.

## 🚀 Công nghệ và Thư viện sử dụng

**Backend:**
* **Ngôn ngữ:** Java 8
* **Framework:** Spring Boot (2.0.9.RELEASE)
* **Web & Data:** Spring Web MVC, Spring Data JPA
* **Bảo mật:** Spring Security & Spring Security Taglibs (Quản lý User/Role, Phân quyền)
* **Tiện ích:** * ModelMapper (0.7.4): Chuyển đổi dữ liệu giữa DTO và Entity tự động.
    * Commons Lang (2.6): Hỗ trợ xử lý chuỗi và object.
    * Log4j (1.2.17): Ghi log hệ thống.

**Frontend:**
* **Template Engine:** JSP (JavaServer Pages), JSTL
* **Layout Manager:** SiteMesh (2.4.2) để phân mảnh và quản lý giao diện (Decorator).
* **UI Components:** DisplayTag (1.2) để hỗ trợ phân trang và hiển thị bảng dữ liệu (Data Table) nhanh chóng.

**Database:**
* MySQL 8.x (MySQL Connector 8.0.13)

## ✨ Chức năng hệ thống (Cập nhật liên tục)

### 1. Quản lý Tòa nhà (Building Management)
* **Tìm kiếm nâng cao:** Lọc tòa nhà theo nhiều tiêu chí (Tên, quận, phường, diện tích trống, khoảng giá, quản lý, loại tòa nhà...).
* **Thêm mới:** Thêm thông tin tòa nhà và danh sách diện tích cho thuê.
* **Cập nhật:** Chỉnh sửa dữ liệu chi tiết của tòa nhà.
* **Xóa:** Xóa dữ liệu tòa nhà khỏi hệ thống.

### 2. Quản lý Bảo mật & Phân quyền (Security)
* **Đăng nhập/đăng xuất:** Hệ thống đăng nhập/đăng xuất với Spring Security.
* **Phân quyền người dùng:** Phân quyền dựa trên Role (Admin / Staff / User).

## 📂 Cấu trúc mã nguồn (Source Code Structure)


Dự án được tổ chức linh hoạt để hỗ trợ cả Server-side rendering (JSP) và RESTful APIs:

```text
src/
└── main/
    ├── java/com/javaweb/
    │   ├── api/             # RESTful APIs (Trả về JSON cho thao tác AJAX/Mobile)
    │   ├── config/          # Cấu hình Spring (Beans, Security, Interceptors...)
    │   ├── constant/        # Các hằng số (Constants) dùng chung trong dự án
    │   ├── controller/      # Spring MVC Controllers (Điều hướng và trả về file View JSP)
    │   ├── converter/       # Chuyển đổi dữ liệu (Mapping giữa DTO và Entity)
    │   ├── entity/          # Các lớp ánh xạ trực tiếp với bảng trong Database (JPA)
    │   ├── enums/           # Khai báo các kiểu liệt kê (Enum) cho dữ liệu cố định
    │   ├── exception/       # Xử lý ngoại lệ tập trung (Global Exception Handling)
    │   ├── model/           # Các DTO (Request, Response, AbstractDTO)
    │   ├── repository/      # Tầng giao tiếp Database (JPA Interfaces & JDBC Custom)
    │   ├── security/        # Xử lý xác thực, phân quyền (Filters, UserDetailsService...)
    │   ├── service/         # Tầng chứa logic nghiệp vụ cốt lõi (Business Logic)
    │   ├── utils/           # Các hàm tiện ích dùng chung (Helper/Utilities)
    │   └── SpringBootWebApplication.java # Class khởi chạy dự án
    │
    ├── resources/           # Chứa file application.properties và cấu hình tĩnh
    │
    └── webapp/              # Thư mục gốc chứa tài nguyên Web (Đóng gói dạng WAR)
        ├── common/          # Chứa các mảnh giao diện dùng chung (Header, Footer, Menu...)
        ├── decorators/      # Chứa giao diện khung (Layout chính của SiteMesh)
        ├── WEB-INF/
        │   ├── views/       # Chứa các file giao diện JSP của từng chức năng cụ thể
        │   ├── decorators.xml # File cấu hình quy tắc áp dụng Layout của SiteMesh
        │   └── web.xml      # File cấu hình Servlet tiêu chuẩn của Java Web
        └── index.jsp        # Trang điều hướng mặc định
```