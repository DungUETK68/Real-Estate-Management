# Hệ thống Quản lý Bất động sản (Real Estate Management System)

Dự án Web Application hỗ trợ quản lý và vận hành hệ thống cho thuê bất động sản, văn phòng, tòa nhà. Ứng dụng được thiết kế theo kiến trúc đa tầng kết hợp với các tiêu chuẩn bảo mật, tối ưu hóa truy vấn cơ sở dữ liệu và quản lý giao diện hiện đại.

## 🚀 Công nghệ và Thư viện sử dụng

**Backend:**
* **Ngôn ngữ:** Java 8
* **Framework:** Spring Boot (2.0.9.RELEASE)
* **Web & Data:** Spring Web MVC, Spring Data JPA / Hibernate (Quản lý các mối quan hệ phức tạp Many-To-Many, One-To-Many, Cascade).
* **Bảo mật:** Spring Security & Spring Security Taglibs (Quản lý User/Role, Phân quyền).
* **Tiện ích:** * ModelMapper (0.7.4): Chuyển đổi dữ liệu giữa DTO và Entity tự động.
  * Commons Lang (2.6): Hỗ trợ xử lý chuỗi và object.
  * Log4j (1.2.17): Ghi log hệ thống.

**Frontend:**
* **Template Engine:** JSP (JavaServer Pages), JSTL.
* **Layout Manager:** SiteMesh (2.4.2) để phân mảnh và quản lý giao diện (Decorator).
* **Xử lý bất đồng bộ:** jQuery AJAX kết hợp RESTful API giúp tương tác dữ liệu mượt mà không cần reload trang.
* **UI Components:** DisplayTag (1.2) để hỗ trợ hiển thị bảng dữ liệu.

**Database:**
* MySQL 8.x (MySQL Connector 8.0.13).

## ✨ Chức năng hệ thống

### 1. Quản lý Tòa nhà (Building Management)
* **Tìm kiếm & Lọc nâng cao:** Tra cứu tòa nhà theo đa tiêu chí (Tên, quận, phường, diện tích trống, khoảng giá, quản lý, loại tòa nhà...).
* **Phân trang dữ liệu (Pagination):** Xử lý phân trang tối ưu trực tiếp dưới Database (Limit/Offset) kết hợp Spring `Pageable`, đảm bảo hiệu năng khi lượng dữ liệu lớn.
* **Thao tác CRUD bất đồng bộ:**
  * **Thêm mới / Cập nhật:** Giao diện tích hợp "2 trong 1", xử lý lưu trữ Tòa nhà và danh sách Diện tích thuê liên quan (`RentArea`) an toàn với `@Transactional`.
  * **Xóa:** Hỗ trợ xóa đơn lẻ hoặc xóa hàng loạt nhiều tòa nhà cùng lúc, tự động dọn dẹp các dữ liệu rác liên quan.
* **Giao tòa nhà (Assignment):** Chức năng phân công Tòa nhà cho các Nhân viên quản lý, xử lý mượt mà mối quan hệ Many-To-Many dưới cơ sở dữ liệu bằng Hibernate.

### 2. Quản lý Bảo mật & Phân quyền (Security)
* **Đăng nhập/đăng xuất:** Hệ thống xác thực bằng Spring Security.
* **Phân quyền người dùng:** Phân quyền hệ thống dựa trên Role (Admin / Staff / User).

## 📂 Cấu trúc mã nguồn (Source Code Structure)

Dự án được tổ chức linh hoạt để hỗ trợ cả Server-side rendering (JSP) và RESTful APIs:

```text
src/
└── main/
    ├── java/com/javaweb/
    │   ├── api/             # RESTful APIs (Tiếp nhận JSON, xử lý thao tác AJAX)
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
    │   ├── service/         # Tầng logic nghiệp vụ cốt lõi (Gắn @Transactional quản lý dữ liệu)
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

