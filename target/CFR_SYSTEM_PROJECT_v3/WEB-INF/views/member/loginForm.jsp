<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/headerScript.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>

<style>
/* 오류메세지 반짝이게하기 */
.blinking{
	-webkit-animation:blink 1.5s ease-in-out infinite alternate;
    -moz-animation:blink 1.5s ease-in-out infinite alternate;
    animation:blink 1.5s ease-in-out infinite alternate;
}
@-webkit-keyframes blink{
    0% {opacity:0;}
    100% {opacity:1;}
}
@-moz-keyframes blink{
    0% {opacity:0;}
    100% {opacity:1;}
}
@keyframes blink{
    0% {opacity:0;}
    100% {opacity:1;}
}
</STYLE>


</head>
<body>
<div class="container" >    
	<div class="row">
	  <div class="col-md-4"></div>
	  <div class="col-md-4">
			<!--탭 메뉴 영역 -->
			<br>
			<br>
			<!--탭 콘텐츠 영역 -->
			<div class="tab_container">
			
			<div id="tab1" class="tab_content text-center">
				<!--Content-->
		       <h1>JASYS</h1><br>
				<form class="form-horizontal" method="post" action="/member/checkIdPw" method="post">
					<div class="form-group">
						<input type="text" class="form-control" placeholder="아이디" name="m_id" id="m_id" > <br>
						<input type="password" class="form-control" placeholder="패스워드" name="m_pw" id="m_pw" onkeypress="if(event.keyCode==13) {m_login(); return false;}"> <br>
						<input type="button" class="btn btn-default btn-lg" value="로그인" onclick="m_login()">
						<c:if test="${msg == 'fail'}">
			                    <div class="image blinking" style="color: red">
		                        		아이디 또는 비밀번호가 일치하지 않습니다.<br>
		                        		확인 후 다시 입력해주세요.
			                    </div>
		                </c:if>
					</div>
				</form>
<script type="text/javascript">

function m_login() {
	var m_id = document.getElementById("m_id").value;
	var m_pw = document.getElementById("m_pw").value;
	$.ajax({
		type : "POST",
		dataType : 'json',
		data : {
			m_id:m_id,
			m_pw:m_pw
		},
		url : '/member/login',
		success: function(data) {
			    var form = document.createElement("form");
			    form.setAttribute("method", 'post');
			    form.setAttribute("action", '/login/alert');
			        var hiddenField = document.createElement("input");
			        hiddenField.setAttribute("type", "hidden");
			        hiddenField.setAttribute("name", "flag");
			        hiddenField.setAttribute("value", data);
			        form.appendChild(hiddenField);
			        var hiddenField2 = document.createElement("input");
			        hiddenField2.setAttribute("type", "hidden");
			        hiddenField2.setAttribute("name", "msg");
			        hiddenField2.setAttribute("value", "로그인");
			        form.appendChild(hiddenField2);
			        if(data==1){	// 로그인 성공시
			        var hiddenField3 = document.createElement("input");
			        hiddenField3.setAttribute("type", "hidden");
			        hiddenField3.setAttribute("name", "forward_url");
			        	hiddenField3.setAttribute("value", "/");			        	
			        }
			        form.appendChild(hiddenField3);
			    document.body.appendChild(form);
			    form.submit();
		}
	});	
}
</script>
				
				<!-- ★★★★★★★★★★★페이스북 로그인★★★★★★★★★★★★★★★★ -->
	<button type="button" class="btn btn-primary btn-large" id="loginBtn">페이스북으로 로그인</button>        
<script>
function getUserData() {
    /* FB.api('/me', function(response) {
        document.getElementById('response').innerHTML = 'Hello ' + response.name;
        console.log(response);
    }); */
    FB.api('/me', {fields: 'name,email,gender,birthday'}, function(response) {
        console.log(JSON.stringify(response));
        var f_name = response.name;
        var f_email = response.email;
        var f_gender = response.gender;
        var f_birthday = response.birthday;
        var f_id = response.id;
        $.ajax({
			type : "POST",
			dataType : 'json',
			data : {
				f_name:f_name,
				f_email:f_email,
				f_gender:f_gender,
				f_birth:f_birthday,
				f_id:f_id},
			url : '/member/login',
			success: function(data) {
				var form = document.createElement("form");
			    form.setAttribute("method", 'post');
			    form.setAttribute("action", '/login/alert');
			        var hiddenField = document.createElement("input");
			        hiddenField.setAttribute("type", "hidden");
			        hiddenField.setAttribute("name", "flag");
			        hiddenField.setAttribute("value", data);
			        form.appendChild(hiddenField);
			        var hiddenField2 = document.createElement("input");
			        hiddenField2.setAttribute("type", "hidden");
			        hiddenField2.setAttribute("name", "msg");
			        hiddenField2.setAttribute("value", "페이스북 로그인");
			        form.appendChild(hiddenField2);
			        if(data==1){	// 로그인 성공시
			        var hiddenField3 = document.createElement("input");
			        hiddenField3.setAttribute("type", "hidden");
			        hiddenField3.setAttribute("name", "forward_url");
			        	hiddenField3.setAttribute("value", "/");			        	
			        }
			        form.appendChild(hiddenField3);
			    document.body.appendChild(form);
			    form.submit();
				}
			});				
		});
	}

	window.fbAsyncInit = function() {
		//SDK loaded, initialize it
		FB.init({
			appId : '1931434830509984',
			cookie : true, // enable cookies to allow the server to access
			// the session
			xfbml : true, // parse social plugins on this page
			version : 'v2.8' // use graph api version 2.8
		});

		//check user session and refresh it
		FB.getLoginStatus(function(response) {
			if (response.status === 'connected') {
				//user is authorized
				//document.getElementById('loginBtn').style.display = 'none';
				getUserData();
			} else {
				//user is not authorized
			}
		});
	};

	//load the JavaScript SDK
	(function(d, s, id) {
		var js, fjs = d.getElementsByTagName(s)[0];
		if (d.getElementById(id)) {
			return;
		}
		js = d.createElement(s);
		js.id = id;
		js.src = "//connect.facebook.com/ko_KR/sdk.js";
		fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));

	//add event listener to login button
	document.getElementById('loginBtn').addEventListener('click', function() {
		//do the login
		FB.login(function(response) {
			if (response.authResponse) {
				access_token = response.authResponse.accessToken; //get access token
				user_id = response.authResponse.userID; //get FB UID
				console.log('access_token = ' + access_token);
				console.log('user_id = ' + user_id);
				// $("#access_token").text("접근 토큰 : "+access_token);
				// $("#user_id").text("FB UID : "+user_id); 
				//user just authorized your app
				//document.getElementById('loginBtn').style.display = 'none';

				getUserData();
			}
		}, {
			scope : 'email,public_profile,user_birthday',
			return_scopes : true
		});
	}, false);
</script>
	<!-- ★★★★★★★★★★★페이스북 로그인★★★★★★★★★★★★★★★★ -->
	
	
				<div class="text-right">
				<a href ="/member/registForm">회원가입</a><br>
				<a href ="/member/findInfo">아이디/비밀번호 찾기</a>
					</div>
			</div>
			
			</div>
	    </div>
	    <div class="col-md-4"></div>
    </div>
</div>