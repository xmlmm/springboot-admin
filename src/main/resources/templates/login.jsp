<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
	<head>
	<meta charset="utf-8" />
	<title>高速公路品质工程信息化管理平台</title>
	<meta http-equiv="Expires" CONTENT="0">     
	<meta http-equiv="Cache-Control" CONTENT="no-cache"> 
	<meta http-equiv="Pragma" CONTENT="no-cache"> 
	
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link rel="shortcut icon" href="<%=basePath%>assets/img/favicon.png" type="image/x-icon">
    
	<!-- CSS -->
     <link rel="stylesheet" type="text/css" href="<%=basePath%>resources/login/web.layout.css">
     <link rel="stylesheet" type="text/css" href="<%=basePath%>resources/login/login.hkyz.css">
     <link rel="stylesheet" type="text/css" href="<%=basePath%>resources/login/slider/jquery.slider.css">

	<!-- Script -->
	<script type="text/javascript" src="<%=basePath%>assets/js/jquery-2.0.3.min.js"></script>
    <script src="<%=basePath%>assets/js/skins.min.js"></script>
    <script src="<%=basePath%>resources/scripts/login-hkyz.js"></script>   
    <script src="<%=basePath%>resources/scripts/login.js"></script>   
    <script src="${baseurl}resources/login/slider/jquery.slider.min.js" ></script>
    
	</head>
	<body>
		<div class="wrap">
			<div class="container">
				<form  action="<%=basePath%>login" method="post" id="loginform" name="loginform">
					<%--隐藏域--%>
					<input id="constType" name="constType" value="${constType}" type="hidden"/>
					<input id="staffTelMw" value="${staffTelMwts}" type="hidden"/>
					<div class="row">
					<div class="login clearfix">
						<div class="logo f-fl"><img src="${baseurl}resources/images/login_logo.png"/></div>
						<div class="form f-fl">
							<div id="account" class="form-div active">
								    <input type="hidden" name="logintype" id="logintype" value="username"/>
								    <input type="hidden" name="clientType" id="clientType" value="pc"/>
									<div  style="padding-top:60px;">
									
										<div class="form-group">
											<label class="f-fr iconfont" style="margin-top:5px;margin-bottom:15px;color:#ff0000;display:none;">&nbsp;<a href="javascript:void(0);" id="msglogin" style="display:none;">&nbsp;</a></label>
										</div>
										
										<div id="zhanghao" class="forms-div active">
											<div class="form-group">
												<i class="icon-user"></i><input class="form-control" type="text"  id="uname" name="username" value="" placeholder="请输入帐号" onkeydown="KeyDown()" autocomplete="off"/>
											</div>
											
											<div class="form-group">
												<i class="icon-pwd"></i><input class="form-control" type="password" id="upass" name="password"  value="" placeholder="请输入密码" onkeydown="KeyDown()"  autocomplete="off"/>
											</div>
										</div>
										<c:if test="${constType == '1'}">
											<div class="form-group clearfix" >
												<div id="slider1" class="slider"></div>
											</div>
										</c:if>
										<c:if test="${constType == '2'}">
											<div class="form-group">
												<i class="icon-pwd"></i><input class="form-control" type="text" id="validateCode" name="validateCode"  value="" placeholder="请输入验证码" autocomplete="off" style="width: 40%;float: left;"/>
												<button type="button" class="btn" style="font-size: 14px; width: 19%; float: left;height: 34px; line-height: 15px; text-align: center; margin-left: 1%; padding: 10px 15px;" id="sendMessageBtn" onclick="sendMessage();">发送验证码</button>
												<span style="font-size: 12px; color: #ffffff; float: left; margin-left: 20%; margin-top: 5px;" id="telts"></span>
											</div>
											<div class="form-group">
											</div>
										</c:if>
									</div>
							</div>
						</div>
					</div>
					<div class="copyright clearfix" style="margin-top: 50px;">
						<label class="f-fr">
							<a href="javascript:void(0);" id="register" style="display:none;">&nbsp;</a>
						</label>
					</div>
					<button type="button" class="btn" id="login_btn" name="loginBbtn">登 &nbsp;&nbsp;&nbsp;&nbsp;录</button>
					<label class="f-fl" style="margin-top:5px;">
						<div id="login_msg" class="g-login-msg" style="margin-left: 110px;margin-top: 10px;"><font color="red">${message}</font></div>
					</label> 
				</div>
			 </form>
			</div>
			<div class="footer">
				<font style="color: #fff; font-size: 12px;"><span>推荐浏览器版本:IE11,Chrome,分辨率:1366*768</span></font>
			</div>
		</div>
		<script type="text/javascript">
			var basePath="<%=basePath%>";
			var yzmTimeout = null;
			var timer = 60;
			$(document).ready(function(){
				if('${message}' == '验证码错误, 请重试.'){
					$("#telts").html('您接收短信验证码的手机号为：'+$("#staffTelMw").val()+'，请尽快输入。');
				}
				$("#slider1").slider({
					callback: function(result) {
						$("#result1").text(result);
					}
				});
				$("#msglogin").click(function(){
					if ($(this).parent().hasClass("icon-app")){
						$("#logintype").val("phone");
						$("#zhanghao").removeClass("active");
						$("#shouji").addClass("active");
						$(this).text("帐号密码登录");
						$(this).parent().removeClass("icon-app");
						$(this).parent().addClass("icon-zhanghao");
					}else{
						$("#logintype").val("username");						
						$("#zhanghao").addClass("active");
						$("#shouji").removeClass("active");
						$(this).text("动态密码登录");
						$(this).parent().addClass("icon-app");
						$(this).parent().removeClass("icon-zhanghao");						
					}
				});
				
			});
			
			 var clock =null,nums = 60,btn,uphone;
			 function sendCode(thisBtn,flag){ 
				 if (flag=='loginvcode') uphone = $("#uphone").val();
				 if (flag=='regvcode')  uphone=$("#staffTel").val();
				 var regphone = /^1[3|4|5|7|8][0-9]{9}$/;
				 if (!regphone.test(uphone)) {
					 layer.msg("请输入正确的手机号!!");
					 return false;
				 }
				 btn = thisBtn;
				 btn.disabled = true; //将按钮置为不可点击

				 $.ajax({
				        url: basePath + "backend/staff/validateCode",
				        data: "phonecode="+uphone,
				        type: "post",
				        success: function (data) {
							 btn.value = '重新发送'+nums;
							 clock = setInterval(doLoop, 1000); //一秒执行一次				        	
				        }
				    });
			 }
			 
			 function doLoop(){
				 nums--;
				 if(nums > 0){
				 	btn.value = '重新发送'+nums;
				 }else{
					clearInterval(clock); //清除js定时器
					btn.disabled = false;
					btn.value = '重新发送验证码';
					nums = 60; //重置时间
				 }
			 }			
			 
			
			function KeyDown() {
//				if (event.keyCode == 13) {
//					event.returnValue = false;
//					event.cancel = true;
//					if($(".drag_text").text() != '验证通过'){
//						$("#login_msg").html('<font color="red">'+请拖动滑块验证+'</font>');
//						return false;
//					}
//					loginform.loginBbtn.click();
//				}
			}
			// 刷新图片  
			function changeImg() {
				var imgSrc = $("#imgObj");
				var src = imgSrc.attr("src");
				imgSrc.attr("src", changeUrl(src));
			}
			//为了使每次生成图片不一致，即不让浏览器读缓存，所以需要加上时间戳  
			function changeUrl(url) {
				var timestamp = (new Date()).valueOf();
				var index = url.indexOf("?", url);
				if (index > 0) {
					url = url.substring(0, index);
				}
				if ((url.indexOf("&") >= 0)) {
					url = url + "×tamp=" + timestamp;
				} else {
					url = url + "?timestamp=" + timestamp;
				}
				return url;
			}
			function sendMessage(){
				if($("#logintype").val()=="username"){
					var name = $("#uname").val();
					var pass = $("#upass").val();
					$("#login_msg").html('');
					if(name==''){
						$("#login_msg").html('<font color="red">请输入帐号!</font>');
						return false;
					}else if(pass==''){
						$("#login_msg").html('<font color="red">请输入密码!</font>');
						return false;
					}else{
						$.ajax({
							url: basePath+'sendMessage',
							data: {"name": name, "pass": pass},
							async: false,
							type: 'post',
							success: function(data){
								if(data.status == 0){
									$("#login_msg").html('<font color="red">账号/手机号不存在或密码错误!!</font>');
									return false;
								}
								if(data.status == 1){
									$("#login_msg").html('<font color="red">此账号未填写手机号，无法发送验证码!!</font>');
									return false;
								}
								if(data.status == 200){
									$('#sendMessageBtn').removeAttr("onclick");
									$("#telts").html('您接收短信验证码的手机号为：'+data.staffTel+'，请尽快输入。');
									window.clearInterval(yzmTimeout);
									yzmTimeout = setInterval(getCountDown, 1000);
								}else{
									$("#login_msg").html('<font color="red">短信发送失败!!</font>');
									return false;
								}
							}
						});
					}
				}
			}
			//倒计时
			function getCountDown() {
				$('#sendMessageBtn').text(timer+"s后重发");
				$('.l-btn').css({"background": "#dddddd"});
				if (timer === 0) {
					window.clearInterval(yzmTimeout);
					$('#sendMessageBtn').text("发送验证码");
					$('#sendMessageBtn').attr("onclick", "sendMessage();");
					$('.l-btn').css({"background": "#0076c8"});
					timer = 60;
				} else {
					timer--;
				}
			}
		</script>
	</body>
<style>
	
.btn:hover {
    background-color: #357ebd;
    border-color: #fff;
}
.btn {
    color: #fff;
    border-color: #fff;
}

</style>
</html>
