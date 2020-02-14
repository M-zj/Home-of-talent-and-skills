var brightness;


//显示遮罩
function cover(brightness) {
	
    if (typeof(div) == 'undefined') {
        div = document.createElement('div');
        div.setAttribute('style', 'position:fixed;top:0;left:0;outline:5000px solid;z-index:99999;');
        document.body.appendChild(div);
    } else {
        div.style.display = '';
    }
    div.style.outlineColor = 'rgba(0,0,0,' + brightness + ')';
}

$("#yj").click(function(){

    if(this.checked==true){
        cover(brightness = 0.3);//夜间模式
    }
    else{
        cover(brightness = 0);
    }
});

