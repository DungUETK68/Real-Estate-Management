<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sản phẩm</title>
</head>

<body>
<div class="page-wrapper">
    <div class="intro text-center">
        <div class="title-page">Tất cả dự án</div>
        <div class="row">
            <div class="col-xs-12 a-left">
                <ul class="desc-intro">
                    <li class="home">
                        <a href="./ViewHome.html"><span style="color:#fff">Trang chủ</span></a>
                        <span class="mx-1" style="color:#fff"> / </span>
                    </li>
                    <li class="intro-item"><span>Tất cả sản phẩm</span></li>
                </ul>
            </div>
        </div>
    </div>
    <!-- SEARCH  -->
    <div class="search">
        <div class="container">
            <form action="<c:url value='/san-pham'/>" method="GET" id="form-search">
            <div class="row">
                <div class="col-12 col-md-3 search-item">
                    <p class="search-text">Tên tòa nhà</p>
                    <input type="text" class="search-option" name="name" value="${modelSearch.name}" placeholder="Nhập tên tòa nhà...">
                </div>
                <div class="col-12 col-md-3 search-item">
                    <p class="search-text">Chọn quận/huyện</p>
                    <select class="search-option" name="district" id="district">
                        <option value="">--Chọn quận--</option>
                        <c:forEach var="item" items="${listDistricts}">
                            <option value="${item.key}" ${modelSearch.district == item.key ? 'selected' : ''}>${item.value}</option>
                        </c:forEach>
                    </select>
                </div>

                <div class="col-12 col-md-3 search-item">
                    <p class="search-text">Chọn loại bất động sản</p>
                    <select class="search-option" name="typeCode" id="typeCode">
                        <option value="">- Loại bất động sản</option>
                        <c:forEach var="item" items="${listTypes}">
                            <option value="${item.key}" ${modelSearch.typeCode != null && modelSearch.typeCode.contains(item.key) ? 'selected' : ''}>${item.value}</option>
                        </c:forEach>
                    </select>
                </div>
                <div class="col-12 col-md-3 search-btn">
                    <button type="submit" class="search-btn-text pb-0">
                        <i class="fa-solid fa-magnifying-glass search-btn-icon"></i>
                        <span>Tìm kiếm nhanh</span>
                    </button>
                </div>
            </div>
            </form>
        </div>
    </div>

    <!-- CONTENT  -->
    <div class="product mt-5">
        <div class="container">
            <div class="row">
                <c:forEach var="item" items="${buildings}">
                <div class="col-12 col-md-4">
                    <div class="product1 vip">
                        <div class="product1-image new"></div>

                        <div class="product1-conntent">
                            <div class="product1-conntent-header">
                                <a href="/chi-tiet-san-pham?id=${item.id}">${item.name}</a>
                            </div>
                            <span class="product1-conntent-title"><c:choose><c:when test="${empty item.managerName}">Chưa có quản lý</c:when><c:otherwise>Tên quản lý: ${item.managerName} - ${item.managerPhone}</c:otherwise></c:choose></span>
                            <ul class="product1-conntent-list">
                                <li class="product1-conntent-item">
                                    <i class="fa-solid fa-location-dot"></i>
                                    <span>Địa chỉ: ${item.address}</span>
                                </li>
                                <li class="product1-conntent-item">
                                    <i class="fa-solid fa-building"></i>
                                    <span><c:choose><c:when test="${empty item.managerName}">Chưa có quản lý</c:when><c:otherwise>Tên quản lý: ${item.managerName}</c:otherwise></c:choose></span>
                                </li>
                                <li class="product1-conntent-item">
                                    <i class="fa-solid fa-earth-asia"></i>
                                    <span>Diện tích: ${item.emptyArea} m^2</span>
                                </li>
                            </ul>
                        </div>
                        <div class="product1-footer">
                            <span class="product1-footer-cost">Giá thuê: <c:choose><c:when test="${empty item.rentPrice}">Liên hệ</c:when><c:otherwise>${item.rentPrice} triệu/tháng</c:otherwise></c:choose></span>
                            <button class="product1-footer-detail"><a href="/chi-tiet-san-pham?id=${item.id}" style="color:#fff">Xem chi tiết</a></button>
                        </div>
                    </div>
                </div>
                </c:forEach>
            </div>
        </div>

        <!-- TIEN TRINH  -->
        <div class="container text-center">
            <div class="shop-pag text-xs-right mt-5">
                <nav class="text-center">
                    <ul class="pagination clearfix justify-content-center">
                        <li class="page-item disabled"><a class="page-link" href="#">«</a></li>
                        <li class="active page-item disabled"><a class="page-link" href="javascript:;">1</a></li>
                        <li class="page-item"><a class="page-link" onclick="doSearch(2)" href="javascript:;">2</a>
                        </li>
                        <li class="page-item"><a class="page-link" onclick="doSearch(2)" href="javascript:;">»</a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>


    </div>
</div>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
</body>

</html>