<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/include/headerScript.jsp" %>

<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- Chart.js 쓰기위해 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.min.js"></script>
<script src="/resources/chartjs/samples/utils.js"></script>

<!-- 사이드바 -->
<style type="text/css">
   .a{
   width: 65px;
   height: 65px;
   }
   </style>
   
<!-- help -->
<style type="text/css">
   .help{
   width: 12px;
   height: 12px;
   }
   </style>

<!-- 관심기업넣기 -->
<style>
@import url(http://fonts.googleapis.com/css?family=Roboto);

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
/* 버튼배경 투명하게 */
.btn {
    background-color: transparent;
}
/* 스크롤 애니메이션 */
div.imgTopic {position:relative;width:80px;height:80px;font-family:’Dotum’,’돋움’,sansserif;border: 1px solid #eee}
div.imgTopic a {text-decoration: none} 
h1.title {position:absolute;z-index:1;left:5px;bottom:30px}
h1.title a{font-size:18px;font-weight:bold;color:#fff;}
h1.title a:hover, h1.title a:focus {text-decoration:underline;}
p.content a {font-size:11px;color:#ccc;}
/* 스크롤 애니메이션 */
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
			var c_name = document.getElementById("cc_name").value;
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
					    document.body.appendChild(form);
					    form.submit();
					    if(data==1){
					    	var form = document.createElement("form");
						    form.setAttribute("method", 'post');
						    form.setAttribute("action", '/corporation/search');
						    var hiddenField4 = document.createElement("input");
					        hiddenField4.setAttribute("type", "hidden");
					        hiddenField4.setAttribute("name", "c_name");
					        hiddenField4.setAttribute("value", c_name);
					        form.appendChild(hiddenField4);
					        document.body.appendChild(form);
						    form.submit();
					    }
				}
			});	
		}
	</script>
	<script> // 바형 그래프
        var color = Chart.helpers.color;
        var colors = [window.chartColors.red,
							window.chartColors.orange,
							window.chartColors.yellow,
							window.chartColors.green,
							window.chartColors.blue,
							window.chartColors.purple]
        var ranColor = colors[Math.floor(Math.random()*6)];
        var AbarChartData = {
            labels: ["2014년", "2015년", "2016년"],
            datasets: [{
                label: '매출액',
                backgroundColor: color(ranColor).alpha(0.5).rgbString(),
                borderColor: ranColor,
                borderWidth: 1,
                data: [
                	'${A.c_2014 }',
                	'${A.c_2015 }',
                	'${A.c_2016 }'
                ]
            }]
        };
        ranColor = colors[Math.floor(Math.random()*6)];
        var BbarChartData = {
                labels: ["2014년", "2015년", "2016년"],
                datasets: [{
                	label: '영업이익',
                	backgroundColor: color(ranColor).alpha(0.5).rgbString(),
                    borderColor: ranColor,
                    borderWidth: 1,
                    data: [
                    	'${B.c_2014 }',
                    	'${B.c_2015 }',
                    	'${B.c_2016 }'
                    ]
                }]
            };
        ranColor = colors[Math.floor(Math.random()*6)];
        var CbarChartData = {
                labels: ["2014년", "2015년", "2016년"],
                datasets: [{
                	label: '순이익',
                	backgroundColor: color(ranColor).alpha(0.5).rgbString(),
                    borderColor: ranColor,
                    borderWidth: 1,
                    data: [
                    	'${C.c_2014 }',
                    	'${C.c_2015 }',
                    	'${C.c_2016 }'
                    ]
                }]
            };
    </script>
    <script>   // 방사형
    var randomScalingFactor = function() {
        return Math.round(Math.random() * 100);
    };

    ranColor = colors[Math.floor(Math.random()*6)];
    var ranColor2 = colors[Math.floor(Math.random()*6)];
    var config2016 = {
        type: 'radar',
        data: {
            labels: ["유동비율", "현금비율", "부채비율", "비유동비율", "매출액영업이익률", "매출액증가율", "총자산회전율"],
            datasets: [{
                label: "업종평균",
                backgroundColor: color(window.chartColors.grey).alpha(0).rgbString(),
                borderColor: color(window.chartColors.grey),
                data: [
                   1,1,1,1,1,1,1
                ]
            }, {
                label: '${cor_info.c_name } 관계비율',   
                backgroundColor: color(ranColor2).alpha(0.5).rgbString(),
                borderColor: ranColor2,
                data: [
                   '${(D.c_2016/J.c_2016)*100/f1.f_2016 }',
                   '${(E.c_2016/J.c_2016)*100/f6.f_2016 }', //현금비율
                   '${(L.c_2016/M.c_2016)*100/f2.f_2016 }',
                   '${(H.c_2016/M.c_2016)*100/f3.f_2016 }',
                   '${((B.c_2016/A.c_2016)*100+100)/(f4.f_2016+100) }',
                   '${(((A.c_2016-A.c_2015)/A.c_2015)*100+100)/(f5.f_2016+100) }',
                   '${(A.c_2016/I.c_2016)/f8.f_2016 }' //총자산회전율
                ]
            },]
        },
        options: {
            legend: {
                position: 'bottom',
            },
            title: {
                display: true,
                text: '${cor_info.c_name }'+' 업종평균 대비 관계비율'
            },
            scale: {
              ticks: {
                beginAtZero: true,
                max: 4,
                stepSize: 0.5
              }
            }
        }
    };
    ranColor2 = colors[Math.floor(Math.random()*7)];
    var config2015 = {
            type: 'radar',
            data: {
                labels: ["유동비율", "현금비율", "부채비율", "비유동비율", "매출액영업이익률", "매출액증가율", "총자산회전율"],
                datasets: [{
                    label: "업종평균",
                    backgroundColor: color(window.chartColors.grey).alpha(0).rgbString(),
                    borderColor: color(window.chartColors.grey),
                    data: [
                        1,1,1,1,1,1,1
                    ]
                }, {
                    label: '${cor_info.c_name } 관계비율',
                    backgroundColor: color(ranColor2).alpha(0.5).rgbString(),
                    borderColor: ranColor2,
                    data: [
                       '${(D.c_2015/J.c_2015)*100/f1.f_2015 }',
                       '${(E.c_2015/J.c_2015)*100/f6.f_2015 }', //현금비율
                       '${(L.c_2015/M.c_2015)*100/f2.f_2015 }',
                       '${(H.c_2015/M.c_2015)*100/f3.f_2015 }',
                       '${((B.c_2015/A.c_2015*100)+100)/(f4.f_2015+100) }',
                       '${(((A.c_2015-A.c_2014)/A.c_2014*100)+100)/(f5.f_2015+100) }',
                       '${(A.c_2015/I.c_2015)/f8.f_2015 }' //총자산회전율
                    ]
                },]
            },
            options: {
                legend: {
                    position: 'bottom',
                },
                title: {
                    display: true,
                    text: '${cor_info.c_name }'+' 재무비율'
                },
                scale: {
                  ticks: {
                    beginAtZero: true,
                    max: 4,
                    stepSize: 0.5
                  }
                }
            }
        };
    </script>
	<script>	// 차트 온로드
     window.onload = function() {
        window.myRadar = new Chart(document.getElementById("R2016"), config2016);
        window.myRadar = new Chart(document.getElementById("R2015"), config2015);
        
        var Actx = document.getElementById("A").getContext("2d");
        var Bctx = document.getElementById("B").getContext("2d");
        var Cctx = document.getElementById("C").getContext("2d");
        window.myBar = new Chart(Actx, {
            type: 'bar',
            data: AbarChartData,
            options: {
                responsive: true,
                legend: {position: 'hide'},
                title: {
                    display: true,
                    text: '매출액'
                }
            }
        });
        window.myBar = new Chart(Bctx, {
            type: 'bar',
            data: BbarChartData,
            options: {
                responsive: true,
                legend: {position: 'hide'},
                title: {
                    display: true,
                    text: '영업이익'
                }
            }
        });
        window.myBar = new Chart(Cctx, {
            type: 'bar',
            data: CbarChartData,
            options: {
                responsive: true,
                legend: {position: 'hide'},
                title: {
                    display: true,
                    text: '순이익'
                }
            }
        });
    }; 
    </script>
	<!-- 설명충 -->    
    <script>
		$(document).ready(function(){
			$('[data-toggle="popover"]').popover();   
		});
	</script>
	<!-- 페이징 -->
	<script type="text/javascript">
	    $(document).ready(pageGo);
	    
		var pageNum = 1;
		var news = ${News};
	    var totalitems = news.display;			// 총 기사수
	    var itemPerPage = 3;							// 한페이지당 기사 수
	    var totalPage = parseInt(totalitems/itemPerPage)+1;	// 총페이지수(마지막 페이지 수)
		
		function pageDown(){
			if(pageNum != 1){
				pageNum--;
			}
	    	pageGo();
		}
		function pageUp(){
			if(pageNum != totalPage){
				pageNum++;
			}
			pageGo();
		}
		function pageGo(){
		    var pageStartIndex = parseInt((pageNum-1)*3);		//  현재페이지 시작 기사 인덱스
		    var pageLastIndex = (pageNum == totalPage) ? totalitems-1 : pageNum * itemPerPage -1;	// 현재페이지 마지막 기사 인덱스
		    
		    $("#article").empty();
		    
		    for(var i = pageStartIndex; i <= pageLastIndex; i++){
				$('#article').append('<a href='+news.items[i].link+'>'+'<h5>'+news.items[i].title+'<h5>'+'</a>');
				$('#article').append('<p>'+news.items[i].description+'</p>');
				$('#article').append('<p>'+news.items[i].pubDate+'</p>');
		    }
		    if(pageNum==1){
		    	$("#pageDown").attr("class","disabled");
		    } else if (pageNum == totalPage){
		    	$("#pageUp").attr("class","disabled");
		    } else {
		    	$("#pageDown").removeAttr("class");
		    	$("#pageUp").removeAttr("class");
		    }
		}
	</script>


</head>


<title>${cor_info.c_name }의 기업정보</title>
<style type="text/css">
		body{background:url('../resources/images/sample2.png') 
		no-repeat center center fixed; -webkit-background-size: cover;-moz-background-size: cover;
		-o-background-size: cover;background-size: cover;} 
		}
	</style>
<body>

<div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
	<div class="modal-dialog">
		<!--loginmodal-container 부트스트랩 부분 --> 
		<div class="loginmodal-container">
			<p style="color: red;">로그인이 필요합니다</p>
			<h4>로그인안내창</h4><br>
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
<%-- 
<div><h1>연관 기업</h1><br>
${corList }
</div>
 --%>
<div class="container-fluid">

<div class="row">
<!-- 스크롤 애니메이션 -->
 <div class="col-md-1 col-lg-2" > 
 	<br>
    <div  style=" height: auto; width: 250px; position: fixed; padding:10px;">
		<br><input type="image" class="a" src="../resources/images/testA.png" 
		border="0" onclick="$('html, body').stop().animate( { scrollTop : '0' } );"><br><br>
		<input type="image" class="a" src="../resources/images/testB.png" 
		border="0" onclick="$('html, body').stop().animate( { scrollTop : '600' } );"><br><br>
		<input type="image" class="a" src="../resources/images/testC.png" 
		border="0" onclick="$('html, body').stop().animate( { scrollTop : '1200' } );"><br><br>
		<input type="image" class="a" src="../resources/images/testD.png" 
		border="0" onclick="$('html, body').stop().animate( { scrollTop : '1500' } );">
      </div>
      </div>
<div class="col-xs-12 col-md-10 col-lg-8" >
	<div class="row" style="border: 1px solid #F2F2F2">
		<div class="col-xs-12 col-md-6 col-lg-6"  >
		

			<%-- <h1>${cor_info.c_name } </h1> --%>
			<c:if test="${m_name eq null }">
				<input type="hidden" name="test" id="cc_name" value="${cor_info.c_name }"> 
				<h1>${cor_info.c_name }
				<button class="btn" id="btn" data-toggle="modal"  data-target="#login-modal" onclick="login()">
					<input type="image" src="../resources/images/heart.png" width="30px;" >
				</button></h1>
				<h5>${apiCorInfo.crp_nm_e }</h5>
				<br>
				<%-- <h1>${cor_info.c_name }</h1>
				<input type = "button" data-toggle="modal" data-target="#login-modal" class="btn btn-default" onclick= "login()" value="선호기업등록">  --%>
			<!-- <a href="#" data-toggle="modal" data-target="#login-modal" onclick= "login()">Login</a> -->
			</c:if>
			<c:if test="${m_name ne null }">
			<form action="/favorite/regist" method="post">
				<input type="hidden" name="c_no" id="cc_no" value="${cor_info.c_no }"> 
				<h1>${cor_info.c_name } <input type="image" src="../resources/images/heart.png" width="30px;" ></h1>
				&nbsp;&nbsp;<h5>${apiCorInfo.crp_nm_e }</h5>
				<!-- <input type="submit" class="btn btn-default" value="선호기업 등록" > <br> -->
			</form>
			</c:if>
		
			<!--기업개요 -->
			<label>업종코드</label>
			${cor_info.type_code } <br>
			<label>업종명</label>
			${cor_info.type } <br>
			<label>종목코드</label>
			${cor_info.cp_code } <br>
			<label>법인구분</label>
			<c:if test="${apiCorInfo.crp_cls eq 'Y'}">
				코스피상장기업
			</c:if>
			<c:if test="${apiCorInfo.crp_cls eq 'K'}">
				코스닥상장기업
			</c:if>
			<c:if test="${apiCorInfo.crp_cls eq 'N'}">
				코넥스상장기업
			</c:if>
			<c:if test="${apiCorInfo.crp_cls eq 'E'}">
				기타 기업
			</c:if><br>
			<label>대표자명</label>
			${apiCorInfo.ceo_nm } <br>
			<label>설립일</label>
			${apiCorInfo.est_dt } <br>
			<label>대표전화</label>
			${apiCorInfo.phn_no } <br>
			<label>주소</label>
			${apiCorInfo.adr } <br>
			<label>홈페이지</label>
			<a href="http://${apiCorInfo.hm_url }">${apiCorInfo.hm_url } </a><br>
			<%-- <label>api</label>
			${apiCorInfo } <br>
			 <br><br>
			<!-- 임시 -->
		 --%>
			<br><br><br><br>
			<br>
		</div>
		
		<div class="col-xs-12 col-md-6 col-lg-6" >
			<div role="tabpanel">
				<!-- Nav tabs -->
				<ul class="nav nav-tabs" role="tablist">
					<li role="presentation" class="active"><a href="#map" aria-controls="map" role="tab" data-toggle="tab">지도</a></li>
					<li role="presentation"><a href="#stock" aria-controls="stock" role="tab" data-toggle="tab">주식</a></li>
				</ul>
				<!-- Tab panes -->
				<div class="tab-content">
					<div role="tabpanel" class="tab-pane active" id="map">
						<div id="daumMap" style="width:100%;height:350px;"></div>
					</div>
					<div role="tabpanel" class="tab-pane" id="stock">
						<!-- 주가정보 -->
						<div class="table-responsive">
							<table class="table table-hover table-condensed">
								<tr>
									<td colspan="1" align=right >종목명</td>
									<td colspan="3" align=right >${map.stockprice.TBL_StockInfo.JongName }</td>
									<td colspan="3" align=right >현재가</td>
									<td colspan="3" align=right >${map.stockprice.TBL_StockInfo.CurJuka}</td>
								 </tr>
								 <tr>
									<td colspan="1" align=right >전일대비</td>
									<td colspan="3" align=right >${map.stockprice.TBL_StockInfo.Debi}</td>
									<td colspan="3" align=right >전일종가</td>
									<td colspan="3" align=right >${map.stockprice.TBL_StockInfo.PrevJuka}</td>
								 </tr>
								 <tr>
									<td colspan="1" align=right >거래량</td>
									<td colspan="3" align=right >${map.stockprice.TBL_StockInfo.Volume}</td>
									<td colspan="3" align=right >거래대금</td>
									<td colspan="3" align=right >${map.stockprice.TBL_StockInfo.Money}</td>
								 </tr>
								 <tr>
									<td colspan="1" align=right >저가</td>
									<td colspan="3" align=right >${map.stockprice.TBL_StockInfo.LowJuka}</td>
								   <td rowspan="2" colspan="2" align=right >52주</td>
								   <td colspan="2" align=right >최저</td>
									<td colspan="2" align=right >${map.stockprice.TBL_StockInfo.Low52}</td>
								 </tr>
								 <tr>
									<td colspan="1" align=right >고가</td>
									<td colspan="3" align=right >${map.stockprice.TBL_StockInfo.HighJuka}</td>
									<td colspan="2" align=right >최고</td>
									<td colspan="2" align=right >${map.stockprice.TBL_StockInfo.High52}</td>
								</tr>
								 <tr>
									<td colspan="1" align=right >시가</td>
									<td colspan="3" align=right >${map.stockprice.TBL_StockInfo.StartJuka}</td>
									<td colspan="3" align=right >PER</td>
									<td colspan="3" align=right >${map.stockprice.TBL_StockInfo.Per}</td>
								 </tr>
								  <tr>
									<td colspan="1" align=right >상한가</td>
									<td colspan="3" align=right >${map.stockprice.TBL_StockInfo.UpJuka}</td>
									<td colspan="3" align=right >하한가</td>
									<td colspan="3" align=right >${map.stockprice.TBL_StockInfo.DownJuka}</td>
								 </tr>
								  <tr>
									<td colspan="1" align=right >상장주식수</td>
									<td colspan="3" align=right >${map.stockprice.TBL_StockInfo.Amount}</td>
									<td colspan="3" align=right >액면가</td>
									<td colspan="3" align=right >${map.stockprice.TBL_StockInfo.FaceJuka}</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
      <div class="row">
         <div class="col-sm-4 col-md-4">
            <div class="table-responsive">
              	<table class="table table-hover">
              		<!-- <thead>매출액</thead> -->
              		<tbody>
	              		<tr>
	              			<th></th>
	              			<th>2014년</th>
	              			<th>2015년</th>
	              			<th>2016년</th>
						
	              		</tr>
	              		<tr>
	              			<%-- <td>${cor_info.c_name }</td> --%>
	              			<td>매출액</td>
	              			<td><fmt:formatNumber type="currency" value="${(A.c_2014)/100000000 }" pattern="###,###억 원" /></td>
	              			<%-- <td>${A.c_2014 } </td> --%>
	              			<td><fmt:formatNumber type="currency" value="${(A.c_2015)/100000000 }" pattern="###,###억 원" /></td>
	              			<td><fmt:formatNumber type="currency" value="${(A.c_2016)/100000000 }" pattern="###,###억 원" /></td>
	              		</tr>
              		</tbody>
				</table>
              </div>
            <canvas id="A"></canvas>
         </div>
         <div class="col-sm-4 col-md-4">
            <div class="table-responsive">
              	<table class="table table-hover">
              		<!-- <thead>영업이익</thead> -->
              		<tbody>
	              		<tr>
	              			<th></th>
	              			<th>2014년</th>
	              			<th>2015년</th>
	              			<th>2016년</th>
						
	              		</tr>
	              		<tr>
	              			<%-- <td>${cor_info.c_name }</td> --%>
	              			<td>영업이익</td>
	              			<td><fmt:formatNumber type="currency" value="${(B.c_2014)/100000000 }" pattern="###,###억 원" /></td>
	              			<td><fmt:formatNumber type="currency" value="${(B.c_2015)/100000000 }" pattern="###,###억 원" /></td>
	              			<td><fmt:formatNumber type="currency" value="${(B.c_2016)/100000000 }" pattern="###,###억 원" /></td>
	              		</tr>
              		</tbody>
				</table>
              </div>
            <canvas id="B"></canvas>
         </div>
         <div class="col-sm-4 col-md-4">
            <div class="table-responsive">
              	<table class="table table-hover">
              		<!-- <thead>당기순이익</thead> -->
              		<tbody>
	              		<tr>
	              			<th></th>
	              			<th>2014년</th>
	              			<th>2015년</th>
	              			<th>2016년</th>
						
	              		</tr>
	              		<tr>
	              			<%-- <td>${cor_info.c_name }</td> --%>
	              			<td>순이익</td>
	              			<td><fmt:formatNumber type="currency" value="${(C.c_2014)/100000000 }" pattern="###,###억 원" /></td>
	              			<td><fmt:formatNumber type="currency" value="${(C.c_2015)/100000000 }" pattern="###,###억 원" /></td>
	              			<td><fmt:formatNumber type="currency" value="${(C.c_2016)/100000000 }" pattern="###,###억 원" /></td>
	              		</tr>
              		</tbody>
				</table>
              </div>
            <canvas id="C"></canvas>
         </div>
      </div>
      <br><br>
      
      <div role="tabpanel">
         <!-- Nav tabs -->
         <ul class="nav nav-tabs" role="tablist">
           <li role="presentation" class="active"><a href="#c_2016" aria-controls="c_2016" role="tab" data-toggle="tab">2016년</a></li>
           <li role="presentation"><a href="#c_2015" aria-controls="c_2015" role="tab" data-toggle="tab">2015년</a></li>
         </ul>
         <!-- Tab panes -->
         <div class="tab-content">
           <div role="tabpanel" class="tab-pane active" id="c_2016">
              <canvas id="R2016"></canvas>     	
	              <div class="table-responsive" style="margin-right:180px;">
	              	<table class="table table-hover">
	              		<thead>2016년 재무비율</thead>
	              		<tbody align="center">
		              		<tr>
		              			<th></th>
		              			<th><!-- 유동비율 --> 
	   								유동비율(%)
	   								<input type="image" class="help" src="../resources/images/help.png" data-toggle="popover" title="(유동자산/유동부채) × 100" data-content="유동비율은 기업의 유동성을 판단하는 지표입니다. 유동성이란 자산을 현금으로 전환할 수 있는 정도를 나타내며 기업의 단기 채무에 대한 지급능력을 측정하고 평가하는 지표로 활용됩니다." data-trigger="hover" />
								</th>
		              			<th><!-- 현금비율 -->
									현금비율(%)
									<input type="image" class="help" src="../resources/images/help.png"  data-toggle="popover" title="(현금성자산/유동부채) × 100" data-content="현금비율은 유동자산 중 특히 현금 및 현금성자산과 유동부채와의 관계를 나타내는 지표로서 유동부채 100에 대해 현금이 몇 %나 되는가를 나타내는 비율입니다. 기업의 지급능력의 상태를 판단하는 보조비율로서 20% 이상을 이상적으로 보고 있습니다." data-trigger="hover" />
								</th>
		              			<th><!-- 부채비율 -->
									부채비율(%)
									<input type="image" class="help" src="../resources/images/help.png"  data-toggle="popover" title="(부채/자기자본) × 100" data-content="부채비율은 기업이 타인자본에 의존하고 있는 정도를 나타내는 비율입니다. 장기채무에 대한 원금 및 이자의 지급능력을 평가하는 지표로서 유동비율과 함께 재무위험을 측정하는 지표로 활용됩니다." data-trigger="hover" />
								</th>
		              			<th><!-- 비유동비율 -->	
		              				비유동비율(%)
		              				<input type="image" class="help" src="../resources/images/help.png"  data-toggle="popover" title="(비유동자산/자기자본) × 100" data-content="비유동비율은 조달된 자본이 기업의 자산에 얼마나 적절히 배분되고 있는 지를 측정하는 비율입니다. 기업이 장기적으로 경기변동, 시장여건 변화 등 경제변화에 잘 적응할 수 있는 지를 분석하기 위한 지표로 활용됩니다." data-trigger="hover" />
		              			</th>
		              			<th><!-- 매출액영업이익률 -->	
									매출액영업이익률(%)
									<input type="image" class="help" src="../resources/images/help.png"  data-toggle="popover" title="(영업이익/매출액) × 100" data-content="매출액영업이익률은 기업의 경영활동 중 매출액에 대한 영업이익의 관계를 나타내는 비율로서 제조 및 판매활동과 직접적 관련이 있는 영업이익만을 매출액과 대비한 것이므로 곧 판매마진을 나타낸다고 볼 수 있습니다. 기업의 주된 영업활동의 능률을 측정하는 지표로 활용됩니다." data-trigger="hover" />
		              			</th>
		              			<th><!-- 매출액증가율 -->
		              				매출액증가율(%)
		              				<input type="image" class="help" src="../resources/images/help.png"  data-toggle="popover" title="{(당기매출-전기매출)/전기매출} × 100" data-content="매출액증가율은 성장성의 분석에 사용되는 지표로서 기준연도 매출액에 대한 비교연도 매출액의 증가율을 의미합니다. 기업의 규모 및 성과가 전년에 비해 얼마나 증가하였는지를 측정하는 지표로 활용됩니다." data-trigger="hover" />
		              			</th>
		              			<th><!-- 총자산회전율 -->
		              				총자산회전율(회)
		              				<input type="image" class="help" src="../resources/images/help.png"  data-toggle="popover" title="매출액/총자산  (회)" data-content="총자산회전율은 기업이 소유하고 있는 자산들을 얼마나 효과적으로 이용하고 있는가를 측정하는 활동성비율의 하나로서 기업의 총자산이 1년에 몇 번이나 회전하였는가를 나타냅니다. 총자산회전율이 높으면 유동자산·비유동자산등이 효율적으로 이용되고 있다는 것을 뜻하며, 반대로 낮으면 과잉투자와 같은 비효율적인 투자를 하고 있음을 의미합니다." data-trigger="hover" />
		              			</th>
		              		</tr>
		              		<tr>
		              			<td>${cor_info.c_name }</td> <!-- 기업수치 -->
		              			<td><fmt:formatNumber value="${(D.c_2016/J.c_2016)*100}" pattern="0.00"></fmt:formatNumber>  </td> <!-- 유동비율 -->
		              			<td><fmt:formatNumber value="${(E.c_2016/J.c_2016)*100}" pattern="0.00"></fmt:formatNumber>  </td> <!-- 현금비율 -->
		              			<td><fmt:formatNumber value="${(L.c_2016/M.c_2016)*100}" pattern="0.00"></fmt:formatNumber>  </td> <!-- 부채비율 -->
		              			<td><fmt:formatNumber value="${(H.c_2016/M.c_2016)*100}" pattern="0.00"></fmt:formatNumber>  </td> <!-- 비유동비율 -->
		              			<td><fmt:formatNumber value="${((B.c_2016/A.c_2016)*100)}" pattern="0.00"></fmt:formatNumber>  </td> <!-- 매출액영업이익률 -->
		              			<td><fmt:formatNumber value="${(((A.c_2016-A.c_2015)/A.c_2015)*100)}" pattern="0.00"></fmt:formatNumber>  </td> <!-- 매출액증가율 -->
		              			<td><fmt:formatNumber value="${(A.c_2016/I.c_2016)}" pattern="0.00"></fmt:formatNumber>  </td> <!-- 총자산회전율 -->
		              		</tr>
		              		<tr>
		              			<td>업종평균</td>
		              			<td>${f1.f_2016 }</td> <!-- 유동비율 -->
		              			<td>${f6.f_2016 }</td> <!-- 현금비율 -->
		              			<td>${f2.f_2016 }</td> <!-- 부채비율 -->
		              			<td>${f3.f_2016 }</td> <!-- 비유동비율 -->
		              			<td>${f4.f_2016 }</td> <!-- 매출액영업이익률 -->
		              			<td>${f5.f_2016 }</td> <!-- 매출액증가율 -->
		              			<td>${f8.f_2016 }</td> <!-- 총자산회전율 -->
		              		</tr>
	              		</tbody>
					</table>
	              </div>
           </div>
           <div role="tabpanel" class="tab-pane" id="c_2015">
              <canvas id="R2015"></canvas>
	              <div class="table-responsive" style="margin-right:180px;">
	              	<table class="table table-hover">
	              		<thead>2015년 재무비율</thead>
	              		<tbody align="center">
		              		<tr>
		              			<th></th>
		              			<th><!-- 유동비율 --> 
	   								유동비율(%)
	   								<input type="image" class="help" src="../resources/images/help.png" data-toggle="popover" title="(유동자산/유동부채) × 100" data-content="유동비율은 기업의 유동성을 판단하는 지표입니다. 유동성이란 자산을 현금으로 전환할 수 있는 정도를 나타내며 기업의 단기 채무에 대한 지급능력을 측정하고 평가하는 지표로 활용됩니다." data-trigger="hover" />
								</th>
		              			<th><!-- 현금비율 -->
									현금비율(%)
									<input type="image" class="help" src="../resources/images/help.png"  data-toggle="popover" title="(현금성자산/유동부채) × 100" data-content="현금비율은 유동자산 중 특히 현금 및 현금성자산과 유동부채와의 관계를 나타내는 지표로서 유동부채 100에 대해 현금이 몇 %나 되는가를 나타내는 비율입니다. 기업의 지급능력의 상태를 판단하는 보조비율로서 20% 이상을 이상적으로 보고 있습니다." data-trigger="hover" />
								</th>
		              			<th><!-- 부채비율 -->
									부채비율(%)
									<input type="image" class="help" src="../resources/images/help.png"  data-toggle="popover" title="(부채/자기자본) × 100" data-content="부채비율은 기업이 타인자본에 의존하고 있는 정도를 나타내는 비율입니다. 장기채무에 대한 원금 및 이자의 지급능력을 평가하는 지표로서 유동비율과 함께 재무위험을 측정하는 지표로 활용됩니다." data-trigger="hover" />
								</th>
		              			<th><!-- 비유동비율 -->	
		              				비유동비율(%)
		              				<input type="image" class="help" src="../resources/images/help.png"  data-toggle="popover" title="(비유동자산/자기자본) × 100" data-content="비유동비율은 조달된 자본이 기업의 자산에 얼마나 적절히 배분되고 있는 지를 측정하는 비율입니다. 기업이 장기적으로 경기변동, 시장여건 변화 등 경제변화에 잘 적응할 수 있는 지를 분석하기 위한 지표로 활용됩니다." data-trigger="hover" />
		              			</th>
		              			<th><!-- 매출액영업이익률 -->	
									매출액영업이익률(%)
									<input type="image" class="help" src="../resources/images/help.png"  data-toggle="popover" title="(영업이익/매출액) × 100" data-content="매출액영업이익률은 기업의 경영활동 중 매출액에 대한 영업이익의 관계를 나타내는 비율로서 제조 및 판매활동과 직접적 관련이 있는 영업이익만을 매출액과 대비한 것이므로 곧 판매마진을 나타낸다고 볼 수 있습니다. 기업의 주된 영업활동의 능률을 측정하는 지표로 활용됩니다." data-trigger="hover" />
		              			</th>
		              			<th><!-- 매출액증가율 -->
		              				매출액증가율(%)
		              				<input type="image" class="help" src="../resources/images/help.png"  data-toggle="popover" title="{(당기매출-전기매출)/전기매출} × 100" data-content="매출액증가율은 성장성의 분석에 사용되는 지표로서 기준연도 매출액에 대한 비교연도 매출액의 증가율을 의미합니다. 기업의 규모 및 성과가 전년에 비해 얼마나 증가하였는지를 측정하는 지표로 활용됩니다." data-trigger="hover" />
		              			</th>
		              			<th><!-- 총자산회전율 -->
		              				총자산회전율(회)
		              				<input type="image" class="help" src="../resources/images/help.png"  data-toggle="popover" title="매출액/총자산  (회)" data-content="총자산회전율은 기업이 소유하고 있는 자산들을 얼마나 효과적으로 이용하고 있는가를 측정하는 활동성비율의 하나로서 기업의 총자산이 1년에 몇 번이나 회전하였는가를 나타냅니다. 총자산회전율이 높으면 유동자산·비유동자산등이 효율적으로 이용되고 있다는 것을 뜻하며, 반대로 낮으면 과잉투자와 같은 비효율적인 투자를 하고 있음을 의미합니다." data-trigger="hover" />
		              			</th>
		              		</tr>
		              		
							
	
	
		              		<tr>
		              			<td>${cor_info.c_name }</td> <!-- 기업수치 -->
		              			<td><fmt:formatNumber value="${(D.c_2015/J.c_2015)*100}" pattern="0.00"></fmt:formatNumber>  </td> <!-- 유동비율 -->
		              			<td><fmt:formatNumber value="${(E.c_2015/J.c_2015)*100}" pattern="0.00"></fmt:formatNumber>  </td> <!-- 현금비율 -->
		              			<td><fmt:formatNumber value="${(L.c_2015/M.c_2015)*100}" pattern="0.00"></fmt:formatNumber>  </td> <!-- 부채비율 -->
		              			<td><fmt:formatNumber value="${(H.c_2015/M.c_2015)*100}" pattern="0.00"></fmt:formatNumber>  </td> <!-- 비유동비율 -->
		              			<td><fmt:formatNumber value="${((B.c_2015/A.c_2015)*100)}" pattern="0.00"></fmt:formatNumber>  </td> <!-- 매출액영업이익률 -->
		              			<td><fmt:formatNumber value="${(((A.c_2015-A.c_2014)/A.c_2014)*100)}" pattern="0.00"></fmt:formatNumber>  </td> <!-- 매출액증가율 -->
		              			<td><fmt:formatNumber value="${(A.c_2015/I.c_2015)}" pattern="0.00"></fmt:formatNumber>  </td> <!-- 총자산회전율 -->
		              		</tr>
		              		<tr>
		              			<td>업종평균</td>
		              			<td>${f1.f_2015 }</td> <!-- 유동비율 -->
		              			<td>${f6.f_2015 }</td> <!-- 현금비율 -->
		              			<td>${f2.f_2015 }</td> <!-- 부채비율 -->
		              			<td>${f3.f_2015 }</td> <!-- 비유동비율 -->
		              			<td>${f4.f_2015 }</td> <!-- 매출액영업이익률 -->
		              			<td>${f5.f_2015 }</td> <!-- 매출액증가율 -->
		              			<td>${f8.f_2015 }</td> <!-- 총자산회전율 -->
		              		</tr>
	              		</tbody>
					</table>
	              </div>
           </div>
         </div>
      </div>
		<br>
		<div class="text-center">
			<a href="https://www.saramin.co.kr/zf_user/search?searchword=${cor_info.c_name }" >
				<img alt="사람인 채용공고" src="/resources/images/saramin.png" width="30%">
			</a>
			<a href="https://www.jobkorea.co.kr/Search/?stext=${cor_info.c_name }" >
				<img alt="잡코리아 채용공고" src="/resources/images/jobkorea.png" width="30%">
			</a>
		</div>
			  
			  <br>

	
	<%-- <label>A매출액</label>${A.c_2016 } <br>
	<label>B영업이익손실</label>${B.c_2016 } <br>
	<label>C당기순이익</label>${C.c_2016 } <br>
	<label>D유동자산</label>${D.c_2016 } <br>
	<label>E현금및현금성자산</label>${E.c_2016 } <br>
	<label>F매출채권</label>${F.c_2016 } <br>
	<label>H비유동자산</label>${G.c_2016 } <br>
	<label>I자산총계</label>${H.c_2016 } <br>
	<label>J유동부채</label>${I.c_2016 } <br>
	<label>K매입채무</label>${J.c_2016 } <br>
	<label>L부채총계</label>${K.c_2016 } <br>
	<label>M자본총계</label>${L.c_2016 } <br>
	
	<label>f1유동비율</label>${f1.f_2016 } <br>
	<label>f2부채비율</label>${f2.f_2016 } <br>
	<label>f3비유동비율</label>${f3.f_2016 } <br>
	<label>f4매출액영업이익률</label>${f4.f_2016 } <br>
	<label>f5매출액증가율</label>${f5.f_2016 } <br>
	<label>f6현금및현금성자산비율</label>${f6.f_2016 } <br>
	<label>f7매출액순이익률</label>${f7.f_2016 } <br>
	<label>f8총자산회전율</label>${f8.f_2016 } <br>
	<label>f9재고자산회전율</label>${f9.f_2016 } <br>
	<label>f10매출채권회전율</label>${f10.c_2016 } <br>
	<label>f11매입채무회전율</label>${f11.c_2016 } <br> --%>
	
<!-- 뉴스기사 -->
		<div class="media">
		  <div class="media-body" id="article">
		  	"<b>굵게</b>"
		  </div>
		</div>
		<nav>
			<ul class="pager">
				<li id="pageDown" ><a href="javascript:pageDown();" >Previous</a></li>
				<li id="pageUp"><a href="javascript:pageUp();" >Next</a></li>
			</ul>
		</nav>

</div>
 <div class="col-md-1 col-lg-2" >
 </div>
</div>
</div>
<!-- DaumMap  -->
  <!-- Load Daum Map Javascript API -->
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9149b94a81dc78fae9009a1a3ebf7cd9&libraries=services"></script>
  <script type="text/javascript">
  var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
  mapOption = {
      center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
      level: 3 // 지도의 확대 레벨
  };  
//지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption); 
//주소-좌표 변환 객체를 생성합니다
var geocoder = new daum.maps.services.Geocoder();
//주소로 좌표를 검색합니다
geocoder.addressSearch('${apiCorInfo.adr }', function(result, status) {
  // 정상적으로 검색이 완료됐으면 
   if (status === daum.maps.services.Status.OK) {
      var coords = new daum.maps.LatLng(result[0].y, result[0].x);
      // 결과값으로 받은 위치를 마커로 표시합니다
      var marker = new daum.maps.Marker({
          map: map,
          position: coords
      });
      // 인포윈도우로 장소에 대한 설명을 표시합니다
      var infowindow = new daum.maps.InfoWindow({
          content: '<div style="width:150px;text-align:center;padding:6px 0;">${cor_info.c_name}</div>'
      });
      infowindow.open(map, marker);
      // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
      map.setCenter(coords);
  } 
});
  </script>
</body>
</html>