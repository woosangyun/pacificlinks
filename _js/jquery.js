// JavaScript Document


////////////////////     BROWSER POPUP      ////////////////////
	
function openWin(url, width, height){
	window.open(url, "", "width="+width+", height="+height+", toolbar=no, menubar=no, scrollbars=yes, resizable=no" );
} 

$(function(){
	
	
	////////////////////     SKIP NAVI     ////////////////////
	
	/*   SKIP NAVI 로드   */
	$("#skip-nav").load('../_inc/skip.html');
	
	
	
	////////////////////     HEADER     ////////////////////
	
	/*   HEADER 로드   */
	$("header").load('../_inc/gnb.html',function(){
		LNBinit();
		makeMobileMenu();
		makeSitemap();
	});
	/*     WEB     */
	$(document).on("mouseover","header .mobile-hide #gnb>li>a",function(){
		
		$("header .mobile-hide #gnb>li ul").hide();
		$("header .mobile-hide #gnb>li").removeClass("on");
		$(this).closest("li").addClass("on");
		$(this).next("ul").show();
		
	});
	
	$(document).on("mouseleave","header",function(){
		
		$("header .mobile-hide #gnb>li").removeClass("on");
		$("header .mobile-hide #gnb>li ul").hide();
		
	});
	
	$(document).on("click","header .mobile-menu",function(){
		
		if($(".mobile-menu").hasClass("on")){
			$(".mobile-menu").removeClass("on");
			$("header .mobile-only #gnb").stop().slideUp(500,"easeInOutExpo");
		}else{
			$(".mobile-menu").addClass("on");
			$("header .mobile-only #gnb").stop().slideDown(500,"easeInOutExpo");
		}
		
	});
	
	$(document).on("click","header .util .sitemap",function(){
		
		$("header .sitemap-wrap").addClass("on");
		
	});
	
	$(document).on("click","header .sitemap-wrap .close-sitemap",function(){
		
		$("header .sitemap-wrap").removeClass("on");
		
	});
	
	function makeSitemap(){
		var gnb = $("#gnb").clone();
		$("header .sitemap-wrap .wrap").append(gnb);
	}
	
	
	function makeMobileMenu(){
		var gnb = $("#gnb").clone();
		$("header .mobile-only .container").append(gnb);
	}
	
	
	////////////////////     MOBILE MENU     ////////////////////
	
	
	var mobileMenu = ".mobile-only #gnb li a"  //   메뉴 클릭영역
		
	$(document).on("click",mobileMenu,function(){
			
		var self = this;

		//현재 선택된 메뉴의 하위메뉴 의 열림,닫힘 상태를 변수에 담는다.
		var openLength = $(this).closest("ul").find("li ul[style*='block']").length;
		var open = $(this).closest("ul").find("li ul[style*='block']");
		var displayCondition = $(this).next().css("display");

		//클릭한 버튼에 하위 메뉴가 있고 slide 이벤트가 완료가 되었다면 (더블 클릭 방지)
		if($(this).next().is("ul") == true){

			if( openLength > 0 && displayCondition=="none"){  // 클릭한 메뉴의 하위메뉴는 닫혀있고 다른 메뉴가 열려있을때
				open.slideUp(500,'easeInOutExpo',function(){
					$(".mobile-only #gnb a[class^='on']").removeClass("on");
					$(self).addClass("on");	
					$(self).parents("ul").siblings("a").addClass("on");
					$(self).next().slideDown(500,'easeInOutExpo');
					
				});
				return false;

			}else if( openLength > 0 && displayCondition=="block"){  // 클릭한 메뉴의 하위메뉴가 열려있을때
				open.slideUp(500,'easeInOutExpo',function(){
					open.prev().removeClass("on");
				});
				return false; 

			}else if( openLength == 0 && displayCondition=="none" ){  // 아무런 메뉴도 열리지 않았을때
				$(".mobile-only #gnb a[class^='on']").removeClass("on");
				$(self).addClass("on");	
				$(self).parents("ul").siblings("a").addClass("on");
				$(self).next().slideDown(500,'easeInOutExpo');
				return false;	
			}

		}else{

			open.slideUp(500,'easeInOutExpo');
			$(".mobile-only #gnb a[class^='on']").removeClass("on");
			$(self).addClass("on");	
			$(self).parents("ul").siblings("a").addClass("on");

		}
	}); //메뉴 버튼 클릭 이벤트 END	
	
	
	
	////////////////////     FOOTER     ////////////////////
	
	/*   FOOTER 로드   */
	$("footer").load('../_inc/footer.html');
	
	////////////////////     LNB     ////////////////////
	
	/*     SNS 공유     */
	
	$(document).on("click","#lnb .btn-share",function(){
		
		$(this).closest(".share").find("div").slideDown(500,"easeInOutExpo");
		return false;
		
	});
	
	$(document).on("click","#lnb .share .close",function(){
		
		$(this).closest("div").slideUp(500,"easeInOutExpo");
		return false;
		
	});
	
	
	function LNBinit(){
		
		/*     LNB 생성     */
		
		var d1;
		var url;
		var menuLength = $("#gnb>li").length;
		var menu1 = $("#gnb>li").eq(m1).find(">a").clone();
		
		
		$("#lnb .main-lnb").append('<li class="one"></li>');
		$("#lnb .one").append(menu1);
		$("#lnb .one>a").attr("aria-label","메뉴 펼치기");
		$("#lnb .one").append("<ul></ul>");

		for(var i = 0; i < menuLength; i++){
			
			d1 = $("#gnb>li").eq(i).find(">a").clone();
			$("#lnb .one ul").append("<li></li>")
			$("#lnb .one ul li").eq(i).append(d1);
			
		}
		
		$("#lnb .one").find("ul li").eq(m1).find("a").addClass("on");
		
		
		
		if(m2!=null){
			
			menuLength = $("#gnb>li").eq(m1).find(">ul>li").length;
			var menu2 = $("#gnb>li").eq(m1).find(">ul>li").eq(m2).find(">a").clone();
			
			$("#lnb .main-lnb").append('<li class="two"></li>');
			$("#lnb .two").append(menu2);
			$("#lnb .two>a").attr("aria-label","메뉴 펼치기");
			$("#lnb .two").append("<ul></ul>");
			
			for(i = 0; i < menuLength; i++){
				
				d1 = $("#gnb>li").eq(m1).find(">ul>li").eq(i).find(">a").clone();
				$("#lnb .two ul").append("<li></li>");
				$("#lnb .two ul li").eq(i).append(d1);
				
			}
			
			$("#lnb .two").find("ul li").eq(m2).find("a").addClass("on");
		
		};
		
		if(m3!=null){
			
			menuLength = $("#gnb>li").eq(m1).find(">ul>li").eq(m2).find("li").length;
			var menu3 = $("#gnb >li").eq(m1).find("li").eq(m2).find(">ul>li").eq(m3).find(">a").clone();
			
			$("#lnb .main-lnb").append('<li class="three"></li>');
			$("#lnb .three").append(menu3);
			$("#lnb .three>a").attr("aria-label","메뉴 펼치기");
			$("#lnb .three").append("<ul></ul>");
			
			for(i = 0; i < menuLength; i++){
				
				d1 = $("#gnb>li").eq(m1).find("li").eq(m2).find("ul>li").eq(i).clone();
				$("#lnb .three ul").append(d1);
				
			}
			
			$("#lnb .three").find("ul li").eq(m3).find("a").addClass("on");
		
		};
		
		
		$("#lnb .main-lnb>li>a").click(function(e){
			
			if(!$(this).parent("li").hasClass("home")){
				var displayCondition = $(this).closest("li").find("ul").css("display");
			
				if(displayCondition==="block"){
					$(this).closest("li").find("ul").slideUp(500,"easeInOutExpo");
					$(this).attr("aria-label","메뉴 펼치기");
					$(this).removeClass("on");
				}else{
					$(this).closest("li").find("ul").slideDown(500,"easeInOutExpo");
					$(this).attr("aria-label","메뉴 닫기");
					$(this).addClass("on");
				}

				e.preventDefault();
			}
			
		});
		
	}
	
	////////////////////     MODAL POPUP     ////////////////////
	
	/*   Sitemap 로드   */
	$("#modal-wrap").load('../_inc/modal.html',function(){
		
		modal(); 
		accessibilityFocus();
		
	});
	
	function accessibilityFocus() {
		
		$(document).on('keydown', '[data-focus-prev], [data-focus-next]', function(e){
			var next = $(e.target).attr('data-focus-next'), 
				prev = $(e.target).attr('data-focus-prev'), 
				target = next || prev || false; 
			
			if(!target || e.keyCode !== 9) {
				return;
				
			} 
			
			if( (!e.shiftKey && !!next) || (e.shiftKey && !!prev) ) { 
				
				setTimeout(function(){
					$('[data-focus="' + target + '"]').focus(); 
				}, 1);
				
			} 
		}); 
	} 
	
	function modal() {
		
		var openBtn = '[data-modal]', 
			closeBtn = '.modal-close'; 
		
		function getTarget(t) { 
			
			return $(t).attr('data-modal'); 
		
		} 
		
		function open(t) { 
			
			var showTarget = $('[data-modal-con="' + t + '"]');
			
			
			window.setTimeout(function(){
				var pop_height = showTarget.height()/-2;
				var pop_width = showTarget.innerWidth()/-2;
				showTarget.attr("tabindex","0");
				showTarget.show().css({"margin-top":pop_height,"margin-left":pop_width});
				showTarget.focus();
				showTarget.find('.modal-close').data('activeTarget', t);
			},500);
			
		} 
		
		function close(t) { 
			
			var activeTarget = $('[data-modal-con="' + t + '"]'); 
			activeTarget.hide(); 
			$('[data-modal="' + t + '"]').focus(); 
		} 
		
		$(document).on('click', openBtn, function(e){ 
			open(getTarget($(this)));
			//alert(getTarget($(this)));
			$("#modal-wrap").show();
			e.preventDefault(); 
		}) .on('click', closeBtn, function(e) { 
			e.preventDefault(); 
			close($(this).data('activeTarget'));
			$("#modal-wrap").hide();
		}); 
	}
	
	////////////////////     FAQ     ////////////////////
	
	
	$(".q>a").click(function(e){
		
		if($(this).attr("data-boolean")==="true"){
			$(".a").stop().slideUp(500,"easeInOutExpo");
			$(".q").find("a").attr("data-boolean","false");
			$(".q").removeClass("on");
			return false;	
		}
		$(".q").find("a").attr("data-boolean","false");
		$(this).attr("data-boolean","true");
		$(".q").removeClass("on");
		$(this).closest("li").addClass("on");
		$(".a").stop().slideUp(500,"easeInOutExpo");
		$(this).closest("li").next(".a").stop().slideDown(500,"easeInOutExpo");	
		
		e.preventDefault();
		
	});
    
    
    ////////////////////     Tab     ////////////////////
	
	var selected_tab = $(".tab .on a").text();
	
	$(".tab ul").before("<p class='tab-selected mobile-only'>"+selected_tab+"</p>");
	
	var tab_act = false;
	
	$(".tab-selected").click(function(){
		
		if(tab_act===false){
			$(".tab").addClass("on");
			tab_act = true;
		}else{
			$(".tab").removeClass("on");
			tab_act = false;
		}
		
	});
    
    var selected_tab2 = $(".tab2 .on a").text();
	
	$(".tab2 ul").before("<p class='tab-selected2 mobile-only'>"+selected_tab2+"</p>");
	
	var tab_act2 = false;
	
	$(".tab-selected2").click(function(){
		
		if(tab_act2===false){
			$(".tab2").addClass("on");
			tab_act2 = true;
		}else{
			$(".tab2").removeClass("on");
			tab_act2 = false;
		}
		
	});
	
	
	
	////////////////////     TABLE SCROLL     ////////////////////
	
	$(".table_inner.scroll").append("<div class=\"msg_touch_help\"><img src=\"../_images/common/bg_touch_help.png\" alt=\"touch slide\"></div>");
	$(".table_inner.scroll").each(function() {
		$(this).scroll(function(){
			$(this).find(".msg_touch_help").fadeOut();
		});
	});
    
    
    ////////////////////     Tab     ////////////////////
    
    $(document).on("click",".corporate .expand",function(e){
		
		$(".corporate .china").toggleClass("on");
		e.preventDefault();
		
	});
    
    
    
    ////////////////////     PopUp     ////////////////////
    
    $(document).on("click",".terms a",function(e){
        
        //alert("A");
        openWin("../08_etc/travel_terms_pop.html", 600, 600);
        e.preventDefault();
        
    });
	
});
