<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">

    <script src="https://cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="icon" href="${pageContext.request.contextPath}/img/favicon.png" type="image/png">
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <script type="application/javascript">
        function change(url, index) {
            $(".list-group-item").removeClass("active");
            $(".list-group-item").eq(index).addClass("active");
            $("iframe").attr("src", url);
        }
    </script>
    <title>Hệ thống quản lý ký túc xá</title>
</head>
<body>

<nav class="navbar navbar-inverse" role="navigation">
    <div class="container-fluid">
        <ul class="nav navbar-nav navbar-left">
            <li>
                <a style="font-size: 26px;">Quản trị viên hệ thống</a>
            </li>
        </ul>
        <span style="color: #CCCCCC;font-size: 26px;position: relative;top: 5px;"></span>
        <ul class="nav navbar-nav navbar-right">
            <li>
                <a>Xin chào, ${systemAdmin.name}</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/account?method=logout">Đăng xuất</a>
            </li>
        </ul>
    </div>
</nav>

<div class="container-fluid">
    <div class="row">
        <div class="col-sm-2">
            <a href="javascript:void(0)" class="list-group-item active" onclick="change('/dormitoryAdmin?method=list',0)">
						<span class="" aria-hidden="true">
							<i class="fa fa-user-circle-o fa-fw"></i>
						</span>Quản trị viên ký túc xá
            </a>
            <a href="javascript:void(0)" class="list-group-item" onclick="change('/student?method=list',1)">
						<span class="" aria-hidden="true">
							<i class="fa fa-user-circle fa-fw"></i>
						</span>Sinh viên
            </a>
            <a href="javascript:void(0)" class="list-group-item" onclick="change('/building?method=list',2)">
						<span class="" aria-hidden="true">
							<i class="fa fa-home fa-fw"></i>
						</span>Toà nhà
            </a>
            <a href="javascript:void(0)" class="list-group-item" onclick="change('/dormitory?method=list',3)">
						<span class="" aria-hidden="true">
							<i class="fa fa-bed fa-fw"></i>
						</span>Phòng
            </a>
            <a href="javascript:void(0)" class="list-group-item" onclick="change('/moveout?method=list',4)">
						<span class="" aria-hidden="true">
							<i class="fa fa-address-card-o fa-fw"></i>
						</span>Đăng ký chuyển đi của sinh viên
            </a>
            <a href="javascript:void(0)" class="list-group-item" onclick="change('/moveout?method=record',5)">
						<span class="" aria-hidden="true">
							<i class="fa fa-bookmark fa-fw"></i>
						</span>Hồ sơ chuyển đi của sinh viên
            </a>
            <a href="javascript:void(0)" class="list-group-item" onclick="change('/absent?method=list',6)">
						<span class="" aria-hidden="true">
							<i class="fa fa-bookmark-o fa-fw"></i>
						</span>Bản ghi sinh viên vắng mặt
            </a>

        </div>
        <!--page content -->
        <iframe style="width: 81%; height: 400px; border: 0;" src="${pageContext.request.contextPath}/dormitoryAdmin?method=list"></iframe>
    </div>
</div>

</body>
</html>
