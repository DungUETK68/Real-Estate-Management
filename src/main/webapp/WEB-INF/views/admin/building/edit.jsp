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
                    </h1>
                </div>
                <!-- /.page-header -->

                <div class="row" style="font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;">
                    <form:form modelAttribute="buildingEdit" id="listForm" action="admin/building/edit" method="GET">
                    <div class="col-xs-12">
                        <form class="form-horizontal" role="form">
                            <div class="form-group">
                                <label class="col-xs-3">Tên tòa nhà</label>
                                <div class="col-xs-9"><input class="form-control" type="text" id="name" name="name" value="${buildingEdit.name}"></div>
                            </div>

                            <div class="form-group">
                                <label class="col-xs-3">Quận</label>
                                <div class="col-xs-2">
                                    <form:select class="form-control" path="district">
                                        <form:option value="">Chọn quận</form:option>
                                        <form:options items="${listDistricts}"/>
                                    </form:select>
                                    </div>
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
                                    <form:checkboxes items="${listTypes}" path="typeCode"/>
                                </div>
                            </div>

                            <!-- <div class="form-group">
                              <label class="col-xs-3">Ghi chú</label>
                              <div class="col-xs-9"><input class="form-control" type="text" id="name" name="name"></div>
                            </div> -->

                            <div class="col-xs-12">
                                <div class="col-xs-3"></div>
                                <div class="col-xs-9">
                                    <div class="pull-left">
                                        <c:if test="${not empty buildingEdit.id}">
                                            <button class="btn btn-info" id="btnAddOrUpdateBuilding">Sửa tòa nhà</button>
                                            <button class="btn btn-danger" id="btnCancel">Hủy thao tác</button>
                                        </c:if>
                                        <c:if test="${empty buildingEdit.id}">
                                            <button class="btn btn-info" id="btnAddOrUpdateBuilding">Thêm tòa nhà</button>
                                            <button class="btn btn-danger" id="btnCancel">Hủy thao tác</button>
                                        </c:if>
                                    </div>
                                </div>
                            </div>

                            <form:hidden path="id" id="buildingId"/>
                        </form>
                    </div>
                    </form:form>
                </div>
            </div> <!-- /.page-content -->
        </div>
    </div> <!-- /.main-content -->

    <script>
        $('#btnAddOrUpdateBuilding').click(function(){
            var data = {};
            var typeCode = [];
            var formData = $('#listForm').serializeArray();
            $.each(formData, function(i, v) {
                if (v.name != 'typeCode') {
                    data["" + v.name + ""] = v.value;
                } else {
                    typeCode.push(v.value);
                }
            });
            data['typeCode'] = typeCode;
            if (typeCode != "") {
                addOrUpdateBuilding(data);
            } else {
                window.location.href = "<c:url value = "/admin/building-edit?typeCode=required"/>";
            }
        });

        function addOrUpdateBuilding(data){
            //call api
            $.ajax({
                type: "POST",
                url: "/admin/building",
                data: JSON.stringify(data),
                contentType: "application/json",
                dataType: "JSON",
                success: function(respond) {
                    console.log("Success");
                },
                error: function(respond) {
                    console.log(respond);
                }
            });
        }

        $('#btnCancel').click(function(){
            window.location.href = "/admin/building-list";
        })
    </script>
</body>
</html>
