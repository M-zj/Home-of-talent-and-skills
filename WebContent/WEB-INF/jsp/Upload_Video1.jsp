<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport"
	content="initial-scale=1, maximum-scale=1, user-scalable=no, width=device-width" />




<!-- layui -->
<link href="./resource/pc/layui/layui.css" rel="stylesheet" />
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








<title>上传视频 - 人才技能之家</title>
<style type="text/css">
	  .from-spfm{
	  			margin-left: 18px;
	  }
	  .form-control{
	  			margin-left: 12px;
	  }
</style>
</head>
<body>
	<!--全部主体内容-->
	<div class="list-content">
		<!--块元素-->
		<div class="block">
			<!--修饰块元素名称-->
			<div class="banner">
				<p class="tab fixed">视频上传</p>
			</div>




			<!--正文内容-->
			<div class="main">
				<form id="form" class="form-horizontal"  method="post" action="./Upload_video_data.do" enctype="multipart/form-data">
						
					<!--文本框-->
					
					<div class="unit clear">
						<div class="left">
							<p class="subtitle">视频标题</p>
						</div>
						<div class="right">
							<input type="text" class="text" data-type="NONull" name="title"
								error-msg="视频标题不能为空" error-pos="42" placeholder="请输入视频标题" />
						</div>
					</div>
					<div>
							<span class="from-spfm">视频封面：</span><input type="file"  class="form-control " accept="image/*" name="file" id="file"><br/><br/>
					 		<span class="from-spfm">上传视频：</span><input type="file" class="form-control" name="file1" accept="video/*" id="file1"><br>
							
					</div>
					<!--日期选择框-->
					<div class="unit clear">
						<div class="left">
							<p class="subtitle">上传时间</p>
						</div>
						<div class="right">
							<input type="text" id="date3" class="ex-date" name="date"
								style="width: 200px;" value="" readonly />
						</div>
					</div>


					<!--提交按钮-->
					<div class="unit clear" style="width: 800px;">
						<div style="text-align: center;">
							<!--表单提交时，必须是input元素，并指定type类型为button，否则ajax提交时，会返回error回调函数-->
							<input type="button" id="return" class="button no" value="返回" />
						 <input type="submit"  class="button yes" value="上传">
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>




	<!--jquery，不可修改版本-->
	<script src="http://cdn.javaex.cn/javaex/pc/lib/jquery-1.7.2.min.js"></script>
	<!--全局动态修改-->
	<script src="http://cdn.javaex.cn/javaex/pc/js/common.js"></script>
	<!--核心组件-->
	<script src="http://cdn.javaex.cn/javaex/pc/js/javaex.min.js"></script>
	<!--表单验证-->
	<script src="resource/pc/js/javaex-formVerify.js"></script>
	<!-- layui 上传视频 -->
	<script src="./resource/pc/layui/layui.all.js"></script>
	<script>
		layui.use('upload', function() {
			var $ = layui.jquery, upload = layui.upload;




			//选完文件后不自动上传
			upload.render({
				elem : '#test8',
				url : '/upload/',
				auto : false
				//,multiple: true
				,
				bindAction : '#test9',
				done : function(res) {
					console.log(res)
				}
			});




		});
	</script>
	<script>
		javaex.select({
			id : "select",
			isSearch : false
		});


		function getNowFormatDate() {//获取当前时间
			var date = new Date();
			var seperator1 = "-";
			var seperator2 = ":";
			var month = date.getMonth() + 1<10? "0"+(date.getMonth() + 1):date.getMonth() + 1;
			var strDate = date.getDate()<10? "0" + date.getDate():date.getDate();
			var currentdate = date.getFullYear() + seperator1  + month  + seperator1  + strDate
					+ " =="  + date.getHours()  + seperator2  + date.getMinutes()
					+ seperator2 + date.getSeconds();
			return currentdate;
		}

		javaex.date({
			id : "date3", // 承载日期组件的id
			type : "yyyy-MM-dd HH:mm:ss", // 控件类型
			date : getNowFormatDate(), // 选择的日期
			// 重新选择日期之后返回一个时间对象
			callback : function(rtn) {
				/* alert(rtn.date); */
			}
		});




		javaex.tag({
			id : "tag"
		});




		/* 封面 */
		javaex.upload({
			type : "image",
			id : "upload", // <input type="file" />的id
			containerId : "container", // 容器id
			dataType : "base64", // 返回的数据类型：base64 或 url
			callback : function(rtn) {
				//			console.log(rtn);
				$("#container img").attr("src", rtn);
				//			if (rtn.code=="000000") {
				//				$("#container img").attr("src", rtn.data.imgUrl);
				//			} else {
				//				javaex.optTip({
				//					content : rtn.message,
				//					type : "error"
				//				});
				//			}
			}
		});




	




		// 监听点击保存按钮事件
		$("#save").click(function() {
			// 表单验证函数
			if (javaexVerify()) {
				// 返回错误信息时，可以添加自定义异常提示。参数为元素id和提示
				// addErrorMsg("username", "用户名不存在");
				// 提交
				// $("#form").submit();
				alert("验证通过");
			}
		});




		// 监听点击返回按钮事件
		$("#return").click(function() {
			alert("返回");
			// window.location.href = document.referrer;
		});
	</script>
</body>
</html>