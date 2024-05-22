<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

            <!-- Search bar -->
            <div class="panel panel-default">
                <div class="panel-heading">Tìm kiếm</div>
                <div class="panel-body">
                    <form role="form" class="form-inline" action="${pageContext.request.contextPath}/moveout?method=search" method="post">
                        <div class="form-group">
                            <label for="name">Thuộc tính: </label>
                            <select name="key" class="form-control">
                                <option value="number">Mã sinh viên</option>
                                <option value="name">Họ tên</option>
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
                    </form>
                </div>
            </div>
            <!-- move out list display -->
            <div class="table-responsive">
                <table class="table table-hover ">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Phòng</th>
                        <th>Mã sinh viên</th>
                        <th>Họ tên</th>
                        <th>Giới tính</th>
                        <th>Trạng thái</th>
                        <th>Hành động</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${list}" var="student">
                        <tr>
                            <td>${student.id}</td>
                            <td>${student.dormitoryName}</td>
                            <td>${student.number}</td>
                            <td>${student.name}</td>
                            <td>${student.gender}</td>
                            <td>${student.state}</td>
                            <td>
                                <div class="btn-group">
                                    <button type="button" class="btn btn-danger"
                                            data-id="${student.id}"
                                            data-dormitory-id="${student.dormitoryId}"
                                            data-name="${student.name}"
                                            data-toggle="modal"
                                            data-target="#delUserModal">
                                        <i class="fa fa-user-o">Chuyển đi</i>
                                    </button>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>

                <!-- approve -->
                <form method="post" action="${pageContext.request.contextPath}/moveout?method=moveout"
                      class="form-horizontal" style="margin-top: 0px" role="form"
                      id="form_data" style="margin: 20px;">

                    <div class="modal fade" id="delUserModal" tabindex="-1"
                         role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal"
                                            aria-hidden="true">×</button>
                                    <h4 class="modal-title" id="myModalLabel"></h4>
                                </div>
                                <div class="modal-body">
                                    <form class="form-horizontal" role="form">

                                        <div class="form-group">
                                            <div class="col-sm-9">
                                                <h3 class="col-sm-18 control-label" id="deleteLabel"></h3>
                                                <input type="hidden" class="form-control" id="tab"
                                                       name="tab" placeholder="" value="dor_admin"> <input
                                                    type="hidden" class="form-control" id="id"
                                                    name="studentId" placeholder="">
                                                <input type="hidden" class="form-control"
                                                       name="dormitoryId" id="dormitoryId">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="user_id" class="col-sm-3 control-label">Lý do rời</label>
                                            <div class="col-sm-9">
                                                <input type="text" required class="form-control" name="reason">
                                            </div>
                                        </div>

                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Hủy</button>
                                    <button type="submit" class="btn btn-danger">Chuyển đi</button>
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
</div>

<script>
    $('#delUserModal').on('show.bs.modal', function(event) {
        var button = $(event.relatedTarget)
        var id = button.data('id')
        var dormitoryId = button.data('dormitory-id')
        var name = button.data('name')
        var modal = $(this)
        modal.find('.modal-title').text('Chuyển sinh viên')
        modal.find('#deleteLabel').text('Chuyển sinh viên ' + name + '?')
        modal.find('#id').val(id)
        modal.find('#dormitoryId').val(dormitoryId)
    })
</script>

</body>

</html>