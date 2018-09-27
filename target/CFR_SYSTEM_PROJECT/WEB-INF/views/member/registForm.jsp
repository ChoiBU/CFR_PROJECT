<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/headerScript.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
var pwCheck = 0;
var idCheck = 0;

//비밀번호 일치여부확인
	function isSame() {
        var pw = document.getElementById("m_pw").value;
        var pwck = document.getElementById("pw_check").value;
       
        if(pw=='' && pwck=="" ) {
        	document.getElementById("pwsame").innerHTML = '비밀번호를 입력해주세요.';
        	document.getElementById("pwsame").style.color = 'red';
        	pwCheck = 0;
        
		} else if (pw != pwck && pwck != '') {
            document.getElementById("pwsame").innerHTML = '비밀번호가 일치하지 않습니다. 다시 입력해 주세요.';
            document.getElementById("pwsame").style.color = 'red';
            pwCheck = 0;
        
        } else if(pw==pwck) {
        	document.getElementById("pwsame").innerHTML = '비밀번호가 일치합니다.';
        	document.getElementById("pwsame").style.color = 'blue';
        	pwCheck = 1;
        }
        ableBtn();
    }

 //아이디 체크하여 중복확인.
 
	 function checkId() {
	     var inputed = $('#idcheck').val();
	     $.ajax({
	         data : {
	             m_id : inputed
	         },
	         url : '/member/checkId',
	         success : function(data) {
	             if(inputed=="" && data=='0') {
	                 $("#idcheck").css("background-color", "#FFCECE");
	                 idCheck = 0;
	                 document.getElementById("idchk").innerHTML = '사용하실 아이디를 입력해주세요.';
	             	 document.getElementById("idchk").style.color = 'red';
	             	 
	             } else if (data == '0') {
	                 $("#idcheck").css("background-color", "#B0F6AC");
	                 idCheck = 1;
	                 document.getElementById("idchk").innerHTML = '사용가능한 아이디입니다.';
	             	 document.getElementById("idchk").style.color = 'blue';
	             } else if (data == '1') {
	                 $("#idcheck").css("background-color", "#FFCECE");
	                 idCheck = 0;
	                 document.getElementById("idchk").innerHTML = '사용불가한 아이디입니다.';
	             	 document.getElementById("idchk").style.color = 'red';
	             }
	         }
	     });
	     ableBtn();
	 }

	function ableBtn(){
	    if(pwCheck == 0 || idCheck == 0) {
	    	$("#regist").attr("disabled", true);
	    } else {
	    	$("#regist").attr("disabled", false);
	    }
	}
	
	//test
	 function idtest() {
    	//아이디 유효성 검사 (영문소문자, 숫자만 허용)
       for (i = 0; i < document.rs.m_id.value.length; i++) {
           ch = document.rs.m_id.value.charAt(i)
           if (!(ch >= '0' && ch <= '9') && !(ch >= 'a' && ch <= 'z')&&!(ch >= 'A' && ch <= 'Z')) {
               alert("아이디는 대소문자, 숫자만 입력가능합니다.")
               document.rs.m_id.value="";
               document.rs.m_id.focus()
               document.rs.m_id.select()
               return false;
           }
       }
       //아이디에 공백 사용하지 않기
       if (document.rs.m_id.value.indexOf(" ") >= 0) {
           alert("아이디에 공백을 사용할 수 없습니다.")
           document.rs.m_id.focus()
           document.rs.m_id.select()
           return false;
       }
       
   
   }

 </script>  
 <script> 
       function congratuation() {
           alert("회원가입을 횐영합니다.");
       }
 </script>    
</head>

<body>
<div class="container">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<h1>회원가입</h1><br>
			<form name="rs" class="form-horizontal" action="/member/regist" method="post">
				<label>아이디</label><input type="text" class="form-control" name="m_id" onkeyup="idtest()" id="idcheck" oninput="checkId()" size="30" placeholder="아이디를 입력해주세요." required>
				<div id='idchk'></div>
				<label>비밀번호</label><input type="password" class="form-control" name="m_pw" id="m_pw" placeholder="비밀번호를 입력해주세요." size="30" onkeyup="isSame()" required>
				<label>비밀번호 확인</label><input type="password" class="form-control" id="pw_check" placeholder="다시 한번 입력해주세요." size="30" onkeyup="isSame()" required>
				<div id="pwsame" ></div>
				<label>회원이름</label><input type="text" class="form-control" name="m_name" size="30" required>
				<label>회원이메일</label><input type="text" class="form-control" name="m_email" id="m_email" size="30" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" placeholder="ex)cfr1120@naver.com" required>
				<label>회원전화</label><input type="text" class="form-control" name="m_phone" size="30" placeholder="-를 제외한 숫자만 입력하세요." pattern="^[0-9]*$" required>		
				<!-- 주소와 우편번호를 입력할 <input>들을 생성하고 적당한 name과 class를 부여한다 -->
				<label>회원주소</label>
				<input type="button" class="btn btn-primary" id="postcodify_search_button" value="주소 검색"><br />
				<!-- <button class="btn btn-primary" id="postcodify_search_button">주소 검색</button><br /> -->
				<input type="text" name="m_p_address" class="postcodify_postcode5 form-control" value="" readonly required><br />
				<input type="text" name="m_address" class="postcodify_address form-control" value="" readonly required><br />
				<input type="text" name="" class="postcodify_extra_info form-control" value="" readonly required><br />
				<input type="text" name="m_d_address" class="postcodify_details form-control" value="" required><br />
				
				<!-- jQuery와 Postcodify를 로딩한다 -->
				<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
				<script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
				
				<!-- "검색" 단추를 누르면 팝업 레이어가 열리도록 설정한다 -->
				<script> $(function() { $("#postcodify_search_button").postcodifyPopUp(); }); </script>
				<input type="submit" id="regist" class="btn btn-default" value="등록" onclick= "congratuation()">
				 
			</form>	
		</div>
		<div class="col-md-2"></div>
	</div>
</div>
</body>
</html>