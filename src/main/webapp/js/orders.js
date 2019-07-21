/**
 * Created by yy on 2016/12/15.
 */

$("#leftsidebar_box dt").css({
	"background-color" : " #0AA1ED"
});
/*
$(function(){
    $("#leftsidebar_box dd").hide();
    $("#leftsidebar_box .my_order dd").show();
    $("#leftsidebar_box dt").click(function(){
        $("#leftsidebar_box dt").css({"background-color":"#0AA1ED"});
        $(this).css({"background-color": "#0AA1ED"});
        $(this).parent().find('dd').removeClass("menu_chioce");
        $("#leftsidebar_box dt img").attr("src","../images/myOrder/myOrder2.png");
        $(this).parent().find('img').attr("src","../images/myOrder/myOrder1.png");
        $(".menu_chioce").slideUp();
        $(this).parent().find('dd').slideToggle();
        $(this).parent().find('dd').addClass("menu_chioce");
        $(this).parent().siblings().children('dd').slideUp();
    });
})
 */
// 重写左侧菜单栏手风琴效果
$(function() {
	//移除所有一级菜单的menu_chioce
	$("#leftsidebar_box dt").removeClass("menu_chioce");
	// 隐藏所有子菜单项
	$("#leftsidebar_box dd").hide();
	// 一级菜单项添加点击事件
	$("#leftsidebar_box dt").click(function(){
		//设置所有一级菜单项背景颜色
		$("#leftsidebar_box dt").css({ "background-color" : "#0AA1ED" });
		//设置被点击的一级菜单的背景颜色
		$(this).css({"background-color": "#CCCCCC"});
		//设置所有一级菜单的右侧图标
		$("#leftsidebar_box dt img").attr("src",$('#basePath').val()+"/images/myOrder/myOrder1.png");
		//使用menu_chioce标记判断当前菜单是否被选中
		if($(this).hasClass('menu_chioce')){
			//如果当前菜单是被选中状态,把颜色设成未选中时.
			$(this).css({"background-color": "#0AA1ED"});
			//移除所有的被选中状态
			$("#leftsidebar_box dt").removeClass("menu_chioce");
			//设置一级菜单的右侧图标为初始状态
			$(this).parent().find('img').attr("src",$('#basePath').val()+"/images/myOrder/myOrder1.png");
		}else{
			//如果当前菜单是被选中状态,把颜色设成选中时.
			$(this).css({"background-color": "#CCCCCC"});
			//移除所有的被选中状态
			$("#leftsidebar_box dt").removeClass("menu_chioce");
			//标记其为选中状态
			$(this).addClass('menu_chioce');
			//设置一级菜单的右侧图标为选中状态
			$(this).parent().find('img').attr("src",$('#basePath').val()+"/images/myOrder/myOrder2.png");
		}
		//展开子菜单
        $(this).parent().find('dd').slideToggle();
        //收起其他子菜单
        $(this).parent().siblings().children('dd').slideUp();
		
	});
});
// 分页部分
$(".tcdPageCode").createPage({
	pageCount : 6,
	current : 1,
	backFn : function(p) {

	}
});
