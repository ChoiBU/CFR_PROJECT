<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/views/include/headerScript.jsp" %>


<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- Chart.js 쓰기위해 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.1/Chart.min.js"></script>
<script src="/resources/chartjs/samples/utils.js"></script>


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


</style>
<script>
function login() {
    alert("로그인이 필요합니다.");
}
</script>

<!-- 관심기업넣기 -->



<style>
td,body,span { font-size : 9pt ; font-family: '돋움','verdana','arial', 'sans-serif'; }
a.link.kosdaq {
    COLOR: #7F7F7F; TEXT-DECORATION: underline;
}
a.active.kosdaq {
    COLOR: #7F7F7F; TEXT-DECORATION: none;
}
a.visited.kosdaq {
    COLOR: #7F7F7F; TEXT-DECORATION: underline;
}
a.hover.kosdaq {
 COLOR:#7F7F7F; TEXT-DECORATION: underline;
}
TD.title_defult {  
    background-color: #81ACC6;
}
TD.body_a {  
    background-color: #C3CACC;
}
TD.body_b {  
    background-color: #EEF9F9;
}
TD.kdaqTitle2Bg {  
    background-color: #F6F7E4;
}
TD.body_1 {  
    background-color: #EFEFEF;
    font-size: 9pt;
}
TD.body_0 {  
    background-color: #FFFFFF;
    font-size: 9pt;
}
.FONT_title_defult{
    color: #FFFFFF; 
    font-size:9pt; 
    font-family:"돋움"
}
.FONT_Title2Col{
    color: #000000; 
    font-size:9pt; 
    font-family:"돋움"
}
.FONT_body_0{
    color: #000000; 
    font-size:9pt; 
    font-family:"돋움"
}
.FONT_body_1{
    color: #000000; 
    font-size:9pt; 
    font-family:"돋움"
}

#toparea {
margin-left: 80px;
margin-top: 20px;
}
</style>
<title>Insert title here</title>

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
            labels: ["유동비율", "부채비율", "비유동비율", "매출액영업이익률", "매출액증가율"],
            datasets: [{
                label: "업종평균",
                backgroundColor: color(window.chartColors.grey).alpha(0).rgbString(),
                borderColor: color(window.chartColors.grey),
                data: [
                   1,1,1,1,1
                ]
            }, {
                label: '${cor_info.c_name }',
                backgroundColor: color(ranColor2).alpha(0.5).rgbString(),
                borderColor: ranColor2,
                data: [
                   '${(D.c_2016/J.c_2016)*100/f1.f_2016 }',
                   '${(L.c_2016/M.c_2016)*100/f2.f_2016 }',
                   '${(H.c_2016/M.c_2016)*100/f3.f_2016 }',
                   '${(B.c_2016/A.c_2016)*100/f4.f_2016 }',
                   '${(((A.c_2016-A.c_2015)/A.c_2015)*100+100)/(f5.f_2016+100) }'
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
                beginAtZero: true
              }
            }
        }
    };
    ranColor2 = colors[Math.floor(Math.random()*7)];
    var config2015 = {
            type: 'radar',
            data: {
                labels: ["유동비율", "부채비율", "비유동비율", "매출액영업이익률", "매출액증가율"],
                datasets: [{
                    label: "업종평균",
                    backgroundColor: color(window.chartColors.grey).alpha(0).rgbString(),
                    borderColor: color(window.chartColors.grey),
                    data: [
                        1,1,1,1,1
                    ]
                }, {
                    label: '${cor_info.c_name }',
                    backgroundColor: color(ranColor2).alpha(0.5).rgbString(),
                    borderColor: ranColor2,
                    data: [
                       ${(D.c_2015/J.c_2015*100)/f1.f_2015 },
                       ${(L.c_2015/M.c_2015*100)/f2.f_2015 },
                       ${(H.c_2015/M.c_2015*100)/f3.f_2015 },
                       ${(B.c_2015/A.c_2015*100)/f4.f_2015 },
                       ${(((A.c_2015-A.c_2014)/A.c_2014*100)+100)/(f5.f_2015+100) }
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
                    beginAtZero: true
                  }
                }
            }
        };
    </script>
   <script>   // 차트 온로드
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


</head>
<body>   
   <!-- 유동비율 -->
   <div class="container">
      <a href="#" data-toggle="popover" title="(유동자산/유동부채) × 100" data-content="유동비율은 기업의 유동성을 판단하는 지표입니다. 유동성이란 자산을 현금으로 전환할 수 있는 정도를 나타내며 기업의 단기 채무에 대한 지급능력을 측정하고 평가하는 지표로 활용됩니다." data-trigger="hover">유동비율</a>
   </div>

   <!-- 부채비율 -->
   <div class="container">
      <a href="#" data-toggle="popover" title="(부채/자기자본) × 100" data-content="부채비율은 기업이 타인자본에 의존하고 있는 정도를 나타내는 비율입니다. 장기채무에 대한 원금 및 이자의 지급능력을 평가하는 지표로서 유동비율과 함께 재무위험을 측정하는 지표로 활용됩니다." data-trigger="hover">부채비율</a>
   </div>

   <!-- 비유동비율 -->   
   <div class="container">
      <a href="#" data-toggle="popover" title="(비유동자산/자기자본) × 100" data-content="비유동비율은 조달된 자본이 기업의 자산에 얼마나 적절히 배분되고 있는 지를 측정하는 비율입니다. 기업이 장기적으로 경기변동, 시장여건 변화 등 경제변화에 잘 적응할 수 있는 지를 분석하기 위한 지표로 활용됩니다." data-trigger="hover">비유동비율</a>
   </div>
   
   <!-- 매출액영업이익률 -->   
   <div class="container">
      <a href="#" data-toggle="popover" title="(영업이익/매출액) × 100" data-content="매출액영업이익률은 기업의 경영활동 중 매출액에 대한 영업이익의 관계를 나타내는 비율로서 제조 및 판매활동과 직접적 관련이 있는 영업이익만을 매출액과 대비한 것이므로 곧 판매마진을 나타낸다고 볼 수 있습니다. 기업의 주된 영업활동의 능률을 측정하는 지표로 활용됩니다." data-trigger="hover">매출액영업이익률</a>
   </div>
   
   <!-- 매출액증가율 -->
   <div class="container">
      <a href="#" data-toggle="popover" title="{(당기매출-전기매출)/전기매출} × 100" data-content="매출액증가율은 성장성의 분석에 사용되는 지표로서 기준연도 매출액에 대한 비교연도 매출액의 증가율을 의미합니다. 기업의 규모 및 성과가 전년에 비해 얼마나 증가하였는지를 측정하는 지표로 활용됩니다." data-trigger="hover">매출액증가율</a>
   </div>



<div id = "toparea">

   
   <div class="container">
      <div class="row">
         <div class="col-md-4">
            <canvas id="A"></canvas>
         </div>
         <div class="col-md-4">
            <canvas id="B"></canvas>
         </div>
         <div class="col-md-4">
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
           </div>
           <div role="tabpanel" class="tab-pane" id="c_2015">
              <canvas id="R2015"></canvas>
           </div>
         </div>
         
      </div>
   <canvas id="canvas2">chlqud</canvas>
</div>

<div class="container">
   <c:forEach var="news" items="${News.items}">
      <h4><a href="${news.link }">${news.title }</a></h4>
      <p>${news.description }</p>
      <p>${news.pubDate }</p>
      <hr>
   </c:forEach>
</div>


<div class="container" style="width:1000px; height:1000px; background-color: #FFFFF0">
   <h1>${cor_info.c_name }</h1>
   <a href="#" data-toggle="modal" data-target="#login-modal" onclick= "login()">Login</a>
   <form action="/favorite/regist" method="post">
      <input type="text" name="c_no" value="${cor_info.c_no }">
      <input type="submit" value="선호기업 등록" >
   </form>

   <div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
            <div class="modal-dialog">
            <!--loginmodal-container 부트스트랩 부분 --> 
               <div class="loginmodal-container">
                  <h4>로그인안내창</h4><br>
                 <form class="form-horizontal" action="/member/login" method="post">
                     <input type="text" name="id" placeholder="아이디" ><br>
                     <input type="password" name="pw" placeholder="패스워드">
                     <input type="submit" name="login" class="login loginmodal-submit" value="Login" >
                        
                 </form>
                  
                 <div class="login-help">
                  <a href="#">Register</a> - <a href="#">Forgot Password</a>
                 </div>
               </div>
            </div>
           </div>
           <br>
           <br>
           
           ${jsonNews.lastBuildDate }
           
           
   <label>업종코드</label>
   ${cor_info.type_code } <br>
   <label>업종명</label>
   ${cor_info.type } <br>
   <label>종목코드</label>
   ${cor_info.cp_code } <br><br>
   
   
   
   
   
   <label>A매출액</label>${A.c_2016 } <br>
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
   <label>f11매입채무회전율</label>${f11.c_2016 } <br>
   
   
   
   <!-- @@@@@@@@@@@@@@@@@@@@@@@@ 테스트중입니다 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@ -->
   <table width=380 border=0 cellspacing=1 cellpadding=1 id=stockInfo>
      <tr>
         <td width='20%' height= 22 align=center class="title_defult"><font class="FONT_title_defult">종목명</font></td>
         <td width='30%' height= 22 align=center class="body_a">${map.stockprice.TBL_StockInfo.JongName }</td>
         <td width='20%' height= 22 align=center class="title_defult"><font class="FONT_title_defult">현재가</font></td>
         <td width='30%' height= 22 align=right class="body_a">${map.stockprice.TBL_StockInfo.CurJuka}</td>
      </tr>
      <tr>
         <td width='20%' height= 22 align=center class="title_defult"><font class="FONT_title_defult">전일대비</font></td>
         <td width='30%' height= 22 align=right class="body_b">${map.stockprice.TBL_StockInfo.Debi}</td>
         <td width='20%' height= 22 align=center class="title_defult"><font class="FONT_title_defult">전일종가</font></td>
         <td width='30%' height= 22 align=right class="body_b">${map.stockprice.TBL_StockInfo.PrevJuka}</td>
      </tr>
      <tr>
         <td width='20%' height= 22 align=center class="title_defult"><font class="FONT_title_defult">거래량</font></td>
         <td width='30%' height= 22 align=right class="body_a">${map.stockprice.TBL_StockInfo.Volume}</td>
         <td width='20%' height= 22 align=center class="title_defult"><font class="FONT_title_defult">거래대금</font></td>
         <td width='30%' height= 22 align=right class="body_a">${map.stockprice.TBL_StockInfo.Money}</td>
      </tr>
      <tr>
         <td width='20%' height= 22 align=center class="title_defult"><font class="FONT_title_defult">시가</font></td>
         <td width='30%' height= 22 align=right class="body_b">${map.stockprice.TBL_StockInfo.StartJuka}</td>
         <td colspan="2" width='50%' height= 22 align=right class="body_b"></td>
      </tr>
      <tr>
         <td width='20%' height= 22 align=center class="title_defult"><font class="FONT_title_defult">고가</font></td>
         <td width='30%' height= 22 align=right class="body_a">${map.stockprice.TBL_StockInfo.HighJuka}</td>
         <td width='20%' height= 22 align=center class="title_defult"><font class="FONT_title_defult">저가</font></td>
         <td width='30%' height= 22 align=right class="body_a">${map.stockprice.TBL_StockInfo.LowJuka}</td>
      </tr>
      <tr>
         <td width='20%' height= 22 align=center class="title_defult"><font class="FONT_title_defult">52주 최고</font></td>
         <td width='30%' height= 22 align=right class="body_b">${map.stockprice.TBL_StockInfo.High52}</td>
         <td width='20%' height= 22 align=center class="title_defult"><font class="FONT_title_defult">52주 최저</font></td>
         <td width='30%' height= 22 align=right class="body_b">${map.stockprice.TBL_StockInfo.Low52}</td></tr>
         <tr><td width='20%' height= 22 align=center class="title_defult"><font class="FONT_title_defult">상한가</font></td>
         <td width='30%' height= 22 align=right class="body_a">${map.stockprice.TBL_StockInfo.UpJuka}</td>
         <td width='20%' height= 22 align=center class="title_defult"><font class="FONT_title_defult">하한가</font></td>
         <td width='30%' height= 22 align=right class="body_a">${map.stockprice.TBL_StockInfo.DownJuka}</td>
      </tr>
      <tr>
         <td width='20%' height= 22 align=center class="title_defult"><font class="FONT_title_defult">PER</font></td>
         <td width='30%' height= 22 align=right class="body_b">${map.stockprice.TBL_StockInfo.Per}</td>
         <td colspan="2" width='50%' height= 22 align=right class="body_b"></td>
      </tr>
      <tr>
         <td width='20%' height= 22 align=center class="title_defult"><font class="FONT_title_defult">상장주식수</font></td>
         <td width='30%' height= 22 align=right class="body_a">${map.stockprice.TBL_StockInfo.Amount}</td>
         <td width='20%' height= 22 align=center class="title_defult"><font class="FONT_title_defult">액면가</font></td>
         <td width='30%' height= 22 align=right class="body_a">${map.stockprice.TBL_StockInfo.FaceJuka}</td>
      </tr>
   </table>

   
   
</div>

   
</div>

</body>
</html>