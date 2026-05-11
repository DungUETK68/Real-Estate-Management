<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chi tiết tòa nhà: ${building.name}</title>
</head>
<body>
<div class="page-wrapper">
    <!-- INTRO  -->
    <div class="intro text-center mb-5">
        <div class="title-page">${building.name}</div>
        <div class="row">
            <div class="col-xs-12 a-left">
                <ul class="desc-intro">
                    <li class="home">
                        <a href="/trang-chu"><span style="color:#fff">Trang chủ</span></a>
                        <span class="mx-1" style="color:#fff"> / </span>
                    </li>
                    <li class="home">
                        <a href="/san-pham"><span style="color:#fff">Sản phẩm</span></a>
                        <span class="mx-1" style="color:#fff"> / </span>
                    </li>
                    <li class="intro-item"><span>Chi tiết</span></li>
                </ul>
            </div>
        </div>
    </div>

    <!-- CONTENT  -->
    <div class="box-lienhe mt-5 mb-5" style="min-height: 50vh;">
        <div class="container">
            <div class="row">
                <div class="col-12 col-md-6">
                    <h2 class="title-lienhe"><strong>Thông tin tòa nhà: ${building.name}</strong></h2>
                    <div class="desc-lienhe">
                        <p><strong>Địa chỉ:</strong> ${building.street}, ${building.ward}, ${building.district}</p>
                        <p><strong>Diện tích sàn:</strong> ${building.floorArea} m^2</p>
                        <p><strong>Diện tích thuê:</strong> ${building.rentArea} m^2</p>
                        <p><strong>Giá thuê:</strong> ${building.rentPrice} triệu/tháng</p>
                        <p><strong>Tên quản lý:</strong> <c:choose><c:when test="${empty building.managerName}">Chưa có quản lý</c:when><c:otherwise>${building.managerName}</c:otherwise></c:choose></p>
                        <p><strong>SĐT quản lý:</strong> <c:choose><c:when test="${empty building.managerPhone}">Chưa có quản lý</c:when><c:otherwise>${building.managerPhone}</c:otherwise></c:choose></p>
                    </div>
                </div>
                <div class="col-12 col-md-6">
                    <h2 class="title-lienhe"><strong>Liên hệ nhận tư vấn</strong></h2>
                    <form id="contactForm">
                        <div class="row">
                            <div class="col">
                                <input type="text" class="form-control" name="fullName" placeholder="Họ và tên" required>
                            </div>
                            <div class="col">
                                <input type="email" class="form-control" name="email" placeholder="Email">
                            </div>
                        </div>
                        <input type="text" class="form-control mt-3" name="phone" placeholder="Số điện thoại" required>
                        
                        <!-- Pre-fill the demand with building info -->
                        <input type="text" class="form-control mt-3" name="demand" placeholder="Nội dung" value="Tôi quan tâm đến tòa nhà: ${building.name}">

                        <button type="button" class="btn btn-primary px-4 mt-3" id="btnSendContact">
                            Gửi liên hệ
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

<script>
    $('#btnSendContact').click(function (e) {
        e.preventDefault();

        var data = {};
        var formData = $('#contactForm').serializeArray();
        $.each(formData, function (i, v) {
            data[v.name] = v.value;
        });

        if (data.fullName === '' || data.phone === '') {
            alert("Vui lòng nhập đầy đủ Họ tên và Số điện thoại!");
            return;
        }

        $.ajax({
            type: "POST",
            url: "/api/customer",
            data: JSON.stringify(data),
            contentType: "application/json",
            success: function (response) {
                alert("Cảm ơn bạn! Thông tin liên hệ đã được gửi thành công.");
                $('#contactForm')[0].reset();
            },
            error: function (response) {
                alert("Có lỗi xảy ra, vui lòng thử lại sau.");
                console.log(response);
            }
        });
    });
</script>
</body>
</html>