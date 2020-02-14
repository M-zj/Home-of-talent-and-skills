
<!--textarea高度自适应-->
 $(function () {
        $('.content').flexText();
    });

	<!--textarea限制字数-->
	function keyUP(t){
		/*console.log("我进入了keyup");*/
	    var len = $(t).html().length;
	    /*console.log(len);*/
	    if(len > 50){
	        $(t).html($(t).html().substring(0,50));
	    }
	}




 <!--删除评论块-->
 $('.commentAll').on('click','.removeBlock',function(){
	 var oT = $(this).parents('.date-dz-right').parents('.date-dz').parents('.all-pl-con');
	 if(oT.siblings('.all-pl-con').length >= 1){
		 oT.remove();
	 }else {
		 $(this).parents('.date-dz-right').parents('.date-dz').parents('.all-pl-con').parents('.hf-list-con').css('display','none')
		 oT.remove();
	 }
	 $(this).parents('.date-dz-right').parents('.date-dz').parents('.comment-show-con-list').parents('.comment-show-con').remove();

 })
 /*点赞*/
 $('.comment-show').on('click','.date-dz-z',function(){
	 var zNum = $(this).find('.z-num').html();
	 if($(this).is('.date-dz-z-click')){
		 zNum--;
		 $(this).removeClass('date-dz-z-click red');
		 $(this).find('.z-num').html(zNum);
		 $(this).find('.date-dz-z-click-red').removeClass('red');
	 }else {
		 zNum++;
		 $(this).addClass('date-dz-z-click');
		 $(this).find('.z-num').html(zNum);
		 $(this).find('.date-dz-z-click-red').addClass('red');
	 }
 })







