<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport"
	content="initial-scale=1, maximum-scale=1, user-scalable=no, width=device-width" />
<!-- layui css -->
<link href="./resource/layui/css/layui.css" rel="stylesheet" />
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
</head>
<body>

	<!--全部主体内容-->
	<div class="list-content">
		<p class="tip warning">温馨提示：上传视频封面，视频完成后记得点保存按钮哦，视频文件不得大于500MB哦！</p>

		<!--块元素-->
		<div class="block">
			<!--修饰块元素名称-->
			<div class="banner">
				<p class="tab fixed">视频上传</p>
			</div>


			<!--正文内容-->
			<div class="main">
				<form id="form" enctype="multipart/form-data" method="POST">
					<!--文本框-->
					<div class="unit clear">
						<div class="left">
							<p class="subtitle">视频标题</p>
						</div>
						<div class="right">
							<input type="text" class="text" data-type="NONull"
								error-msg="视频标题不能为空" error-pos="42" placeholder="请输入视频标题"  id="vtitle"/>
						</div>
					</div>

					<div class="unit clear">
						<div class="left">
							<p class="subtitle">视频封面</p>
						</div>
						<!-- layui -->
						<div class="layui-upload-drag" id="test10">
							<i class="layui-icon"></i>
							<p>点击上传，或将文件拖拽到此处</p>
						</div>
					</div>

					<div class="unit clear">
						<div class="left">
							<p class="subtitle">选择视频</p>
						</div>
						<div class="right">
							<!-- layui上传视频 -->
							<button type="button" class="layui-btn" id="test5">
								<i class="layui-icon"></i>上传视频
							</button>
							<br />
							
							<!-- 不立即上传版 -->
							<!-- <div class="layui-upload">
							<button type="button" class="layui-btn layui-btn-normal"
								id="test8">选择文件</button>
						</div> -->
						</div>
						<!-- javaex版 -->
						<!-- <div class="right">
							<a href="javascript:;" class="file-container button indigo">
								文件上传 <input type="file" class="file" id="uploadvideo" />
							</a>
						</div> -->
					</div>
					
					<div class="unit clear">
						<div class="left">
							<p class="subtitle">上传进度</p>
						</div>
						<!-- 进度条 -->
						<div class="right">
							<div class="layui-progress layui-progress-big" lay-filter="demo"
								lay-showPercent="true" id="jdt">
								<div class="layui-progress-bar" lay-percent="0%"></div>
							</div>
						</div>
					</div>

					<!--日期选择框-->
					<div class="unit clear">
						<div class="left">
							<p class="subtitle">上传时间</p>
						</div>
						<div class="right">
							<input type="text" id="date3" class="ex-date"
								style="width: 200px;" value="" readonly />
						</div>
					</div>


					<!--提交按钮-->
					<div class="unit clear" style="width: 800px;">
						<div style="text-align: center;">
							<!--表单提交时，必须是input元素，并指定type类型为button，否则ajax提交时，会返回error回调函数-->
							<input type="button" id="return" class="button no" value="返回" />
							<input type="button" id="save" class="button yes" value="保存" />
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
	<!-- layui js -->
	<script src="./resource/layui/layui.all.js"></script>
	<script>
		var J_cover = '';
		var J_video = '';
		var V_date='';
		function EXsuccessful() {
			//提示层成功
			javaex.optTip({
				content : arguments[0],
				type : "success"
			});
		}
		function EXerror() {
			//提示层失败
			javaex.optTip({
				content : arguments[0],
				type : "error"
			});
		}

		layui.use('upload', function() {
			 var $ = layui.jquery,upload = layui.upload, element = layui.element;

			//拖拽上传
			upload.render({
				elem : '#test10',
				url : 'springUpload.do?op=cover',
				done : function(res) {
					if (res.status == 200 && res.data == 'ok') {
						if (res.msg != "" || res.msg != null) {
							J_cover = 200;
						}
						EXsuccessful('上传封面成功');//成功提示
					} else {
						console.log(res.data);
					}
				},
				error : function(e) {
					console.log(e);
					EXerror('封面上传失败');
				}
			});

			/* layui 上传视频 */
			upload.render({
				elem : '#test5',
				url : 'springUpload.do?op=video',
				accept : 'video' //视频
				,
				done : function(res) {
					
					if (res.status == 200 && res.data == 'ok') {
						if (res.msg != "" || res.msg != null) {
							J_video = "200";
						}
						EXsuccessful('上传视频成功');//成功提示
					} else {
						console.log(res.data);
					}
				},
				error : function(e) {
					console.log(e);
					EXerror("视频上传失败,可能是由于视频文件过大导致")
				},
				progress: function(n){
					var percent = n + '%' //获取进度百分比
					element.progress('demo', percent); //可配合 layui 进度条元素使用
	            }
			});

			//选完文件后不自动上传
			/* upload.render({
				elem : '#test8',
				url : 'springUpload.do',
				auto : false,
				bindAction : #test9,
				done : function(res) {
					console.log(res)
				}
			}); */
		});

		//javaex_________________________________________________________________

		javaex.select({
			id : "select",
			isSearch : false
		});

		function getNowFormatDate() {//获取当前时间
			var date = new Date();
			var seperator1 = "-";
			var seperator2 = ":";
			var month = date.getMonth() + 1 < 10 ? "0" + (date.getMonth() + 1)
					: date.getMonth() + 1;
			var strDate = date.getDate() < 10 ? "0" + date.getDate() : date
					.getDate();
			/* var currentdate = date.getFullYear() + seperator1 + month
					+ seperator1 + strDate + " " + date.getHours()
					+ seperator2 + date.getMinutes() + seperator2
					+ date.getSeconds(); */
					var currentdate = date.getFullYear() + seperator1 + month
					+ seperator1 + strDate;
			return currentdate;
		}

		javaex.date({
			id : "date3", // 承载日期组件的id
			type : "yyyy-MM-dd", // 控件类型
			date : getNowFormatDate(), // 选择的日期
			// 重新选择日期之后返回一个时间对象
			callback : function(rtn) {
				V_date=rtn.date;
				//alert(rtn.date);
			}
		});

		javaex.tag({
			id : "tag"
		});

		/* 文件 */
		/* javaex版  */
		/* javaex.upload({
			type : "file",
			url : "springUpload.do", // 请求路径
			id : "uploadvideo", // <input type="file" />的id
			//param : "file", // 参数名称，Spring中与MultipartFile的参数名保持一致
			callback : function(rtn) {
				console.log("回调函数");
				console.log(rtn);
			}
		}); */


		// 监听点击保存按钮事件
		$("#save").click(function() {			
			// 表单验证函数
			if (javaexVerify()) {
				if (J_cover == "" && J_video == "") {
					EXerror('请先上传视频封面和视频');
				} else if (J_video == "") {
					EXerror('请在上传视频');
				} else if (J_cover == "") {
					EXerror('请在上传视频封面');
				} else {
					console.log("验证通过");
					$.ajax({
						type:"POST",
						url:"insertvideo.do",//web.xml中的url-pattern，使用struts改成：命名空间/action_**即可.0
						dataType:"text",//类型
						data:{
							vtitle:$("#vtitle").val(),
							vdate:V_date==''?getNowFormatDate():V_date
						},
						beforeSend:function(XMLHttpRequest){
						//请求之前执行的 方法
							//$("#show").text("loading..");
						},
						success:function(data,textStatus){//data代表servlet返回的数据，随意命名，一般写msg
							if(data==1){
								javaex.message({
									content : "视频添加成功，可在app观看视频",
									type : "success"
								});
							}else{
								javaex.message({
									content : "遇到未知错误，请重新上传",
									type : "error"
								});
							}
							J_cover='';
							J_video='';
							$("#vtitle").val('')
						}
					}); 
				}

			}
		});

		// 监听点击返回按钮事件
		$("#return").click(function() {
			console.log("返回");
			// window.location.href = document.referrer;
		});
	</script>
</body>
</html>
