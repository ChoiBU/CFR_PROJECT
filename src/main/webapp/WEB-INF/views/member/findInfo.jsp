<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/headerScript.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>아이디/비밀번호 찾기</title>
</head>
<style>
tr {
 border: 0px solid none;
}
 
k:hover {
 text-decoration: none;
 color: #9354ED
}
</style>

<style type="text/css">
		body{background:url('../resources/images/sample2.png') 
		no-repeat center center fixed; -webkit-background-size: cover;-moz-background-size: cover;
		-o-background-size: cover;background-size: cover;} 
		}
</style>
<script>
 function id_search2() { 
  var frm = document.idfindscreen;
  if (frm.m_name.value.length < 1) {
   alert("이름을 입력해주세요");
   return;
  }
  if (frm.m_email.value.length < 1) {
   alert("이메일을 입력해주세요");
   return;
  }
  frm.method = "post";
  frm.action = "/member/findcf"; //넘어간화면
  frm.submit();  }

 

 function pw_search2() { 
	  var frm = document.pwfindscreen;
	  if (frm.m_id.value.length < 1) {
	   alert("아이디를 입력해주세요");
	   return;
	  }
	  if (frm.m_email.value.length < 1) {
	   alert("이메일을 입력해주세요");
	   return;
	  }
	  frm.method = "post";
	  frm.action = "/member/findpw"; //넘어간화면
	  frm.submit();  }
 
</script>
</head>

<body>
 <form name="idfindscreen">
  
  <font face="Yang Rounded">

   <table width="1330px" height="430px" align="center">
    <tr>
     <td>
      <table width="600px" align="center" border="0"
       style="color: black; background-color: #F6F6F6; font-size: 20px;">
       <tr>
        <td>
         <table width="750px" align="center" border=0;
          style="background-color: white; margin-top: 3%">
          <tr>
           
           <td>아이디 찾기</td>
           <td><div id="sub-title">| 회원정보에 등록된 정보로 인증.</td>
           <td width="300px"></td>
          </tr>
         </table>
        </td>
       </tr>
          <tr>
           <td>
            <table width="300px" height="20px" border="0"
             style="margin-top: 3%; font-size: 18px;">
             <br>
             <br>
             <tr>
              
              <td>&nbsp;등록된 이름,이메일로 찾기</td>
             </tr>
            </table>
           </td>
          </tr>
          <td>
           <table width="380px" height="70px" align="center" border="0"
            style="font-size: 16px;">
            <tr>
             <td>이름</td>
             <td><input type="text" name="m_name"></td>
            </tr>
            <tr>
             <td style="text-align: center;">e-mail&nbsp;</td>
             <td><input type="text" name="m_email"
              style="width: 200px" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" placeholder = "cfr@naver.com">
           </table>
          </td>
          </tr>
          <tr>
           <td>
            <table width="140px" height="10px" border="0"
             style="margin-top: 2%" align="center">
             <tr>
              <td><input type="button" name="enter2" value="  찾기  "
               align="center"
               style="cursor: pointer; background: white; color: black; border-color: black;"
               onClick="id_search2()">
              </td>
             </tr>
            </table>
            <br>
           </td>
          </tr>
         </table>
        </td>
       </tr>
      </table>
     </td>
    </tr>
   </table>

  </font>
 </form>




<form name="pwfindscreen">
  
  <font face="Yang Rounded">

   <table width="1330px" height="430px" align="center">
    <tr>
     <td>
      <table width="600px" align="center" border="0"
       style="color: black; background-color: #F6F6F6; font-size: 20px;">
       <tr>
        <td>
         <table width="750px" align="center" border=0;
          style="background-color: white; margin-top: 3%">
          <tr>
           
           <td>비밀번호 찾기</td>
           <td><div id="sub-title">| 회원정보에 등록된 정보로 인증.</td>
           <td width="300px"></td>
          </tr>
         </table>
        </td>
       </tr>
          <tr>
           <td>
            <table width="300px" height="20px" border="0"
             style="margin-top: 3%; font-size: 18px;">
             <br>
             <br>
             <tr>
              
              <td>&nbsp;등록된 아이디,이메일로 찾기</td>
             </tr>
            </table>
           </td>
          </tr>
          <td>
           <table width="380px" height="70px" align="center" border="0"
            style="font-size: 16px;">
            <tr>
             <td>아이디</td>
             <td><input type="text" name="m_id"></td>
            </tr>
            <tr>
             <td style="text-align: center;">e-mail&nbsp;</td>
             <td><input type="text" name="m_email"
              style="width: 200px" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}$" placeholder = "cfr@naver.com">
           </table>
          </td>
          </tr>
          <tr>
           <td>
            <table width="140px" height="10px" border="0"
             style="margin-top: 2%" align="center">
             <tr>
              <td><input type="button" name="enter2" value="  찾기  "
               align="center"
               style="cursor: pointer; background: white; color: black; border-color: black;"
               onClick="pw_search2()">
              </td>
             </tr>
            </table>
            <br>
           </td>
          </tr>
         </table>
        </td>
       </tr>
      </table>
     </td>
    </tr>
   </table>

  </font>
 </form>


</body>
</html>