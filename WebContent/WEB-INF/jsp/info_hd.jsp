<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="myApp">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no, width=device-width">
	<link href="./resource/ionic/ionic.css" rel="stylesheet">
	<script type="text/javascript" src="resource/home/js/comment_js/jquery-1.12.0.min.js"></script>
	<script type="text/javascript" src="resource/home/js/comment_js/jquery.flexText.js"></script>
	<script src="./resource/ionic/ionic.bundle.min.js"></script>
	<link rel="stylesheet" href="resource/layui/css/layui.css">
	<link rel="stylesheet" href="resource/layui/css/layui.mobile.css">
	<link rel="stylesheet" href="resource/home/css/video_is_recommended.css">
	<link rel="stylesheet" href="resource/home/css/comment_css/style.css">
	<link rel="stylesheet" href="resource/home/css/comment_css/comment.css">
	<link rel="stylesheet" href="resource/home/css/comment_css/face.css"/>


	<style type="text/css">
		html,body{
			height:100%;
		}
	</style>
</head>
<body ng-controller="MyCtrl" >
			<div class="commentAll">
				<!--互动区域 begin-->
				<div class="comment-show">
					<div class="comment-show-con clearfix" ng-repeat="n in getuser.slice().reverse()">
						<div class="comment-show-con-img pull-left"><img  src="resource/images/comment_images/user/user_img.jpg" alt=""></div>
						<div class="comment-show-con-list pull-left clearfix">
							<!--创建互动信息-------begin -->
							<div ng-if="n.ustatusid==0">
								<span class="date-dz-left pull-left comment-time">{{n.udate|date:"yyyy-MM-dd HH:mm:ss"}}<span class="zhuanjia_style">专家</span></span>
							</div>
							<div ng-if="n.ustatusid==1">
								<span class="date-dz-left pull-left comment-time">{{n.udate|date:"yyyy-MM-dd HH:mm:ss"}}</span>
							</div>

							<div class="pl-text clearfix">
								<a href="#" class="comment-size-name">{{n.uname}} : </a>
								<span class="my-pl-con"ng-bind-html="n.ucontent">&nbsp;</span>
							</div>
							<div class="date-dz">

								<div class="date-dz-right pull-right comment-pl-block">
									<a href="javascript:;" class="removeBlock">删除</a>
									<a href="javascript:;" class="date-dz-pl hf-con-block pull-left" style="margin-right: 10px;" id="dj_hf" ng-click="dkhfpl(n.uuid)">打开回复</a>
									<a href="javascript:;" class="date-dz-pl pl-hf hf-con-block pull-left" ng-click="hf_pl(n.uuid)">回复</a>
									<span class="pull-left date-dz-line">|</span>
									<a href="javascript:;" class="date-dz-z pull-left"><i class="date-dz-z-click-red"></i>赞 (<i class="z-num">{{n.upraise}}</i>)</a>
								</div>

							</div>
							<!--创建互动信息-------end -->

							<!--创建回复信息-------begin -->
							<div ng-repeat="sel in sel_user.slice().reverse()">
								<div ng-if="n.uuid==sel.uuid">
									<div class="hf-list-con" style="display: block;" >
												<div class="all-pl-con" ng-show="butshow">
													<div ng-if="sel.astatusid==0">
														<span class="date-dz-left pull-left comment-time">{{sel.adate|date:"yyyy-MM-dd HH:mm:ss"}}<span class="zhuanjia_style">专家</span></span>
													</div>
													<div ng-if="sel.astatusid==1">
														<span class="date-dz-left pull-left comment-time">{{sel.adate|date:"yyyy-MM-dd HH:mm:ss"}}</span>
													</div>
													<div class="pl-text hfpl-text clearfix">
														<a href="#" class="comment-size-name">{{sel.aname}} : 回复@{{n.uname}} : </a>
														<span class="my-pl-con"ng-bind-html="sel.acontent"></span>
													</div>
													<div class="date-dz">
														<div class="date-dz-right pull-right comment-pl-block">
															<a href="javascript:;" class="removeBlock" style="margin-left:100px;">删除</a>
															<a href="javascript:;" class="date-dz-z pull-left"><i class="date-dz-z-click-red"></i>赞 (<i class="z-num">{{sel.apraise}}</i>)</a>
														</div>
													</div>
												</div>
										</div>
								</div>
							</div>
							<!--创建回复信息-------end -->
							<div class="hf-list-con"></div>
						</div>
					</div>
				</div>
				<!--回复区域 end-->
				<div class="reviewArea clearfix">

					<div contenteditable="true" class="content comment-input pl-input" placeholder="留下你的精彩评论吧&hellip;" onkeyup="keyUP(this)"></div>
					<!--qq begin-->
					<div id="qq">
						<!-- <div class="message" contentEditable='true'></div> -->
						<div class="But">
							<img  src="resource/images/comment_images/face-ico/bba_thumb.gif" class='bq' />
							<!--face begin-->
							<div class="face">
								<ul>
									<li><img  src="resource/images/comment_images/face-ico/smilea_thumb.gif" title="呵呵]"></li>
									<li><img  src="resource/images/comment_images/face-ico/tootha_thumb.gif" title="嘻嘻]"></li>
									<li><img  src="resource/images/comment_images/face-ico/laugh.gif" title="[哈哈]"></li>
									<li><img  src="resource/images/comment_images/face-ico/tza_thumb.gif" title="[可爱]"></li>
									<li><img  src="resource/images/comment_images/face-ico/kl_thumb.gif" title="[可怜]"></li>
									<li><img  src="resource/images/comment_images/face-ico/kbsa_thumb.gif" title="[挖鼻屎]"></li>
									<li><img  src="resource/images/comment_images/face-ico/cj_thumb.gif" title="[吃惊]"></li>
									<li><img  src="resource/images/comment_images/face-ico/shamea_thumb.gif" title="[害羞]"></li>
									<li><img  src="resource/images/comment_images/face-ico/zy_thumb.gif" title="[挤眼]"></li>
									<li><img  src="resource/images/comment_images/face-ico/bz_thumb.gif" title="[闭嘴]"></li>
									<li><img  src="resource/images/comment_images/face-ico/bs2_thumb.gif" title="[鄙视]"></li>
									<li><img  src="resource/images/comment_images/face-ico/lovea_thumb.gif" title="[爱你]"></li>
									<li><img  src="resource/images/comment_images/face-ico/sada_thumb.gif" title="[泪]"></li>
									<li><img  src="resource/images/comment_images/face-ico/heia_thumb.gif" title="[偷笑]"></li>
									<li><img  src="resource/images/comment_images/face-ico/qq_thumb.gif" title="[亲亲]"></li>
									<li><img  src="resource/images/comment_images/face-ico/sb_thumb.gif" title="[生病]"></li>
									<li><img  src="resource/images/comment_images/face-ico/mb_thumb.gif" title="[太开心]"></li>
									<li><img  src="resource/images/comment_images/face-ico/ldln_thumb.gif" title="[懒得理你]"></li>
									<li><img  src="resource/images/comment_images/face-ico/yhh_thumb.gif" title="[右哼哼]"></li>
									<li><img  src="resource/images/comment_images/face-ico/zhh_thumb.gif" title="[左哼哼]"></li>
									<li><img  src="resource/images/comment_images/face-ico/x_thumb.gif" title="[嘘]"></li>
									<li><img  src="resource/images/comment_images/face-ico/cry.gif" title="[衰]"></li>
									<li><img  src="resource/images/comment_images/face-ico/wq_thumb.gif" title="[委屈]"></li>
									<li><img  src="resource/images/comment_images/face-ico/t_thumb.gif" title="[吐]"></li>
									<li><img  src="resource/images/comment_images/face-ico/k_thumb.gif" title="[打哈气]"></li>
									<li><img  src="resource/images/comment_images/face-ico/bba_thumb.gif" title="[抱抱]"></li>
									<li><img  src="resource/images/comment_images/face-ico/angrya_thumb.gif" title="[怒]"></li>
									<li><img  src="resource/images/comment_images/face-ico/yw_thumb.gif" title="[疑问]"></li>
									<li><img  src="resource/images/comment_images/face-ico/cza_thumb.gif" title="[馋嘴]"></li>
									<li><img  src="resource/images/comment_images/face-ico/88_thumb.gif" title="[拜拜]"></li>
									<li><img  src="resource/images/comment_images/face-ico/sk_thumb.gif" title="[思考]"></li>
									<li><img  src="resource/images/comment_images/face-ico/sweata_thumb.gif" title="[汗]"></li>
									<li><img  src="resource/images/comment_images/face-ico/sleepya_thumb.gif" title="[困]"></li>
									<li><img  src="resource/images/comment_images/face-ico/sleepa_thumb.gif" title="[睡觉]"></li>
									<li><img  src="resource/images/comment_images/face-ico/money_thumb.gif" title="[钱]"></li>
									<li><img  src="resource/images/comment_images/face-ico/sw_thumb.gif" title="[失望]"></li>
									<li><img  src="resource/images/comment_images/face-ico/cool_thumb.gif" title="[酷]"></li>
									<li><img  src="resource/images/comment_images/face-ico/hsa_thumb.gif" title="[花心]"></li>
									<li><img  src="resource/images/comment_images/face-ico/hatea_thumb.gif" title="[哼]"></li>
									<li><img  src="resource/images/comment_images/face-ico/gza_thumb.gif" title="[鼓掌]"></li>
									<li><img  src="resource/images/comment_images/face-ico/dizzya_thumb.gif" title="[晕]"></li>
									<li><img  src="resource/images/comment_images/face-ico/bs_thumb.gif" title="[悲伤]"></li>
									<li><img  src="resource/images/comment_images/face-ico/crazya_thumb.gif" title="[抓狂]"></li>
									<li><img  src="resource/images/comment_images/face-ico/h_thumb.gif" title="[黑线]"></li>
									<li><img  src="resource/images/comment_images/face-ico/yx_thumb.gif" title="[阴险]"></li>
									<li><img  src="resource/images/comment_images/face-ico/nm_thumb.gif" title="[怒骂]"></li>
									<li><img  src="resource/images/comment_images/face-ico/hearta_thumb.gif" title="[心]"></li>
									<li><img  src="resource/images/comment_images/face-ico/unheart.gif" title="[伤心]"></li>
									<li><img  src="resource/images/comment_images/face-ico/pig.gif" title="[猪头]"></li>
									<li><img  src="resource/images/comment_images/face-ico/ok_thumb.gif" title="[ok]"></li>
									<li><img  src="resource/images/comment_images/face-ico/ye_thumb.gif" title="[耶]"></li>
									<li><img  src="resource/images/comment_images/face-ico/good_thumb.gif" title="[good]"></li>
									<li><img  src="resource/images/comment_images/face-ico/no_thumb.gif" title="[不要]"></li>
									<li><img  src="resource/images/comment_images/face-ico/z2_thumb.gif" title="[赞]"></li>
									<li><img  src="resource/images/comment_images/face-ico/come_thumb.gif" title="[来]"></li>
									<li><img  src="resource/images/comment_images/face-ico/sad_thumb.gif" title="[弱]"></li>
									<li><img  src="resource/images/comment_images/face-ico/lazu_thumb.gif" title="[蜡烛]"></li>
									<li><img  src="resource/images/comment_images/face-ico/clock_thumb.gif" title="[钟]"></li>
									<li><img  src="resource/images/comment_images/face-ico/cake.gif" title="[蛋糕]"></li>
									<li><img  src="resource/images/comment_images/face-ico/m_thumb.gif" title="[话筒]"></li>
									<li><img  src="resource/images/comment_images/face-ico/weijin_thumb.gif" title="[围脖]"></li>
									<li><img  src="resource/images/comment_images/face-ico/lxhzhuanfa_thumb.gif" title="[转发]"></li>
									<li><img  src="resource/images/comment_images/face-ico/lxhluguo_thumb.gif" title="[路过这儿]"></li>
									<li><img  src="resource/images/comment_images/face-ico/bofubianlian_thumb.gif" title="[bofu变脸]"></li>
									<li><img  src="resource/images/comment_images/face-ico/gbzkun_thumb.gif" title="[gbz困]"></li>
									<li><img  src="resource/images/comment_images/face-ico/boboshengmenqi_thumb.gif" title="[生闷气]"></li>
									<li><img  src="resource/images/comment_images/face-ico/chn_buyaoya_thumb.gif" title="[不要啊]"></li>
									<li><img  src="resource/images/comment_images/face-ico/daxiongleibenxiong_thumb.gif" title="[dx泪奔]"></li>
									<li><img  src="resource/images/comment_images/face-ico/cat_yunqizhong_thumb.gif" title="[运气中]"></li>
									<li><img  src="resource/images/comment_images/face-ico/youqian_thumb.gif" title="[有钱]"></li>
								</ul>
							</div>
							<!--face end-->
						</div>

					</div>
					<!--qq end-->
					<a href="javascript:;" class="plBtn">评论</a>
				</div>
				<!--互动区域 end-->
			</div>
<script src="resource/layui/layui.js"></script>
<script>
	var uuid;
	var app = angular.module('myApp', ['ionic']);
	app.controller('MyCtrl', function($scope,$http) {

		<!-- 查询用户互动信息方法----begin -->
		var selecthudong=function () {
			$http({
				method:"post",
				url:"get_user_interaction_pc.do",
			}).success(
					function (e) {
						console.log("查询用户互动信息----begin");
						console.log(e);
						console.log("查询用户互动信息----end");
						$scope.getuser=e.data;
					}
			);
		};
		<!-- 查询用户互动信息方法----end -->

		/*查询用户互动信息*/
		setTimeout(selecthudong,100);
		/*查询专家视频推荐*/

		<!-- 每隔十秒查询互动信息----begin -->
 		var sel_hd= setInterval(selecthudong,5000); 
		<!-- 每隔十秒查询互动信息----end -->

		<!--点击回复动态创建回复块-->
		$('.comment-show').on('click','.pl-hf',function(){
			//var faceico='<!--qq begin--><div id="qq"><div class="But"><img src="./resource/images/comment_images/face-ico/bba_thumb.gif" class="hf_bq"  onload="hf_bq(this);" /><!--face begin--><div class="hf_face" onload="getioc(this)"><ul><li><img  src="./resource/images/comment_images/face-ico/smilea_thumb.gif" title="呵呵]"></li><li><img  src="./resource/images/comment_images/face-ico/tootha_thumb.gif" title="嘻嘻]"></li><li><img  src="./resource/images/comment_images/face-ico/laugh.gif" title="[哈哈]"></li><li><img  src="./resource/images/comment_images/face-ico/tza_thumb.gif" title="[可爱]"></li><li><img  src="./resource/images/comment_images/face-ico/kl_thumb.gif" title="[可怜]"></li><li><img  src="./resource/images/comment_images/face-ico/kbsa_thumb.gif" title="[挖鼻屎]"></li><li><img  src="./resource/images/comment_images/face-ico/cj_thumb.gif" title="[吃惊]"></li><li><img  src="./resource/images/comment_images/face-ico/shamea_thumb.gif" title="[害羞]"></li><li><img  src="./resource/images/comment_images/face-ico/zy_thumb.gif" title="[挤眼]"></li><li><img  src="./resource/images/comment_images/face-ico/bz_thumb.gif" title="[闭嘴]"></li><li><img  src="./resource/images/comment_images/face-ico/bs2_thumb.gif" title="[鄙视]"></li><li><img  src="./resource/images/comment_images/face-ico/lovea_thumb.gif" title="[爱你]"></li><li><img  src="./resource/images/comment_images/face-ico/sada_thumb.gif" title="[泪]"></li><li><img  src="./resource/images/comment_images/face-ico/heia_thumb.gif" title="[偷笑]"></li><li><img  src="./resource/images/comment_images/face-ico/qq_thumb.gif" title="[亲亲]"></li><li><img  src="./resource/images/comment_images/face-ico/sb_thumb.gif" title="[生病]"></li><li><img  src="./resource/images/comment_images/face-ico/mb_thumb.gif" title="[太开心]"></li><li><img  src="./resource/images/comment_images/face-ico/ldln_thumb.gif" title="[懒得理你]"></li><li><img  src="./resource/images/comment_images/face-ico/yhh_thumb.gif" title="[右哼哼]"></li><li><img  src="./resource/images/comment_images/face-ico/zhh_thumb.gif" title="[左哼哼]"></li><li><img  src="./resource/images/comment_images/face-ico/x_thumb.gif" title="[嘘]"></li><li><img  src="./resource/images/comment_images/face-ico/cry.gif" title="[衰]"></li><li><img  src="./resource/images/comment_images/face-ico/wq_thumb.gif" title="[委屈]"></li><li><img  src="./resource/images/comment_images/face-ico/t_thumb.gif" title="[吐]"></li><li><img  src="./resource/images/comment_images/face-ico/k_thumb.gif" title="[打哈气]"></li><li><img  src="./resource/images/comment_images/face-ico/bba_thumb.gif" title="[抱抱]"></li><li><img  src="./resource/images/comment_images/face-ico/angrya_thumb.gif" title="[怒]"></li><li><img  src="./resource/images/comment_images/face-ico/yw_thumb.gif" title="[疑问]"></li><li><img  src="./resource/images/comment_images/face-ico/cza_thumb.gif" title="[馋嘴]"></li><li><img  src="./resource/images/comment_images/face-ico/88_thumb.gif" title="[拜拜]"></li><li><img  src="./resource/images/comment_images/face-ico/sk_thumb.gif" title="[思考]"></li><li><img  src="./resource/images/comment_images/face-ico/sweata_thumb.gif" title="[汗]"></li><li><img  src="./resource/images/comment_images/face-ico/sleepya_thumb.gif" title="[困]"></li><li><img  src="./resource/images/comment_images/face-ico/sleepa_thumb.gif" title="[睡觉]"></li><li><img  src="./resource/images/comment_images/face-ico/money_thumb.gif" title="[钱]"></li><li><img  src="./resource/images/comment_images/face-ico/sw_thumb.gif" title="[失望]"></li><li><img  src="./resource/images/comment_images/face-ico/cool_thumb.gif" title="[酷]"></li><li><img  src="./resource/images/comment_images/face-ico/hsa_thumb.gif" title="[花心]"></li><li><img  src="./resource/images/comment_images/face-ico/hatea_thumb.gif" title="[哼]"></li><li><img  src="./resource/images/comment_images/face-ico/gza_thumb.gif" title="[鼓掌]"></li><li><img  src="./resource/images/comment_images/face-ico/dizzya_thumb.gif" title="[晕]"></li><li><img  src="./resource/images/comment_images/face-ico/bs_thumb.gif" title="[悲伤]"></li><li><img  src="./resource/images/comment_images/face-ico/crazya_thumb.gif" title="[抓狂]"></li><li><img  src="./resource/images/comment_images/face-ico/h_thumb.gif" title="[黑线]"></li><li><img  src="./resource/images/comment_images/face-ico/yx_thumb.gif" title="[阴险]"></li><li><img  src="./resource/images/comment_images/face-ico/nm_thumb.gif" title="[怒骂]"></li><li><img  src="./resource/images/comment_images/face-ico/hearta_thumb.gif" title="[心]"></li><li><img  src="./resource/images/comment_images/face-ico/unheart.gif" title="[伤心]"></li><li><img  src="./resource/images/comment_images/face-ico/pig.gif" title="[猪头]"></li><li><img  src="./resource/images/comment_images/face-ico/ok_thumb.gif" title="[ok]"></li><li><img  src="./resource/images/comment_images/face-ico/ye_thumb.gif" title="[耶]"></li><li><img  src="./resource/images/comment_images/face-ico/good_thumb.gif" title="[good]"></li><li><img  src="./resource/images/comment_images/face-ico/no_thumb.gif" title="[不要]"></li><li><img  src="./resource/images/comment_images/face-ico/z2_thumb.gif" title="[赞]"></li><li><img  src="./resource/images/comment_images/face-ico/come_thumb.gif" title="[来]"></li><li><img  src="./resource/images/comment_images/face-ico/sad_thumb.gif" title="[弱]"></li><li><img  src="./resource/images/comment_images/face-ico/lazu_thumb.gif" title="[蜡烛]"></li><li><img  src="./resource/images/comment_images/face-ico/clock_thumb.gif" title="[钟]"></li><li><img  src="./resource/images/comment_images/face-ico/cake.gif" title="[蛋糕]"></li><li><img  src="./resource/images/comment_images/face-ico/m_thumb.gif" title="[话筒]"></li><li><img  src="./resource/images/comment_images/face-ico/weijin_thumb.gif" title="[围脖]"></li><li><img  src="./resource/images/comment_images/face-ico/lxhzhuanfa_thumb.gif" title="[转发]"></li><li><img  src="./resource/images/comment_images/face-ico/lxhluguo_thumb.gif" title="[路过这儿]"></li><li><img  src="./resource/images/comment_images/face-ico/bofubianlian_thumb.gif" title="[bofu变脸]"></li><li><img  src="./resource/images/comment_images/face-ico/gbzkun_thumb.gif" title="[gbz困]"></li><li><img  src="./resource/images/comment_images/face-ico/boboshengmenqi_thumb.gif" title="[生闷气]"></li><li><img  src="./resource/images/comment_images/face-ico/chn_buyaoya_thumb.gif" title="[不要啊]"></li><li><img  src="./resource/images/comment_images/face-ico/daxiongleibenxiong_thumb.gif" title="[dx泪奔]"></li><li><img  src="./resource/images/comment_images/face-ico/cat_yunqizhong_thumb.gif" title="[运气中]"></li><li><img  src="./resource/images/comment_images/face-ico/youqian_thumb.gif" title="[有钱]"></li></ul></div><!--face end--></div></div><!--qq end-->';
			var faceico='<!--qq begin--><div id="qq"><div class="But"><img src="./resource/images/comment_images/face-ico/bba_thumb.gif" class="hf_bq" /><!--face begin--><div class="hf_face"><ul><li><img src="./resource/images/comment_images/face-ico/smilea_thumb.gif" title="呵呵]"></li><li><img src="./resource/images/comment_images/face-ico/tootha_thumb.gif" title="嘻嘻]"></li><li><img src="./resource/images/comment_images/face-ico/laugh.gif" title="[哈哈]"></li><li><img src="./resource/images/comment_images/face-ico/tza_thumb.gif" title="[可爱]"></li><li><img src="./resource/images/comment_images/face-ico/kl_thumb.gif" title="[可怜]"></li><li><img src="./resource/images/comment_images/face-ico/kbsa_thumb.gif" title="[挖鼻屎]"></li><li><img src="./resource/images/comment_images/face-ico/cj_thumb.gif" title="[吃惊]"></li><li><img src="./resource/images/comment_images/face-ico/shamea_thumb.gif" title="[害羞]"></li><li><img src="./resource/images/comment_images/face-ico/zy_thumb.gif" title="[挤眼]"></li><li><img src="./resource/images/comment_images/face-ico/bz_thumb.gif" title="[闭嘴]"></li><li><img src="./resource/images/comment_images/face-ico/bs2_thumb.gif" title="[鄙视]"></li><li><img src="./resource/images/comment_images/face-ico/lovea_thumb.gif" title="[爱你]"></li><li><img src="./resource/images/comment_images/face-ico/sada_thumb.gif" title="[泪]"></li><li><img src="./resource/images/comment_images/face-ico/heia_thumb.gif" title="[偷笑]"></li><li><img src="./resource/images/comment_images/face-ico/qq_thumb.gif" title="[亲亲]"></li><li><img src="./resource/images/comment_images/face-ico/sb_thumb.gif" title="[生病]"></li><li><img src="./resource/images/comment_images/face-ico/mb_thumb.gif" title="[太开心]"></li><li><img src="./resource/images/comment_images/face-ico/ldln_thumb.gif" title="[懒得理你]"></li><li><img src="./resource/images/comment_images/face-ico/yhh_thumb.gif" title="[右哼哼]"></li><li><img src="./resource/images/comment_images/face-ico/zhh_thumb.gif" title="[左哼哼]"></li><li><img src="./resource/images/comment_images/face-ico/x_thumb.gif" title="[嘘]"></li><li><img src="./resource/images/comment_images/face-ico/cry.gif" title="[衰]"></li><li><img src="./resource/images/comment_images/face-ico/wq_thumb.gif" title="[委屈]"></li><li><img src="./resource/images/comment_images/face-ico/t_thumb.gif" title="[吐]"></li><li><img src="./resource/images/comment_images/face-ico/k_thumb.gif" title="[打哈气]"></li><li><img src="./resource/images/comment_images/face-ico/bba_thumb.gif" title="[抱抱]"></li><li><img src="./resource/images/comment_images/face-ico/angrya_thumb.gif" title="[怒]"></li><li><img src="./resource/images/comment_images/face-ico/yw_thumb.gif" title="[疑问]"></li><li><img src="./resource/images/comment_images/face-ico/cza_thumb.gif" title="[馋嘴]"></li><li><img src="./resource/images/comment_images/face-ico/88_thumb.gif" title="[拜拜]"></li><li><img src="./resource/images/comment_images/face-ico/sk_thumb.gif" title="[思考]"></li><li><img src="./resource/images/comment_images/face-ico/sweata_thumb.gif" title="[汗]"></li><li><img src="./resource/images/comment_images/face-ico/sleepya_thumb.gif" title="[困]"></li><li><img src="./resource/images/comment_images/face-ico/sleepa_thumb.gif" title="[睡觉]"></li><li><img src="./resource/images/comment_images/face-ico/money_thumb.gif" title="[钱]"></li><li><img src="./resource/images/comment_images/face-ico/sw_thumb.gif" title="[失望]"></li><li><img src="./resource/images/comment_images/face-ico/cool_thumb.gif" title="[酷]"></li><li><img src="./resource/images/comment_images/face-ico/hsa_thumb.gif" title="[花心]"></li><li><img src="./resource/images/comment_images/face-ico/hatea_thumb.gif" title="[哼]"></li><li><img src="./resource/images/comment_images/face-ico/gza_thumb.gif" title="[鼓掌]"></li><li><img src="./resource/images/comment_images/face-ico/dizzya_thumb.gif" title="[晕]"></li><li><img src="./resource/images/comment_images/face-ico/bs_thumb.gif" title="[悲伤]"></li><li><img src="./resource/images/comment_images/face-ico/crazya_thumb.gif" title="[抓狂]"></li><li><img src="./resource/images/comment_images/face-ico/h_thumb.gif" title="[黑线]"></li><li><img src="./resource/images/comment_images/face-ico/yx_thumb.gif" title="[阴险]"></li><li><img src="./resource/images/comment_images/face-ico/nm_thumb.gif" title="[怒骂]"></li><li><img src="./resource/images/comment_images/face-ico/hearta_thumb.gif" title="[心]"></li><li><img src="./resource/images/comment_images/face-ico/unheart.gif" title="[伤心]"></li><li><img src="./resource/images/comment_images/face-ico/pig.gif" title="[猪头]"></li><li><img src="./resource/images/comment_images/face-ico/ok_thumb.gif" title="[ok]"></li><li><img src="./resource/images/comment_images/face-ico/ye_thumb.gif" title="[耶]"></li><li><img src="./resource/images/comment_images/face-ico/good_thumb.gif" title="[good]"></li><li><img src="./resource/images/comment_images/face-ico/no_thumb.gif" title="[不要]"></li><li><img src="./resource/images/comment_images/face-ico/z2_thumb.gif" title="[赞]"></li><li><img src="./resource/images/comment_images/face-ico/come_thumb.gif" title="[来]"></li><li><img src="./resource/images/comment_images/face-ico/sad_thumb.gif" title="[弱]"></li><li><img src="./resource/images/comment_images/face-ico/lazu_thumb.gif" title="[蜡烛]"></li><li><img src="./resource/images/comment_images/face-ico/clock_thumb.gif" title="[钟]"></li><li><img src="./resource/images/comment_images/face-ico/cake.gif" title="[蛋糕]"></li><li><img src="./resource/images/comment_images/face-ico/m_thumb.gif" title="[话筒]"></li><li><img src="./resource/images/comment_images/face-ico/weijin_thumb.gif" title="[围脖]"></li><li><img src="./resource/images/comment_images/face-ico/lxhzhuanfa_thumb.gif" title="[转发]"></li><li><img src="./resource/images/comment_images/face-ico/lxhluguo_thumb.gif" title="[路过这儿]"></li><li><img src="./resource/images/comment_images/face-ico/bofubianlian_thumb.gif" title="[bofu变脸]"></li><li><img src="./resource/images/comment_images/face-ico/gbzkun_thumb.gif" title="[gbz困]"></li><li><img src="./resource/images/comment_images/face-ico/boboshengmenqi_thumb.gif" title="[生闷气]"></li><li><img src="./resource/images/comment_images/face-ico/chn_buyaoya_thumb.gif" title="[不要啊]"></li><li><img src="./resource/images/comment_images/face-ico/daxiongleibenxiong_thumb.gif" title="[dx泪奔]"></li><li><img src="./resource/images/comment_images/face-ico/cat_yunqizhong_thumb.gif" title="[运气中]"></li><li><img src="./resource/images/comment_images/face-ico/youqian_thumb.gif" title="[有钱]"></li></ul></div><!--face end--></div></div><!--qq end-->';
			//获取回复人的名字
			var fhName = $(this).parents('.date-dz-right').parents('.date-dz').siblings('.pl-text').find('.comment-size-name').html();
			//回复@
			var fhN = '回复@'+fhName;
			//var oInput = $(this).parents('.date-dz-right').parents('.date-dz').siblings('.hf-con');
			var fhHtml = '<div class="hf-con pull-left"> <div contenteditable="true" class="content comment-input hf_input" placeholder="" onkeyup="keyUP(this)"></div> '+faceico+' <a href="javascript:;"  class="hf-pl">评论</a></div>';

			var hfid="";

			if($(this).is('.hf-con-block')){
				console.log("回复框打开咯..");
				$(this).parents('.date-dz-right').parents('.date-dz').append(fhHtml);

				//显示回复 开始
				//回复点击小图片，显示表情
				$(".hf_bq").click(function (e) {
					console.log("回复表情打开了..")
					$(".hf_face").slideDown(); //慢慢向下展开
					e.stopPropagation(); //阻止冒泡事件
				});

				//回复在桌面任意地方点击，关闭表情框
				$(document).click(function () {
					$(".hf_face").slideUp(); //慢慢向上收
				});

				//回复点击小图标时，添加功能
				$(".hf_face ul li").click(function () {
					let simg = $(this).find("img").clone();
					console.log(simg);
					$(".hf_input").append(simg); //将表情添加到输入框
				});
				//显示回复 结束

				$(this).removeClass('hf-con-block');
				$('.content').flexText();
				$(this).parents('.date-dz-right').siblings('.hf-con').find('.pre').css('padding','6px 15px');
				//console.log($(this).parents('.date-dz-right').siblings('.hf-con').find('.pre'))
				//input框自动聚焦
				//$(this).parents('.date-dz-right').siblings('.hf-con').find('.hf-input').val('').focus().html(fhN);
			} else {
				console.log("回复框关闭咯..");
				$(this).addClass('hf-con-block');
				$(this).parents('.date-dz-right').siblings('.hf-con').remove();
			}
		});

		<!-- ----------- 向用户互动传入数据 begin ----------- -->
		<!--点击评论创建评论条-->
		$('.commentAll').on('click','.plBtn',function(){
			console.log("发表评论");
			var myDate = new Date();
			//获取当前年
			var year=myDate.getFullYear();
			//获取当前月
			var month=myDate.getMonth()+1;
			//获取当前日
			var date=myDate.getDate();
			var h=myDate.getHours();       //获取当前小时数(0-23)
			var m=myDate.getMinutes();     //获取当前分钟数(0-59)
			if(m<10) m = '0' + m;
			var s=myDate.getSeconds();
			if(s<10) s = '0' + s;
			var now=year+'-'+month+"-"+date+" "+h+':'+m+":"+s;
			//获取输入内容
			/* var oSize = $(this).siblings('.flex-text-wrap').find('.comment-input').html(); */
			var oSize = $('.pl-input').html();
			/*console.log("评论了:"+oSize);*/
			//动态创建评论模块

			if(oSize.replace(/(^\s*)|(\s*$)/g, "") != ''){
				/*$(this).parents('.reviewArea ').siblings('.comment-show').prepend(oHtml);*/
				$(this).siblings('.flex-text-wrap').find('.pl-input').prop('value','').siblings('pre').find('span').text('');
				$('.pl-input').html("");
			}
			<!-- ----------- 向用户互动传入数据 begin----------- -->
			var user_name="权威专家"; //用户名称
			var num=66;  //点几个数
			var ustatusid=0;  //身份编号
			/*        console.log("内容："+oSize);
                    console.log("点赞个数："+num);
                    console.log("用户ID："+user_id);
                    console.log("用户姓名："+user_name);*/
			$http({
				method: "POST",
				url:"user_interaction_pc.do",
				data: {
					user_name: user_name,
					user_num:num,
					user_content:oSize,
					ustatusid:ustatusid
				}
			}).success(
					function (e) {
						// 请求成功执行代码
						console.log(e);
					}
			);
			/*查询用户互动信息*/
			setTimeout(selecthudong,1000);

		});


		<!-- ----------- 向用户互动传入数据 end----------- -->


		<!-- ----------- 回复用户信息数据 begin----------- -->

		$('.comment-show').on('click','.hf-pl',function(){
			var oThis = $(this);
			var myDate = new Date();
			//获取当前年
			var year=myDate.getFullYear();
			//获取当前月
			var month=myDate.getMonth()+1;
			//获取当前日
			var date=myDate.getDate();
			var h=myDate.getHours();       //获取当前小时数(0-23)
			var m=myDate.getMinutes();     //获取当前分钟数(0-59)
			if(m<10) m = '0' + m;
			var s=myDate.getSeconds();
			if(s<10) s = '0' + s;
			var now=year+'-'+month+"-"+date+" "+h+':'+m+":"+s;
			//获取输入内容
			/* var oHfVal = $(this).siblings('.flex-text-wrap').find('.hf-input').html(); */
			var oHfVal = $('.hf_input').html();
			console.log("我进入了回复用户信息数据");
			var oHfName = $(this).parents('.hf-con').parents('.date-dz').siblings('.pl-text').find('.comment-size-name').html();
			var oAllVal = '回复@'+oHfName;
			if(oHfVal.replace(/^ +| +$/g,'') == '' || oHfVal == oAllVal){
			}else {
				jQuery.support.cors = true;
				var data={};
				var oAt = '';
				var oHf = '';
				var arr;
				var ohfNameArr;
				if(oHfVal.indexOf("@") == -1){
					data['atName'] = '';
					data['hfContent'] = oHfVal;
				}else {
					arr = oHfVal.split(':');
					ohfNameArr = arr[0].split('@');
					data['hfContent'] = arr[1];
					data['atName'] = ohfNameArr[1];
				}
				if(data.atName == ''){
					oAt = data.hfContent;
				}else {
					oAt = '回复<a href="#" class="atName">@'+data.atName+'</a> : '+data.hfContent;
				}
				oHf = data.hfName;

				oThis.parents('.hf-con').parents('.comment-show-con-list').find('.hf-list-con').css('display','block').prepend() && oThis.parents('.hf-con').siblings('.date-dz-right').find('.pl-hf').addClass('hf-con-block') && oThis.parents('.hf-con').remove();
			}
			/*添加用户回复信息*/
			var aname="权威专家";
			var ustatusid=0;  //身份编号
			var apraise=12; //点赞个数
			console.log("ucontent:"+oHfVal);
			$http({
			method:"post",
			url:"reply_user_pc.do",
			data:{
				ucontent:oHfVal,
				time:now,
				uuid:uuid,
				aname:aname,
				ustatusid:ustatusid,
				apraise:apraise
				}
		}).success(
				function (e) {
					console.log(e);
				}
		);
			if(hd_stop){
				clearInterval(sel_hd);
			}
			else{
				sel_hd=setInterval(selecthudong,5000);
			}
			hd_stop = !(hd_stop);
});
		<!-- ----------- 回复户信息数据 end----------- -->

		//显示隐藏回复框
		$scope.butshow = false;
		$scope.dkhfpl=function (e) {
			console.log(e);
			uuid=e;
			/*查询用户回复信息*/
			$http.get("sel_user_pc.do?uuid="+uuid).success(function(e){
				console.log("回复用户内容---begin")
				console.log(e);
				console.log("回复用户内容---end")
				$scope.sel_user=e.data;
			});
			$scope.butshow = !($scope.butshow);
		}

		<!-- 点击回复传值函数 -->
		var hd_stop = true;
		$scope.hf_pl=function(e) {
			console.log(e);
			uuid=e;
			console.log(hd_stop);
			if(hd_stop){
				clearInterval(sel_hd);
			}
			else{
				sel_hd=setInterval(selecthudong,5000);
			}
			hd_stop = !(hd_stop);
		}
	});

</script>
<script type="text/javascript" src="resource/home/js/comment_js/face-ioc-function.js"></script>
<script type="text/javascript" src="resource/home/js/comment_js/function-realization.js"></script>

</body>
</html>
