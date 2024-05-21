<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">

    <script src="https://cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="icon" href="${pageContext.request.contextPath}/img/favicon.png" type="image/png">
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-sm-10">
            <!-- Search bar -->
            <div class="panel panel-default">
                <div class="panel-heading">Tìm kiếm</div>
                <div class="panel-body">
                    <form role="form" class="form-inline" action="${pageContext.request.contextPath}/student?method=search" method="post">
                        <div class="form-group">
                            <label for="name">Thuộc tính: </label>
                            <select name="key" class="form-control">
                                <option value="number">Mã sinh viên</option>
                                <option value="name">Họ tên</option>
                            </select>
                        </div>
                        <div class="form-group" style="margin-left: 20px">
                            <label>Giá trị: </label>
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
											<i class="fa fa-user-plus">Thêm sinh viên</i>
											</span>
                            </button>
                        </div>
                    </form>
                </div>
            </div>

            <!-- Student list-->
            <div class="table-responsive">
                <table class="table table-hover ">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Phòng</th>
                        <th>Mã sinh viên</th>
                        <th>Tên sinh viên</th>
                        <th>Giới tính</th>
                        <th>Tình trạng</th>
                        <th>Ngày vào</th>
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
                            <td>${student.createDate}</td>
                            <td>
                                <div class="btn-group">
                                    <button type="button" class="btn btn-default "
                                            data-id="${student.id}"
                                            data-dormitory-id="${student.dormitoryId}"
                                            data-number="${student.number}"
                                            data-name="${student.name}"
                                            data-gender="${student.gender}"
                                            data-create-date="${student.createDate}"
                                            data-toggle="modal"
                                            data-target="#updateUserModal">
                                        <i class="fa fa-user-o">Cập nhật</i>
                                    </button>

                                    <button type="button" class="btn btn-danger "
                                            data-id="${student.id}"
                                            data-dormitory-id="${student.dormitoryId}"
                                            data-number="${student.number}"
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
                <!-- add new student hidden form -->
                <form method="post" action="${pageContext.request.contextPath}/student?method=save" class="form-horizontal" style="margin-top: 0px" role="form"
                      id="form_data" style="margin: 20px;">
                    <div class="modal fade" id="addUserModal" tabindex="-1"
                         role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal"
                                            aria-hidden="true">x
                                    </button>
                                    <h4 class="modal-title" id="myModalLabel">Thêm sinh viên</h4>
                                </div>
                                <div class="modal-body">
                                    <form class="form-horizontal" role="form">
                                        <div class="form-group">
                                            <label for="user_id" class="col-sm-3 control-label">Phòng</label>
                                            <div class="col-sm-9">
                                                <select class="form-control" name="dormitoryId">
                                                    <c:forEach items="${dormitoryList}" var="dormitory">
                                                        <option value="${dormitory.id}">${dormitory.name}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="user_id" class="col-sm-3 control-label">Mã sinh viên</label>
                                            <div class="col-sm-9">
                                                <input type="text" required class="form-control" id="number" name="number">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="user_id" class="col-sm-3 control-label">Tên sinh viên</label>
                                            <div class="col-sm-9">
                                                <input type="text" required class="form-control" id="name" name="name">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="user_id" class="col-sm-3 control-label">Giới tính</label>
                                            <div class="col-sm-9">
                                                <input type="radio" checked value="nam" class="gender"
                                                       name="gender"> nam
                                                &nbsp;&nbsp;&nbsp;<input type="radio" value="nữ" class="gender"
                                                                         name="gender"> nữ
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

                <!-- update student information hidden form -->
                <form method="post" action="${pageContext.request.contextPath}/student?method=update" class="form-horizontal" style="margin-top: 0px" role="form"
                      id="form_data" style="margin: 20px;">
                    <div class="modal fade" id="updateUserModal" tabindex="-1"
                         role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal"
                                            aria-hidden="true">x
                                    </button>
                                    <h4 class="modal-title" id="myModalLabel">User information</h4>
                                </div>
                                <div class="modal-body">
                                    <form class="form-horizontal" role="form">
                                        <div class="form-group">
                                            <label for="user_id" class="col-sm-3 control-label">ID</label>
                                            <div class="col-sm-9">
                                                <input type="text" readonly required class="form-control" id="id"
                                                       name="id">
                                                <input type="hidden" name="oldDormitoryId" id="oldDormitoryId"/>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="user_id" class="col-sm-3 control-label">Phòng</label>
                                            <div class="col-sm-9">
                                                <select class="form-control" name="dormitoryId">
                                                    <c:forEach items="${dormitoryList}" var="dormitory">
                                                        <option class="dormitory" value="${dormitory.id}">${dormitory.name}</option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="user_id" class="col-sm-3 control-label">Mã sinh viên</label>
                                            <div class="col-sm-9">
                                                <input type="text" required class="form-control" id="number" name="number">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="user_id" class="col-sm-3 control-label">Tên sinh viên</label>
                                            <div class="col-sm-9">
                                                <input type="text" required class="form-control" id="name" name="name">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="user_id" class="col-sm-3 control-label">Giới tính</label>
                                            <div class="col-sm-9">
                                                <input type="radio" checked value="nam" class="gender"
                                                       name="gender"> nam
                                                &nbsp;&nbsp;&nbsp;<input type="radio" value="nữ" class="gender"
                                                                         name="gender"> nữ
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="user_id" class="col-sm-3 control-label">Ngày vào</label>
                                            <div class="col-sm-9">
                                                <input type="text" readonly class="form-control" id="createDate">
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

                <!-- delete student hidden form（Modal） -->
                <form method="post" action="${pageContext.request.contextPath}/student?method=delete"
                      class="form-horizontal" style="margin-top: 0px" role="form"
                      id="form_data" style="margin: 20px;">
                    <div class="modal fade" id="delUserModal" tabindex="-1"
                         role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal"
                                            aria-hidden="true">×
                                    </button>
                                    <h4 class="modal-title" id="myModalLabel">User information</h4>
                                </div>
                                <div class="modal-body">
                                    <form class="form-horizontal" role="form">
                                        <div class="form-group">
                                            <div class="col-sm-9">
                                                <h3 class="col-sm-18 control-label" id="deleteLabel">Xoá thông báo</h3>
                                                <input type="hidden" class="form-control" id="tab"
                                                       name="tab" value="dor_admin"> <input
                                                    type="hidden" class="form-control" id="id"
                                                    name="id">
                                                <input type="hidden" name="dormitoryId" id="dormitoryId"/>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">Huỷ</button>
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
    $('#updateUserModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget)
        var id = button.data('id')
        var dormitoryId = button.data('dormitory-id')
        var number = button.data('number')
        var name = button.data('name')
        var gender = button.data('gender')
        var createDate = button.data('create-date')
        var modal = $(this)

        modal.find('.modal-title').text('Cập nhật thông tin sinh viên')
        modal.find('#id').val(id)
        modal.find('#number').val(number)
        modal.find('#name').val(name)
        modal.find('#createDate').val(createDate)
        modal.find('#oldDormitoryId').val(dormitoryId)
        var list = modal.find('.gender')
        for (let i = 0; i < list.length; i++) {
            if (gender === $(list.get(i)).val()) {
                $(list.get(i)).prop('checked', true)
            }
        }
        var list2 = modal.find('.dormitory')
        for (let i = 0; i < list2.length; i++) {
            if (dormitoryId === $(list2.get(i)).val()) {
                $(list2.get(i)).prop('selected', true)
            }
        }
    })

    $('#delUserModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget)
        var id = button.data('id')
        var dormitoryId = button.data('dormitory-id')
        var name = button.data('name')
        var modal = $(this)
        modal.find('.modal-title').text('Cảnh báo xoá sinh viên')
        modal.find('#deleteLabel').text('Xoá sinh viên ' + name + ' không?')
        modal.find('#id').val(id)
        modal.find('#dormitoryId').val(dormitoryId)
    })
</script>

</body>

</html>