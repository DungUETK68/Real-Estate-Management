# 🏢 Hệ thống Quản lý Bất động sản (Real Estate Management System)

Một ứng dụng Web toàn diện hỗ trợ quản lý, vận hành và quảng bá hệ thống cho thuê bất động sản, văn phòng và tòa nhà. Dự án được thiết kế theo kiến trúc đa tầng (Multi-Tier Architecture), kết hợp chặt chẽ giữa các tiêu chuẩn bảo mật của Spring, tối ưu hóa truy vấn cơ sở dữ liệu và quản lý giao diện người dùng linh hoạt.

## 🚀 Công nghệ và Thư viện cốt lõi (Tech Stack)

### **Backend**
* **Ngôn ngữ:** Java 8
* **Framework:** Spring Boot (2.0.9.RELEASE)
* **Build Tool:** Gradle (Groovy DSL)
* **Web & Data:** Spring Web MVC, Spring Data JPA / Hibernate (Quản lý các mối quan hệ phức tạp Many-To-Many, One-To-Many, cấu hình Cascade).
* **Bảo mật:** Spring Security & Spring Security Taglibs 4.2 (Xác thực người dùng, Phân quyền Role-based).
* **Tiện ích:** 
  * `ModelMapper` (0.7.4): Ánh xạ và chuyển đổi dữ liệu tự động giữa DTO (Data Transfer Object) và Entity.
  * `Commons Lang` (2.6): Hỗ trợ xử lý chuỗi và object linh hoạt.
  * `Log4j` (1.2.17): Ghi log hệ thống và theo dõi lỗi.

### **Frontend**
* **Template Engine:** JSP (JavaServer Pages), JSTL (JavaServer Pages Standard Tag Library).
* **Layout Manager:** SiteMesh (2.4.2) - Phân mảnh và quản lý giao diện (Decorator pattern) để giữ cấu trúc trang nhất quán.
* **Tương tác dữ liệu:** jQuery AJAX kết hợp RESTful APIs giúp các thao tác CRUD diễn ra mượt mà, không yêu cầu reload trang.
* **UI Components:** DisplayTag (1.2) - Hỗ trợ xây dựng và phân trang các bảng dữ liệu phức tạp.

### **Database & Deployment**
* **Cơ sở dữ liệu:** MySQL 8.x (sử dụng `mysql-connector-java` 8.0.13).
* **Môi trường chạy (Runtime):** Apache Tomcat Embedded (đóng gói dạng `.war`).
* **Containerization:** Hỗ trợ triển khai nhanh qua Docker và Docker Compose (Build bằng Gradle).

---

## ✨ Các chức năng nổi bật (Key Features)

### 1. Quản lý Tòa nhà & Bất động sản (Building Management)
* **Tìm kiếm & Lọc dữ liệu nâng cao:** Động cơ tìm kiếm phức tạp cho phép tra cứu tòa nhà theo đa tiêu chí: Tên, địa chỉ (Quận, Phường), diện tích trống, khoảng giá, quản lý viên, hoặc loại hình tòa nhà. Xử lý trực tiếp thông qua JPA Custom Query (Native SQL/Criteria API) để tối ưu hiệu năng.
* **Phân trang dữ liệu (Pagination):** Xử lý phân trang tối ưu trực tiếp dưới Database (Limit/Offset) kết hợp Spring `Pageable`, đảm bảo tốc độ phản hồi nhanh khi dữ liệu phình to.
* **Thao tác CRUD bất đồng bộ:**
  * **Thêm mới / Cập nhật:** Giao diện tích hợp "2 trong 1", xử lý lưu trữ thông tin Tòa nhà và danh sách các Diện tích thuê liên quan (`RentArea`) một cách an toàn thông qua annotation `@Transactional`.
  * **Xóa:** Hỗ trợ xóa đơn lẻ hoặc xóa hàng loạt nhiều tòa nhà cùng lúc qua Checkbox, tự động dọn dẹp các dữ liệu mồ hôi (orphan data) liên quan.
* **Phân công Tòa nhà (Assignment):** Quản trị viên (Admin) có thể phân công quản lý Tòa nhà cho các Nhân viên (Staff). Xử lý mượt mà mối quan hệ Nhiều-Nhiều (Many-To-Many) dưới cơ sở dữ liệu.

### 2. Cổng thông tin khách hàng (Customer Portal)
* **Trang chủ & Danh sách sản phẩm:** Hiển thị danh sách các tòa nhà đang cho thuê với thiết kế thẻ (Card) trực quan. Dữ liệu được tải động từ Database.
* **Chi tiết tòa nhà:** Khách hàng có thể xem thông tin chi tiết về diện tích, giá thuê, thông tin liên hệ của quản lý viên trực tiếp trên nền tảng.
* **Liên hệ nhận tư vấn:** Khách hàng có thể gửi yêu cầu tư vấn (Tên, Số điện thoại, Email, Nội dung). Hệ thống sẽ ghi nhận trạng thái "Chưa xử lý" để đội ngũ Staff tiếp nhận.

### 3. Quản lý Bảo mật & Phân quyền (Security)
* **Xác thực:** Đăng nhập/Đăng xuất bảo mật được quản lý bởi Spring Security.
* **Phân quyền người dùng (Authorization):** Giới hạn quyền truy cập dựa trên Role:
  * `ADMIN`: Toàn quyền quản lý người dùng, tòa nhà, phân công công việc.
  * `STAFF`: Quản lý các khách hàng liên hệ và quản lý các tòa nhà được phân công.
  * `USER`: Người dùng tiêu chuẩn.

---

## 📂 Cấu trúc mã nguồn (Source Code Structure)

Dự án được tổ chức linh hoạt, hỗ trợ tốt cho cả kiến trúc Server-side rendering (JSP) truyền thống lẫn các endpoint RESTful hiện đại:

```text
src/
└── main/
    ├── java/com/javaweb/
    │   ├── api/             # REST Controllers: Tiếp nhận JSON, xử lý thao tác AJAX
    │   ├── config/          # Cấu hình Spring (Beans, WebSecurity, ModelMapper...)
    │   ├── constant/        # Khai báo các hằng số (Constants) hệ thống
    │   ├── controller/      # Spring MVC Controllers: Điều hướng và trả về View (JSP)
    │   ├── converter/       # Logic chuyển đổi dữ liệu (Mapping giữa DTO và Entity)
    │   ├── entity/          # Các lớp ánh xạ trực tiếp với bảng Database (JPA Entities)
    │   ├── enums/           # Khai báo các kiểu liệt kê (Enum) định sẵn (Quận, Trạng thái...)
    │   ├── exception/       # Xử lý ngoại lệ tập trung (Global Exception Handling)
    │   ├── model/           # Các Data Transfer Object (Request, Response, AbstractDTO)
    │   ├── repository/      # Tầng giao tiếp Database (JPA Interfaces & JDBC Custom Impl)
    │   ├── security/        # Xử lý xác thực, phân quyền (CustomSuccessHandler, utils)
    │   ├── service/         # Tầng logic nghiệp vụ cốt lõi (Gắn @Transactional)
    │   ├── utils/           # Các hàm tiện ích dùng chung (StringUtils, NumberUtils...)
    │   └── SpringBootWebApplication.java # Class Main khởi chạy Spring Boot
    │
    ├── resources/
    │   ├── application.properties # Cấu hình kết nối DB, Hibernate, Spring MVC, cổng chạy...
    │   └── static/          # Chứa tài nguyên tĩnh (CSS, JS, Images, Plugins)
    │
    └── webapp/              # Thư mục gốc chứa tài nguyên Web (phục vụ đóng gói WAR)
        ├── common/          # Giao diện dùng chung (Header, Footer, Menu, Taglibs)
        ├── decorators/      # Khung layout chính của SiteMesh (admin.jsp, web.jsp)
        ├── WEB-INF/
        │   ├── views/       # Chứa các file giao diện JSP chia theo chức năng (admin/, web/)
        │   ├── decorators.xml # File cấu hình quy tắc áp dụng Layout của SiteMesh
        │   └── web.xml      # File cấu hình Servlet tiêu chuẩn
        └── index.jsp        # Trang điều hướng mặc định
```

---

## ⚙️ Hướng dẫn cài đặt và khởi chạy (Getting Started)

### Yêu cầu hệ thống:
* **Java:** JDK 1.8
* **Build Tool:** Gradle 6.x
* **Database:** MySQL 8.x
* **Docker** (Khuyến nghị)

### Bước 1: Thiết lập Cơ sở dữ liệu
Tạo một cơ sở dữ liệu mới trong MySQL với tên `estateadvance`:
```sql
CREATE DATABASE estateadvance CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
```

### Bước 2: Cấu hình ứng dụng
Mở file `src/main/resources/application.properties` và đảm bảo thông tin đăng nhập database chính xác:
```properties
spring.datasource.url = jdbc:mysql://localhost:3306/estateadvance
spring.datasource.username = root
spring.datasource.password = 123456
```

### Bước 3: Build và Chạy dự án (Cách truyền thống)
Sử dụng Gradle để build dự án:
```bash
./gradlew clean build -x test
```
Chạy ứng dụng:
```bash
./gradlew bootRun
```
Ứng dụng sẽ khả dụng tại: `http://localhost:8080/`

### Bước 4: Chạy dự án bằng Docker (Cách nhanh nhất)
Nếu hệ thống của bạn đã cài đặt Docker và Docker Compose, bạn có thể khởi chạy toàn bộ ứng dụng và database chỉ với 1 lệnh:
```bash
docker-compose up --build -d
```
Docker sẽ tự động dùng Gradle để đóng gói ứng dụng bên trong container và thiết lập MySQL.
