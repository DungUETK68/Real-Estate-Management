<%--
  Created by IntelliJ IDEA.
  User: green
  Date: 04/04/2026
  Time: 1:17 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp" %>
<html>
<head>
    <title>Thêm tòa nhà</title>
</head>
<body>
    <div class="main-content" style="font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;">
        <div class="main-content-inner">
            <div class="breadcrumbs" id="breadcrumbs">
                <script type="text/javascript">
                    try {
                        ace.settings.check("breadcrumbs", "fixed");
                    } catch (e) {}
                </script>

                <ul class="breadcrumb">
                    <li>
                        <i class="ace-icon fa fa-home home-icon"></i>
                        <a href="#">Home</a>
                    </li>
                    <li class="active">Chỉnh sửa tòa nhà</li>
                </ul>
                <!-- /.breadcrumb -->
            </div>

            <div class="page-content">
                <div class="page-header">
                    <h1>
                        Chỉnh sửa tòa nhà
                        <small>
                            <i class="ace-icon fa fa-angle-double-right"></i>
                            overview &amp; stats
                        </small>
                    </h1>
                </div>
                <!-- /.page-header -->

                <div class="row" style="font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;">
                    <form:form modelAttribute="buildingEdit" id="formList" action="admin/building/edit" method="GET">
                    <div class="col-xs-12">
                        <form class="form-horizontal" role="form" id="form-edit">
                            <div class="form-group">
                                <label class="col-xs-3">Tên tòa nhà</label>
                                <div class="col-xs-9"><input class="form-control" type="text" id="name" name="name" value="${buildingEdit.name}"></div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3">Quận</label>
                                <div class="col-xs-2">
                                    <select id="districtId" class="form-control" name="districtId">
                                        <option value="">Chọn quận</option>
                                        <option value="1">Quận 1</option>
                                        <option value="2">Quận 2</option>
                                        <option value="3">Quận 3</option>
                                    </select></div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3">Phường</label>
                                <div class="col-xs-9"><input class="form-control" type="text" id="ward" name="ward" value="${buildingEdit.ward}"></div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3">Đường</label>
                                <div class="col-xs-9"><input class="form-control" type="text" id="street" name="street" value="${buildingEdit.street}"></div>
                            </div>

<%--                            <div class="form-group">--%>
<%--                                <label class="col-xs-3">Kết cấu</label>--%>
<%--                                <div class="col-xs-9"><input class="form-control" type="text" id="structure" name="structure"></div>--%>
<%--                            </div>--%>

                            <div class="form-group">
                                <label class="col-xs-3">Số tầng hầm</label>
                                <div class="col-xs-9"><input class="form-control" type="number" id="numberOfBasement" name="numberOfBasement" value="${buildingEdit.numberOfBasement}"></div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3">Diện tích sàn</label>
                                <div class="col-xs-9"><input class="form-control" type="number" id="floorArea" name="floorArea" value="${buildingEdit.floorArea}"></div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3">Hướng</label>
                                <div class="col-xs-9"><input class="form-control" type="text" id="direction" name="direction" value="${buildingEdit.direction}"></div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3">Hạng</label>
                                <div class="col-xs-9"><input class="form-control" type="number" id="level" name="level" value="${buildingEdit.level}"></div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3">Diện tích thuê</label>
                                <div class="col-xs-9"><input class="form-control" type="text" id="rentArea" name="renArea"></div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3">Giá thuê</label>
                                <div class="col-xs-9"><input class="form-control" type="number" id="rentPrice" name="rentPrice"></div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3">Mô tả giá</label>
                                <div class="col-xs-9"><input class="form-control" type="text" id="rentPriceDescription" name="rentPriceDescription"></div>
                            </div>
                            <!--
                                              <div class="form-group">
                                                <label class="col-xs-3">Phí dịch vụ</label>
                                                <div class="col-xs-9"><input class="form-control" type="number" id="name" name="name"></div>
                                              </div>

                                              <div class="form-group">
                                                <label class="col-xs-3">Phí ô tô</label>
                                                <div class="col-xs-9"><input class="form-control" type="number" id="name" name="name"></div>
                                              </div>

                                              <div class="form-group">
                                                <label class="col-xs-3">Phí mô tô</label>
                                                <div class="col-xs-9"><input class="form-control" type="number" id="name" name="name"></div>
                                              </div>

                                              <div class="form-group">
                                                <label class="col-xs-3">Phí ngoài giờ</label>
                                                <div class="col-xs-9"><input class="form-control" type="number" id="name" name="name"></div>
                                              </div>

                                              <div class="form-group">
                                                <label class="col-xs-3">Tiền điện</label>
                                                <div class="col-xs-9"><input class="form-control" type="number" id="name" name="name"></div>
                                              </div>

                                              <div class="form-group">
                                                <label class="col-xs-3">Đặt cọc</label>
                                                <div class="col-xs-9"><input class="form-control" type="number" id="name" name="name"></div>
                                              </div>

                                              <div class="form-group">
                                                <label class="col-xs-3">Thanh toán</label>
                                                <div class="col-xs-9"><input class="form-control" type="text" id="name" name="name"></div>
                                              </div>

                                              <div class="form-group">
                                                <label class="col-xs-3">Thời hạn thuê</label>
                                                <div class="col-xs-9"><input class="form-control" type="text" id="name" name="name"></div>
                                              </div>

                                              <div class="form-group">
                                                <label class="col-xs-3">Thời gian trang trí</label>
                                                <div class="col-xs-9"><input class="form-control" type="text" id="name" name="name"></div>
                                              </div>

                                              <div class="form-group">
                                                <label class="col-xs-3">Tên quản lý</label>
                                                <div class="col-xs-9"><input class="form-control" type="text" id="name" name="name"></div>
                                              </div>

                                              <div class="form-group">
                                                <label class="col-xs-3">SDT quản lý</label>
                                                <div class="col-xs-9"><input class="form-control" type="text" id="name" name="name"></div>
                                              </div>

                                              <div class="form-group">
                                                <label class="col-xs-3">Phí môi giới</label>
                                                <div class="col-xs-9"><input class="form-control" type="number" id="name" name="name"></div>
                                              </div> -->

                            <div class="form-group">
                                <label class="col-xs-3">Loại tòa nhà</label>
                                <div class="col-xs-9">
                                    <label class="checkbox-inline">
                                        <input type="checkbox" id="typeCode" name="typeCode" value="noi-that">Nội thất
                                    </label>
                                    <label class="checkbox-inline">
                                        <input type="checkbox" id="typeCode" name="typeCode" value="nguyen-can">Nguyên căn
                                    </label>
                                    <label class="checkbox-inline">
                                        <input type="checkbox" id="typeCode" name="typeCode" value="tang-tret">Tầng trệt
                                    </label>
                                </div>
                            </div>

                            <!-- <div class="form-group">
                              <label class="col-xs-3">Ghi chú</label>
                              <div class="col-xs-9"><input class="form-control" type="text" id="name" name="name"></div>
                            </div> -->
                        </form>

                        <div class="col-xs-12">
                            <div class="col-xs-3"></div>
                            <div class="col-xs-9">
                                <div class="pull-left">
                                    <c:if test="${not empty buildingEdit.id}">
                                        <button class="btn btn-info" id="btnAddBuilding">Sửa tòa nhà</button>
                                        <button class="btn btn-danger">Hủy thao tác</button>
                                    </c:if>
                                    <c:if test="${empty buildingEdit.id}">
                                        <button class="btn btn-info" id="btnAddBuilding">Thêm tòa nhà</button>
                                        <button class="btn btn-danger">Hủy thao tác</button>
                                    </c:if>
                                </div>
                            </div>
                        </div>
                    </div>
                    </form:form>
                </div>
            </div> <!-- /.page-content -->
        </div>
    </div> <!-- /.main-content -->
</body>
</html>
