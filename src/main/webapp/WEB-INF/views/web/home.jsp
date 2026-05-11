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
    <title>Trang chủ</title>
</head>

<body>
<div class="page-wrapper">
    <div class="">
        <div class="container-fluid">
            <div class="p-0">
                <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
                    <div class="carousel-indicators">
                        <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0"
                                class="active" aria-current="true" aria-label="Slide 1"></button>
                        <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1"
                                aria-label="Slide 2"></button>
                        <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2"
                                aria-label="Slide 3"></button>
                    </div>
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <div><img src="https://bizweb.dktcdn.net/100/328/362/themes/894751/assets/slider_1.png?1676257083798" alt="">
                            </div>
                            <div class="carousel-caption d-none d-md-block">
                            </div>
                        </div>
                        <div class="carousel-item">
                            <img src="https://richnguyen.vn/wp-content/uploads/2020/08/buc-anh-bat-dong-san-dep-2.jpg" alt="...">
                            <div class="carousel-caption d-none d-md-block">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- SEARCH -->
        <div class="search">
            <div class="container">
                <form action="<c:url value='/san-pham'/>" method="GET" id="form-search">
                <div class="row">
                    <div class="col-12 col-md-3">
                        <div class="search-item">
                            <p class="search-text">Tên tòa nhà</p>
                            <input type="text" class="search-option" name="name" value="${modelSearch.name}" placeholder="Nhập tên tòa nhà...">
                        </div>
                    </div>
                    <div class="col-12 col-md-3">
                        <div class="search-item">
                            <p class="search-text">Chọn quận/huyện</p>
                            <select class="search-option" name="district" id="district">
                                <option value="">--Chọn quận--</option>
                                <c:forEach var="item" items="${listDistricts}">
                                    <option value="${item.key}" ${modelSearch.district == item.key ? 'selected' : ''}>${item.value}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="col-12 col-md-3">
                        <div class="search-item">
                            <p class="search-text">Chọn loại bất động sản</p>
                            <select class="search-option" name="typeCode" id="typeCode">
                                <option value="">- Loại bất động sản</option>
                                <c:forEach var="item" items="${listTypes}">
                                    <option value="${item.key}" ${modelSearch.typeCode != null && modelSearch.typeCode.contains(item.key) ? 'selected' : ''}>${item.value}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="col-12 col-md-3 ">
                        <div class="search-btn">
                            <button type="submit" class="search-btn-text">
                                <i class="fa-solid fa-magnifying-glass search-btn-icon"></i>
                                <span>Tìm kiếm nhanh</span>
                            </button>
                        </div>
                    </div>
                </div>
                </form>
            </div>
        </div>
        <!-- CONTENT 1  -->
        <div class="content">
            <div class="content-title">
                <div class="title-cover">
                    <span id="title1">Dự án bất động sản nổi bật</span>
                    <span id="title2">Tổng hợp các bất động sản tại Hà Nội, Đà Nẵng, TP Hồ Chí Minh,... và các tỉnh thành
                            phố khác</span>
                </div>
            </div>
            <div class="content-product ">
                <div class="container">
                    <div class="content1 justify-content-center">
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
                </div>
            </div>
        </div>
    </div>

    <!-- CONTENT 2  -->
    <section class="section-why mt-5">
        <div class="container">
            <div class="row">
                <div class="col-12 col-md-12">
                    <div class="title_module_main a-center text-center">
                        <h2 style="margin-bottom: 15px;"><span>Vì sao bạn chọn bất động sản
                                    SkyLand ?</span>
                        </h2>
                        <p style="margin-bottom: 30px;">Chúng tôi cung cấp đầy đủ và chính xác
                            nhất thông tin
                            các dự án bất động sản trên
                            toàn quốc song hành với dịch vụ tư vấn nhanh chóng và hiệu quả</p>
                    </div>
                </div>
                <div class="col-12 col-md-12">
                    <div class="wrap">
                        <div
                                class="swiper_why swiper-container swiper-container-initialized swiper-container-horizontal swiper-container-multirow">
                            <div class="swiper-wrapper">
                                <div class="item swiper-slide swiper-slide-active">
                                    <div class="row section-why">
                                        <div class="col-12 col-md-4">
                                            <div class="wrap-temp d-flex">
                                                <div class="ico">
                                                    <img class="img-responsive lazyload loaded"
                                                         src="https://bizweb.dktcdn.net/100/328/362/themes/894751/assets/img_why1.png?1676257083798" data-src=""
                                                         alt="Chất lượng tốt nhất" data-was-processed="true">
                                                </div>
                                                <div class="content_p ml-4">
                                                    <h4><a href="#" class="why-title a-text">Chất lượng
                                                        tốt nhất</a>
                                                    </h4>
                                                    <p class="why-desc">Nghiên cứu, thiết kế và
                                                        đầu tư xây dựng
                                                        với hệ thống dịch
                                                        vụ
                                                        với chất
                                                        lượng tốt nhất</p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-12 col-md-4">
                                            <div class="wrap-temp d-flex">
                                                <div class="ico">
                                                    <img class="img-responsive lazyload loaded"
                                                         src="https://bizweb.dktcdn.net/100/328/362/themes/894751/assets/img_why2.png?1676257083798" data-src="" alt=""
                                                         data-was-processed="true">
                                                </div>
                                                <div class="content_p ml-4">
                                                    <h4><a href="#" class="why-title a-text">Tìm kiếm
                                                        thông tin dễ
                                                        dàng</a></h4>
                                                    <p class="why-desc">Tìm kiếm bất động sản
                                                        bạn muốn theo danh
                                                        mục cực kì dễ
                                                        dàng</p>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-12 col-md-4">
                                            <div class="wrap-temp d-flex">
                                                <div class="ico">
                                                    <img class="img-responsive lazyload loaded"
                                                         src="https://bizweb.dktcdn.net/100/328/362/themes/894751/assets/img_why3.png?1676257083798" data-src="" alt=""
                                                         data-was-processed="true">
                                                </div>
                                                <div class="content_p ml-4">
                                                    <h4><a href="#" class="why-title a-text">Kết nối
                                                        với nhà đầu tư</a>
                                                    </h4>
                                                    <p class="why-desc">Nhà đầu tư sẽ mang đến
                                                        những sản phẩm và
                                                        dịch vụ tốt nhất
                                                        đáp ứng nhu cầu của bạn</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-12 col-md-4">
                                        <div class="wrap-temp d-flex">
                                            <div class="ico">
                                                <img class="img-responsive lazyload loaded"
                                                     src="https://bizweb.dktcdn.net/100/328/362/themes/894751/assets/img_why4.png?1676257083798" data-src=""
                                                     alt="Chất lượng tốt nhất" data-was-processed="true">
                                            </div>
                                            <div class="content_p ml-4">
                                                <h4 class=""><a href="#" class="why-title a-text">Tối
                                                    ưu hóa dịch
                                                    vụ</a></h4>
                                                <p class="why-desc">Nghiên cứu, thiết kế và đầu
                                                    tư xây dựng với
                                                    hệ thống dịch vụ
                                                    với chất
                                                    lượng tốt nhất</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-12 col-md-4">
                                        <div class="wrap-temp d-flex">
                                            <div class="ico">
                                                <img class="img-responsive lazyload loaded"
                                                     src="https://bizweb.dktcdn.net/100/328/362/themes/894751/assets/img_why5.png?1676257083798" data-src=""
                                                     alt="Chất lượng tốt nhất" data-was-processed="true">
                                            </div>
                                            <div class="content_p ml-4">
                                                <h4><a href="#" class="why-title a-text">Đảm bảo quyền
                                                    lợi khách
                                                    hàng</a></h4>
                                                <p>
                                                <p class="why-desc">Thực hiện các chương trình
                                                    chăm sóc và gia
                                                    tăng lợi ích cho
                                                    khách hàng.</p>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-12 col-md-4">
                                        <div class="wrap-temp d-flex">
                                            <div class="ico">
                                                <img class="img-responsive lazyload loaded"
                                                     src="https://bizweb.dktcdn.net/100/328/362/themes/894751/assets/img_why6.png?1676257083798" data-src=""
                                                     alt="Chất lượng tốt nhất" data-was-processed="true">
                                            </div>
                                            <div class="content_p ml-4">
                                                <h4><a href="#" class="why-title a-text">Tiết kiệm thời
                                                    gian và chi
                                                    phí</a></h4>
                                                <p class="why-desc">Cập nhật giá cả nhanh chóng
                                                    và chính xác
                                                    giúp bạn tiết kiệm
                                                    chi phí hơn nhiều</p>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- FOOTER  -->
    <footer class="footer">
        <div class="container-fluid">
            <div class="top-footer text-center mt-0">
                <div class="logo logo-footer pt-5">
                    <a href="./ViewHome.html"><img src="https://bizweb.dktcdn.net/100/328/362/themes/894751/assets/logo_footer.png?1676257083798"
                                                   alt="logo-footer"></a>
                    <p class="desc-logo-footer mt-3">Với hơn 10 năm kinh nghiệm, SkyLand tự hào là sàn
                        mua
                        bán, giao dịch và quảng cáo
                        bất động sản hàng đầu tại Việt Nam</p>
                </div>
            </div>
            <div class="bottom-footer container">
                <div class="row">
                    <div class="col-12 col-md-3">
                        <h4 class="title-item-bottom-footer">Thông tin công ty</h4>
                        <p class="desc-item-bottom-footer desc-1"><a class="a-text" href="">Trang
                            chủ</a></p>
                        <p class="desc-item-bottom-footer"><a class="a-text" href="">Giới thiệu</a></p>
                        <p class="desc-item-bottom-footer"><a class="a-text" href="">Dự án bất động
                            sản</a></p>
                        <p class="desc-item-bottom-footer"><a class="a-text" href="">Tin tức</a></p>
                        <p class="desc-item-bottom-footer"><a class="a-text" href="">Liên hệ</a></p>
                    </div>
                </div>
            </div>
        </div>
        <div class="bottom-footer-2">
            <div class="text-center desc-bottom-footer-2">@ Bản quyền thuộc về Dungx2802</div>
        </div>
    </footer>
</div>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
</body>
</html>