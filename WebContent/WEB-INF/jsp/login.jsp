<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="myApp">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport"
	content="initial-scale=1, maximum-scale=1, user-scalable=no, width=device-width" />
<title>人才技能之家 登录</title>
<!--字体图标-->
<link href="http://cdn.javaex.cn/javaex/pc/css/icomoon.css"
	rel="stylesheet" />
<!--动画-->
<link href="http://cdn.javaex.cn/javaex/pc/css/animate.css"
	rel="stylesheet" />
<!--骨架样式-->
<link href="http://cdn.javaex.cn/javaex/pc/css/common.css"
	rel="stylesheet" />
<!--皮肤（缇娜）-->
<link href="http://cdn.javaex.cn/javaex/pc/css/skin/tina.css"
	rel="stylesheet" />
<!--jquery，不可修改版本-->
<script src="http://cdn.javaex.cn/javaex/pc/lib/jquery-1.7.2.min.js"></script>
<!--全局动态修改-->
<script src="http://cdn.javaex.cn/javaex/pc/js/common.js"></script>
<!--核心组件-->
<script src="http://cdn.javaex.cn/javaex/pc/js/javaex.min.js"></script>
<!--表单验证-->
<script src="http://cdn.javaex.cn/javaex/pc/js/javaex-formVerify.js"></script>
</head>
<body ng-controller="siteCtrl">
	<style>
.bg-wrap, body, html {
	height: 100%;
}

input {
	line-height: normal;
	-webkit-appearance: textfield;
	background-color: white;
	-webkit-rtl-ordering: logical;
	cursor: text;
	padding: 1px;
	border-width: 2px;
	border-style: inset;
	border-color: initial;
	border-image: initial;
}

input[type="text"], input[type="password"] {
	border: 0;
	outline: 0;
}

input, button {
	text-rendering: auto;
	color: initial;
	letter-spacing: normal;
	word-spacing: normal;
	text-transform: none;
	text-indent: 0px;
	text-shadow: none;
	display: inline-block;
	text-align: start;
	margin: 0em;
	font: 400 13.3333px Arial;
}

input[type=button] {
	-webkit-appearance: button;
	cursor: pointer;
}

.bg-wrap {
	position: relative;
	background: url(http://img.javaex.cn/FipOsQoe90u_7i3dOVpaeX5QD7c6) top
		left no-repeat;
	background-size: cover;
	overflow: hidden;
}

.main-cont-wrap {
	z-index: 1;
	position: absolute;
	top: 50%;
	left: 50%;
	margin-left: -190px;
	margin-top: -255px;
	box-sizing: border-box;
	width: 380px;
	padding: 30px 30px 40px;
	background: #fff;
	box-shadow: 0 20px 30px 0 rgba(63, 63, 65, .06);
	border-radius: 10px;
}

.form-title {
	margin-bottom: 40px;
}

.form-title>span {
	font-size: 20px;
	color: #2589ff;
}

.form-item {
	margin-bottom: 30px;
	position: relative;
	height: 40px;
	line-height: 40px;
	border-bottom: 1px solid #e3e3e3;
	box-sizing: border-box;
}

.form-txt {
	display: inline-block;
	width: 70px;
	color: #595961;
	font-size: 14px;
	margin-right: 10px;
}

.form-input {
	border: 0;
	outline: 0;
	font-size: 14px;
	color: #595961;
	width: 155px;
}

.form-btn {
	margin-top: 40px;
}

.ui-button {
	display: block;
	width: 320px;
	height: 50px;
	text-align: center;
	color: #fff;
	background: #2589ff;
	border-radius: 6px;
	font-size: 16px;
	border: 0;
	outline: 0;
}
</style>

	<div class="bg-wrap">
		<div class="main-cont-wrap login-model">
			<form id="form">
				<div class="form-title">
					<span>人才技能之家 专家登录</span>
				</div>
				<div class="form-item">
					<span class="form-txt">账号：</span> <input type="text"
						ng-model="tuid" class="form-input original" id="login_name"
						name="loginName" placeholder="请输入账号" data-type="必填" error-pos="32" />
				</div>
				<div class="form-item">
					<span class="form-txt">密码：</span> <input type="password"
						ng-model="tpwd" class="form-input original" name="password"
						placeholder="请输入密码" data-type="必填" error-pos="32" />
				</div>
				<div class="form-btn">
					<input type="button" class="ui-button" id="save" value="登录"
						ng-click="loginCheck()" />
				</div>
			</form>
		</div>
	</div>
	<script
		src="https://cdn.staticfile.org/angular.js/1.6.3/angular.min.js"></script>
	<script>
		var app = angular.module('myApp', []);

		app.controller('siteCtrl', function($scope, $http) {
			$scope.loginCheck = function() {
				  $http({
					method : 'POST',
					url : './login_Check1.do',
					params : {
						tuid : $scope.tuid,
						tpwd : $scope.tpwd
					}
				}).then(function successCallback(response) {
					console.log(response.data);
					if (response.data == 1) {
						window.location.href = "./index.do";
					} else {
						javaex.message({
							content : "账号或密码错误,请重新输入",
							type : "error"
						});
					} 
				}, function errorCallback(response) {
					javaex.message({
						content : "操作失败",
						type : "error"
					});
				});  
			}

		});
	</script>
</body>
</html>
