<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/views/include/headerScript.jsp" %>
<html>
<head>
	<title>Home</title>
	<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
	<style type="text/css">
		body{background:url('../resources/images/bgimage.jpg') 
		no-repeat center center fixed; -webkit-background-size: cover;-moz-background-size: cover;
		-o-background-size: cover;background-size: cover;} 
		p,h1,h2,h3,h4,th,td{color:white;}
	</style>
<!-- 자동완성 -->
<script type="text/javascript">
	$(function(){	
	    $( "#searchWord" ).autocomplete({
	        source : function( request, response) {
	             $.ajax({
	                    type: 'post',
	                    url: "/corporation/select_c_name",
	                    dataType: "json",
	                    data: { search : request.term },
	                    success: function(data) {
	                        //서버에서 json 데이터 response 후 목록에 뿌려주기 위함
	                        response(
	                            $.map(data, function(item) {
	                                return {
	                                    label: item.c_name,
	                                    value: item.c_name
	                                }
	                            })
	                        );
	                    }
	               });
	            },
	        //조회를 위한 최소글자수
	        minLength: 1
	    });
	})
</script>
<!-- 랜덤검색 -->
<script type="text/javascript">
	function randomSearch(){
		var rand = Math.floor(Math.random() * 1448) + 1;
		var form = document.createElement("form");
	    form.setAttribute("method", 'post');
	    form.setAttribute("action", '/corporation/search');
	        var hiddenField = document.createElement("input");
	        hiddenField.setAttribute("type", "hidden");
	        hiddenField.setAttribute("name", "c_no");
	        hiddenField.setAttribute("value", rand);
        form.appendChild(hiddenField);
	    document.body.appendChild(form);
	    form.submit();
	}
</script>

<!-- 문의하기 모달 -->
<!-- <script type="text/javascript">
	$('#myModal').on('shown.bs.modal', function () {
		$('#myInput').focus()
	})
</script> -->
<!-- 로그인창 스타일 테스트 -->
<style>
/****** LOGIN MODAL ******/
.loginmodal-container {
  padding: 30px;
  max-width: 350px;
  width: 100% !important;
  background-color: #F7F7F7;	
  margin: 0 auto;
  border-radius: 2px;
  box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
  overflow: hidden;
  font-family: roboto;
}
.loginmodal-container h1 {
  text-align: center;
  font-size: 1.8em;
  font-family: roboto;
}
.loginmodal-container input[type=submit] {
  width: 100%;
  display: block;
  margin-bottom: 10px;
  position: relative;
}
.loginmodal-container input[type=text], input[type=password] {
  height: 44px;
  font-size: 16px;
  width: 100%;
  margin-bottom: 10px;
  -webkit-appearance: none;
  background: #fff;
  border: 1px solid #d9d9d9;
  border-top: 1px solid #c0c0c0;
  /* border-radius: 2px; */
  padding: 0 8px;
  box-sizing: border-box;
  -moz-box-sizing: border-box;
}
.loginmodal-container input[type=text]:hover, input[type=password]:hover {
  border: 1px solid #b9b9b9;
  border-top: 1px solid #a0a0a0;
  -moz-box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
  -webkit-box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
  box-shadow: inset 0 1px 2px rgba(0,0,0,0.1);
}
.loginmodal {
  text-align: center;
  font-size: 14px;
  font-family: 'Arial', sans-serif;
  font-weight: 700;
  height: 36px;
  padding: 0 8px;
/* border-radius: 3px; */
/* -webkit-user-select: none;
  user-select: none; */
}
.loginmodal-submit {
  /* border: 1px solid #3079ed; */
  border: 0px;
  color: #fff;
  text-shadow: 0 1px rgba(0,0,0,0.1); 
  background-color: #4d90fe;
  padding: 17px 0px;
  font-family: roboto;
  font-size: 14px;
  /* background-image: -webkit-gradient(linear, 0 0, 0 100%,   from(#4d90fe), to(#4787ed)); */
}
.loginmodal-submit:hover {
  /* border: 1px solid #2f5bb7; */
  border: 0px;
  text-shadow: 0 1px rgba(0,0,0,0.3);
  background-color: #357ae8;
  /* background-image: -webkit-gradient(linear, 0 0, 0 100%,   from(#4d90fe), to(#357ae8)); */
}
.loginmodal-container a {
  text-decoration: none;
  color: #666;
  font-weight: 400;
  text-align: center;
  display: inline-block;
  opacity: 0.6;
  transition: opacity ease 0.5s;
} 
.login-help{
  font-size: 12px;
}


</style>
<script>
function login() {
    alert("로그인이 필요합니다.");
}
</script>
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
<!-- 로그인창 스타일 테스트 -->
</head>

<body>




<!-- 로그인창 -->
<div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
	<div class="modal-dialog">
		<!--loginmodal-container 부트스트랩 부분 --> 
		<div class="loginmodal-container">
			<p style="color: red;">로그인이 필요합니다</p>
			<h4 style="color: black;">로그인안내창</h4><br>
			 <form class="form-horizontal" action="/member/login" method="post">
				<input type="text" id="m_id" name="m_id" placeholder="아이디" ><br>
				<input type="password" id="m_pw" name="m_pw" placeholder="패스워드">
				<input type="submit" name="login" class="login loginmodal-submit" onclick="m_login()" value="Login" >
			 </form>
	
			<div class="login-help">
				<a href="/member/registForm">회원가입</a> &nbsp; <a href="/member/findInfo">아이디/비밀번호 찾기</a>
			</div>
		</div>
	</div>
</div>
<!-- 로그인창 -->

<div class="container" style="width:1300px;">
<br>

	<!-- 메인 -->
	<div>
		<h1 class="white-font bold top-margin">CFR이 서포터즈가 되어드리겠습니다. <br>
											    검색창에 지금 바로 검색해보세요!</h1><br>
		<form class="form-inline" action="/corporation/search" method="POST">
			<input class="form-control"  type="text" id="searchWord" name="c_name" size="50" placeholder="회사명을 입력하세요"  >
			<!-- <input class="btn btn-default" type="submit" id="btnSearch"  value="search" >
			<input class="btn btn-secondary" type="button"  onclick="randomSearch()" value="랜덤"> -->
	
			<button type="submit" class="btn btn-default btn-md">
				<span class="glyphicon glyphicon-search" aria-hidden="true"></span>&nbsp;&nbsp;검색
			</button>
			<button type="button" class="btn btn-default btn-md" onclick="randomSearch()" >
			  <span class="glyphicon glyphicon-random" aria-hidden="true"></span>&nbsp;&nbsp;랜덤검색
			</button>		
		</form>
	</div>
<br>
<div class="row" >
<div class="col-xs-12 col-md-6 col-lg-6" >
				<a class="btn btn-primary btn-lg top-margin font-bigger" data-toggle="modal" data-target="#myModal"><i class="fa fa-question fa-fw"></i> 문의</a>
				<c:if test="${m_id eq null && f_id eq null}">
				<a class="btn btn-default btn-lg top-margin left-margin font-bigger hover" data-toggle="modal"  data-target="#login-modal" onclick="login()"><i class="fa fa-key fa-fw"></i> 로그인</a>
				</c:if>	
				
				<h2 class="white-font bold top-margin">사용기술과 프레임워크</h2>
				<div class="row" style="float:left;">
				<div class="table-responsive" style="width:100%;">
				  <table class="table">
				  	<tr>
				  		<th>WAS</th>
				  		<td>톰캣 8.5</td>
				  	</tr>
				  	<tr>
				  		<th>Host</th>
				  		<td>AWS</td>
				  	</tr>
				  	<tr>
				  		<th>DBMS</th>
				  		<td>MySQL 5.7.18</td>
				  	</tr>
				  	<tr>
				  		<th>Tool</th>
				  		<td>STS</td>
				  	</tr>
				  	<tr>
				  		<th>Back_end</th>
				  		<td>Spring, MyBatis</td>
				  	</tr>
				  	<tr>
				  		<th>Front_end</th>
				  		<td>SASS(CSS), Javascript, jQuery</td>
				  	</tr>
				  	<tr>
				  		<th>etc.</th>
				  		<td>Bootstrap, Ajax</td>
				  	</tr>
				  	<tr>
				  		<th>API</th>
				  		<td>페이스북 로그인연동, 주소 검색, 다음 지도, 네이버 뉴스, 금융감독원 전자공시시스템, 한국거래소 주가 정보</td>
				  	</tr>
				  	<tr>
				  		<th>개발내용</th>
				  		<td>DB 연동, API 활용, 검색(자동완성), 랜덤 검색, 선호기업 기능, 회원등록 및 관리 기능, 문의 기능 등 </td>
				  	</tr>
				  	<tr>
				  		<th>기타사항</th>
				  		<td> - </td>
				  	</tr>
				  </table>
				</div>
				</div>
			</div>
				
					<!-- 임시 -->
				<div class="col-xs-12 col-md-3 col-lg-3" style="padding-left:50px;">
			         <div role="tabpanel">
			            <!-- Nav tabs -->
			            <ul class="nav nav-tabs nav-justified" role="tablist" style="background-color:#cccccc;">
			               <li role="presentation" class="active"><a href="#map" aria-controls="map" role="tab" data-toggle="tab" style="color: black">실시간 선호기업</a></li>
			               <li role="presentation"><a href="#stock" aria-controls="stock" role="tab" data-toggle="tab" style="color: black">선호기업 순위</a></li>
			            </ul>
			            <!-- Tab panes -->
			            <div class="tab-content">
			               <div role="tabpanel" class="tab-pane active" id="map">
			              		<h4><p style="color:white;" align="center"> 최근 추가된 선호기업 <p> </H4>
			               <div style="width:100%; height:410px; overflow:auto">
			                  	
			                  <table id ="example-table-1" class="table table-bordered text-center">
			                       
			                     <c:forEach var = "list" items="${list}">
			                        <tr id = "f_${list.c_no}" style="overflow-x:hidden;">
			                           <td>
			                           	<form action="/corporation/search" method="post">
			                           		<input type="hidden" name="c_no" value="${list.c_no }">
			                           		<input class="btn" type="submit" value='${list.c_name}' style="background-color:transparent;">
			                           	</form>
			                           </td>
			                        </tr>
			                     </c:forEach>
			                  </table>
			                  </div>
			               </div>
			               <div role="tabpanel" class="tab-pane" id="stock">
			                   <!-- tab2 -->
			                  <div class="table-responsive">
			                     <table id ="example-table-1" class="table table-bordered text-center">
			                           <tr>
			                              <th>순위</th>
			                              <th>기업명</th>
			                              <th>등록수</th>
			                           </tr>
			                        <c:forEach var = "list2" items="${list2}" varStatus="status">
			                           <tr id = "f_${list2.c_no}" style="overflow-x:hidden;">
			                              <td> <c:if test="${status.count eq '1'}">
                              <input type="image" src="./resources/images/r1.png" width="20px;" >
                              </c:if>
                              <c:if test="${status.count eq '2'}">
                              <input type="image" src="./resources/images/r2.png" width="20px;" >
                              </c:if>
                              <c:if test="${status.count eq '3'}">
                              <input type="image" src="./resources/images/r3.png" width="20px;" >
                              </c:if>
                              <c:if test="${status.count ne '1' && status.count ne '2' && status.count ne '3'}">
                              ${status.count}
                              </c:if>
                             </td>
			                              
			                              <td>
							                <form action="/corporation/search" method="post">
							             		<input type="hidden" name="c_no" value="${list2.c_no }">
							             		<input class="btn" type="submit" value='${list2.c_name}' style="background-color:transparent;">
							             	</form>
			                              </td>
			                              <td>
			                              ${list2.cnt}
			                              </td>
			                           </tr>
			                        </c:forEach>
			                     </table>
			                  </div>
			               </div>
			            </div>
			         </div>
      </div>
				
</div>


<div class="modal fade"  id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">CFR에 문의하기</h4>
      </div>
      <div class="modal-body">
      
      	<form class="form-horizontal" method="post" action="/question/regist">
		  <div class="form-group">
		    <label for="inputEmail3" class="col-sm-2 control-label">Email</label>
		    <div class="col-sm-10">
				<input type="email" class="form-control" name="q_email" placeholder="답변받을 E-mail을 입력하세요." required>
		    </div>
		   </div>
		   
		   <div class="form-group">
		    <label for="inputPassword3" class="col-sm-2 control-label">제목</label>
		    <div class="col-sm-10">
		    	<select name=q_category class="form-control">
				  <option>----------문의사항선택----------</option>
				  <option value="1">미등록 기업에 대한 정보를 요청합니다.</option>
				  <option value="2">기업 정보 수정을 요청합니다.</option>
				  <option value="3">건의 및 개선사항이 있습니다.</option>
				  <option value="9">기타 문의입니다.</option>
				</select>
		    </div>
		   </div>
		   
		   <div class="form-group">
		    <label class="col-sm-2 control-label">내용</label>
		    <div class="col-sm-10">
		    	<textarea class="form-control" name="q_contents" rows="5" placeholder="문의 내용을 입력하세요." required></textarea>
		    </div>
		    
		  </div>
		
        
     
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
	        <button type="submit" class="btn btn-primary">전송</button>
	      </div>
      </form>
       </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

</div>

    
      
      
</body>
</html>
