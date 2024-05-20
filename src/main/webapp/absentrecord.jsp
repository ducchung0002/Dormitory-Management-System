<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
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
            <div class="panel panel-default">
                <div class="panel-heading">Tìm kiếm</div>
                <div class="panel-body">
                    <form role="form" class="form-inline" action="absent?method=search" method="post">
                        <div class="form-group">
                            <label for="name">Tìm theo：</label>
                            <select name="key" class="form-control">
                                <option value="buildingName">Tòa nhà</option>
                                <option value="dormitoryName">Phòng</option>
                            </select>
                        </div>
                        <div class="form-group" style="margin-left: 20px">
                            <label for="value">Giá trị：</label>
                            <input type="text" class="form-control" name="value" placeholder="Giá trị" maxlength="12" style="width: 130px">
                        </div>
                        <div class="form-group " style="margin-left: 20px">
                            <button type="submit" class="btn btn-info ">
										<span style="margin-right: 5px"
                                              class="glyphicon glyphicon-search" aria-hidden="true">
										</span>Bắt đầu tìm kiếm
                            </button>
                        </div>
                    </form>
                </div>
            </div>
            <div class="table-responsive">
                <table class="table table-hover ">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Tòa nhà</th>
                        <th>Phòng</th>
                        <th>Tên</th>
                        <th>Lí do</th>
                        <th>Người quản lí</th>
                        <th>Thời gian</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${list}" var="absent">
                        <tr>
                            <td>${absent.id}</td>
                            <td>${absent.buildingName}</td>
                            <td>${absent.dormitoryName}</td>
                            <td>${absent.studentName}</td>
                            <td>${absent.reason}</td>
                            <td>${absent.dormitoryAdminName}</td>
                            <td>${absent.createDate}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

</body>

</html>