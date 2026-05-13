# Build stage: Gradle + Java 8
FROM gradle:6.9.4-jdk8 AS build
WORKDIR /app

# Copy các file cấu hình Gradle trước để tận dụng cache
COPY build.gradle settings.gradle ./
COPY src ./src

# Build dự án (bỏ qua chạy tests để nhanh hơn)
RUN gradle build -x test --no-daemon

# Runtime stage: Tomcat 8.5 (deploy WAR as ROOT)
FROM tomcat:8.5-jre8
WORKDIR /usr/local/tomcat/webapps

# Xóa các ứng dụng mặc định của Tomcat nếu muốn sạch sẽ
RUN rm -rf ROOT

# Copy file war từ giai đoạn build vào thư mục webapps của Tomcat
# Gradle mặc định để file ở build/libs/
COPY --from=build /app/build/libs/spring-boot.war ROOT.war

EXPOSE 8080
# Lệnh chạy mặc định của image Tomcat sẽ tự khởi động container
