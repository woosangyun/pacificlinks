// JavaScript Document

$(function(){
	
	
	$(window).scroll(function(){

		var st = $(window).scrollTop();
		
		if(st > 0){
			$("header").addClass("on");
		}else{
			$("header").removeClass("on");
		}
		
	});
    
    
    ////////////////////     Visual     ////////////////////
    
    var speed = 5000;
    
    var idx = setInterval(visualNum, speed);
    
    var num = 0;
    
    var total = $(".visual .item").length;
    
    function visualNum(){
        
        if(num < total-1){
            num++;
        }else{
            num=0;
        }
        
        visualTrans();
    }
    
    function visualTrans(){
        $(".visual .item").removeClass("on");
        $(".visual .item").eq(num).addClass("on");
        $(".visual .ui li").removeClass("on");
        $(".visual .ui li").eq(num).addClass("on");
    }
    
    $(".ui li").click(function(e){
        
       var _current = $(this).index();
        
        if(num !== _current){
            num = _current;

            clearInterval(idx);
            idx = setInterval(visualNum, speed);
            visualTrans();   
        }
        
        e.preventDefault();
        
    });
    
    
	
	////////////////////     Contents Animation     ////////////////////
	
	AOS.init({
		easing: 'ease-in-sine'
	});
	
});
