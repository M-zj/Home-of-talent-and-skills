<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="myApp">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, width=device-width" />
<!--字体图标-->
<link href="http://cdn.javaex.cn/javaex/pc/css/icomoon.css" rel="stylesheet" />
<!--动画-->
<link href="http://cdn.javaex.cn/javaex/pc/css/animate.css" rel="stylesheet" />
<!--骨架样式-->
<link href="http://cdn.javaex.cn/javaex/pc/css/common.css" rel="stylesheet" />
<!--皮肤（缇娜）-->
<link href="http://cdn.javaex.cn/javaex/pc/css/skin/tina.css" rel="stylesheet" />

<title>互动答疑 - 人才技能之家</title>
<style>
 a {
	text-overflow: ellipsis;
	overflow: hidden;
}
</style>
</head>
<body ng-controller="siteCtrl">
	<!--顶部导航-->
	<div class="admin-navbar">
		<div class="admin-container-fluid clear">
			<!--logo名称-->
			<div class="admin-logo">人才技能之家</div>
			
			<!--导航-->
			<ul class="admin-navbar-nav fl">
				<li class="active"><a href="index.do">首页</a></li>
				<li><a href="info.do">互动答疑</a></li>
			
			</ul>
			
			<!--右侧-->
			<ul class="admin-navbar-nav fr">
				<li>
					<a href="javascript:;">欢迎您，<%=session.getAttribute("username")%></a>
					<ul class="dropdown-menu" style="right: 10px;">
						<li><a href="./exit_login.do">退出当前账号</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</div>
	
	<!--主题内容-->
	<div class="admin-mian">
		<!--左侧菜单-->
		 <div class="admin-aside admin-aside-fixed">
			<h1><span class="admin-nav-name">视频列表</span></h1>
			<div id="admin-toc" class="admin-toc">
				<div class="menu-box">
					<div id="menu" class="menu">
						<ul>
							<li class="menu-item" ng-repeat="v in video">
								<!-- <a href="javascript:page('info_hd.do')">{{v.vtitle}}</a>  -->
								<a href="javascript:page('info_hd.do')" ng-click="selec(v.vid,v.iid)">{{v.vtitle}}</a>
							</li>
							
							
						</ul>
					</div>
				</div>
			</div> 
		</div>
		
		<!--iframe载入内容-->
		<div class="admin-markdown">
			<iframe id="page" src="./VP.do"></iframe>
		</div>
	</div>
	<!--jquery，不可修改版本-->
<script src="http://cdn.javaex.cn/javaex/pc/lib/jquery-1.7.2.min.js"></script>
<!--全局动态修改-->
<script src="http://cdn.javaex.cn/javaex/pc/js/common.js"></script>
<!--核心组件-->
<script src="http://cdn.javaex.cn/javaex/pc/js/javaex.min.js"></script>
<!--表单验证-->
<script src="http://cdn.javaex.cn/javaex/pc/js/javaex-formVerify.js"></script>
<!-- angular -->
<script src="https://cdn.staticfile.org/angular.js/1.4.6/angular.min.js"></script>
<script>
var app = angular.module('myApp', []);
	
app.controller('siteCtrl', function($scope, $http) {
	
	/* 查询视频表Video */
	$http.get("sel_Video.do").then(function (response) {
	     console.log(response.data.data);
	     $scope.video=response.data.data;
	  });
	
	$scope.selec=function(){
		vid=arguments[0];
		iid=arguments[1];
		console.log("++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
		console.log(vid+"+++++++++++++"+iid);
		//查询用户yhid
		 $http.get('./get_vid.do',{
			 params:{
				 vid:vid,
				 iid:iid
			 } 
		 }).success(function(e){
			
		}) 
	}
  
});
</script>

<script>
	var hightUrl = "xxxx";
	javaex.menu({
		id : "menu",
		isAutoSelected : true,
		key : "",
		url : hightUrl
	});
	
	$(function() {
		// 设置左侧菜单高度
		setMenuHeight();
	});
	
	/**
	 * 设置左侧菜单高度
	 */
	function setMenuHeight() {
		var height = document.documentElement.clientHeight - $("#admin-toc").offset().top;
		height = height - 10;
		$("#admin-toc").css("height", height+"px");
	}
	
	// 控制页面载入
	function page(url) {
		$("#page").attr("src", url);
	}
</script>
</body>
</html>