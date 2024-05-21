<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script src="https://cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <title>Hệ thống quản lý ký túc xá</title>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-sm-10">
            <!-- Search br -->
            <div class="panel panel-default">
                <div class="panel-heading">Tìm kiếm</div>
                <div class="panel-body">
                    <form role="form" class="form-inline" action="dormitory?method=search" method="post">
                        <div class="form-group">
                            <label for="name">Thuộc tính: </label>
                            <select name="key" class="form-control">
                                <option value="name">Toà nhà</option>
                                <option value="telephone">Số điện thoại</option>
                            </select>
                        </div>
                        <div class="form-group" style="margin-left: 20px">
                            <label for="value">Giá trị: </label>
                            <input type="text" class="form-control" name="value" maxlength="12" style="width: 130px">
                        </div>
                        <div class="form-group " style="margin-left: 20px">
                            <button type="submit" class="btn btn-info ">
										<span style="margin-right: 5px"
                                              class="glyphicon glyphicon-search" aria-hidden="true">
										</span>Tìm
                            </button>
                        </div>
                        <div class="form-group " style="margin-left: 48px">
                            <button type="button" class="btn btn-default" data-toggle="modal" data-target="#addUserModal">
										<span style="margin-right: 5px" class="" aria-hidden="true">
											<i class="fa fa-user-plus">Thêm thông tin phòng</i>
											</span>
                            </button>
                        </div>
                    </form>
                </div>
            </div>
            <!-- room list -->
            <div class="table-responsive">
                <table class="table table-hover ">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Toà nhà</th>
                        <th>Mã phòng</th>
                        <th>Sức chứa</th>
                        <th>Còn trống</th>
                        <th>Điện thoại</th>
                        <th>Hành động</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${list}" var="dormitory">
                        <tr>
                            <td>${dormitory.id}</td>
                            <td>${dormitory.buildingName}</td>
                            <td>${dormitory.name}</td>
                            <td>${dormitory.type}</td>
                            <td>${dormitory.available}</td>
                            <td>${dormitory.telephone}</td>
                            <td>
                                <div class="btn-group">
                                    <button type="button" class="btn btn-default "
                                            data-id="${dormitory.id}"
                                            data-name="${dormitory.name}"
                                            data-telephone="${dormitory.telephone}"
                                            data-toggle="modal"
                                            data-target="#updateUserModal">
                                        <i class="fa fa-user-o">Cập nhật</i>
                                    </button>

                                    <button type="button" class="btn btn-danger "
                                            data-id="${dormitory.id}"
                                            data-name="${dormitory.name}"
                                            data-toggle="modal"
                                            onclick="" data-target="#delUserModal">
                                        <i class="fa fa-user-times">Xoá</i>
                                    </button>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <!-- hidden add room form -->
                <form method="post" action="${pageContext.request.contextPath}/dormitory?method=save" class="form-horizontal" style="margin-top: 0px" role="form"
                      id="form_data" style="margin: 20px;">
                    <div class="modal fade" id="addUserModal" tabindex="-1"
                         role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal"
                                            aria-hidden="true">x</button>
                                    <h4 class="modal-title" id="myModalLabel">Thêm phòng</h4>
                                </div>
                                <div class="modal-body">
                                    <form class="form-horizontal" role="form">
                                        <div class="form-group">
                                            <label for="user_id" class="col-sm-3 control-label">Toà nhà</label>
                                            <div class="col-sm-9">
                                                <select class="form-control" name="buildingId">
                                                    <c:forEach items="${buildingList}" var="building">
                                                        <option class="buildingId" value="${building.id}">${building.name}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="user_id" class="col-sm-3 control-label">Mã phòng</label>
                                            <div class="col-sm-9">
                                                <input type="text" required class="form-control" id="name" name="name">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="user_id" class="col-sm-3 control-label">Sức chứa</label>
                                            <div class="col-sm-9">
<%--                                                <select class="form-control" name="type">--%>
<%--                                                    <option value="4">4</option>--%>
<%--                                                    <option value="6">6</option>--%>
<%--                                                    <option value="8">8</option>--%>
<%--                                                    <option value="10">10</option>--%>
<%--                                                </select>--%>
                                                <input class="form-control" type="number" name="type" min="1" max="10">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="user_id" class="col-sm-3 control-label">Số điện thoại</label>
                                            <div class="col-sm-9">
                                                <input type="text" required class="form-control" id="telephone" name="telephone">
                                            </div>
                                        </div>

                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Huỷ</button>
                                    <button type="submit" class="btn btn-primary">Thêm</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>

                <!-- hidden update dorm form -->
                <form method="post" action="${pageContext.request.contextPath}/dormitory?method=update" class="form-horizontal" style="margin-top: 0px" role="form"
                      id="form_data" style="margin: 20px;">
                    <div class="modal fade" id="updateUserModal" tabindex="-1"
                         role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal"
                                            aria-hidden="true">x</button>
                                    <h4 class="modal-title" id="myModalLabel">Cập nhật phòng</h4>
                                </div>
                                <div class="modal-body">
                                    <form class="form-horizontal" role="form">

                                        <div class="form-group">
                                            <label for="user_id" class="col-sm-3 control-label">ID</label>
                                            <div class="col-sm-9">
                                                <input type="text" readonly required class="form-control" id="id"
                                                       name="id">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="user_id" class="col-sm-3 control-label">Mã phòng</label>
                                            <div class="col-sm-9">
                                                <input type="text" required class="form-control" id="name" name="name">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="user_id" class="col-sm-3 control-label">Số điện thoại</label>
                                            <div class="col-sm-9">
                                                <input type="text" required class="form-control" id="telephone" name="telephone">
                                            </div>
                                        </div>

                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Huỷ</button>
                                    <button type="submit" class="btn btn-primary">Cập nhật</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>

                <!-- delete room -->
                <form method="post" action="${pageContext.request.contextPath}/dormitory?method=delete"
                      class="form-horizontal" style="margin-top: 0px" role="form"
                      id="form_data" style="margin: 20px;">
                    <div class="modal fade" id="delUserModal" tabindex="-1"
                         role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal"
                                            aria-hidden="true">×</button>
                                    <h4 class="modal-title" id="myModalLabel">Xoá phòng</h4>
                                </div>
                                <div class="modal-body">
                                    <form class="form-horizontal" role="form">
                                        <div class="form-group">
                                            <div class="col-sm-9">
                                                <h3 class="col-sm-18 control-label" id="deleteLabel">Xoá tin nhắn</h3>
                                                <input type="hidden" class="form-control" id="tab"
                                                       name="tab" placeholder="" value="dor_admin"> <input
                                                    type="hidden" class="form-control" id="id"
                                                    name="id">
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Huỷ bỏ</button>
                                    <button type="submit" class="btn btn-danger">Xoá</button>
                                    <span id="tip"> </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script>
    $('#updateUserModal').on('show.bs.modal', function(event) {
        var button = $(event.relatedTarget)
        var id = button.data('id')
        var name = button.data('name')
        var telephone = button.data('telephone')
        var modal = $(this)

        modal.find('.modal-title').text('Cập nhật phòng')
        modal.find('#id').val(id)
        modal.find('#name').val(name)
        modal.find('#telephone').val(telephone)
    })

    $('#delUserModal').on('show.bs.modal', function(event) {
        var button = $(event.relatedTarget)
        var id = button.data('id')
        var name = button.data('name')
        var modal = $(this)
        modal.find('.modal-title').text('Cảnh báo xoá phòng')
        modal.find('#deleteLabel').text('Xoá phòng ' + name + '?')
        modal.find('#id').val(id)
    })
</script>

</body>

</html>