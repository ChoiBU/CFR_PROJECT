<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/headerScript.jsp" %>
 <%@ page import = "com.cfr.web.member.controller.MemberController"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script>
function alert() {
	alert(" 에러인건가 ?");
}

</script>


<body>



		<form name="idsearch" method="post">
		  
		   <table width="1330px" height="530px" align="center">
		    <tr>
		     <td>
			      <c:if test="${m_info.m_id ne null }">
	
			      <table width="550px" align=center border="0"
			       style="color: black; font-size: 30px;">
			       <tr align=center>
			        <td style="height: 170px">* 회원님의 아이디를 찾았습니다! *</td>
			       </tr>
			       <tr align=center>
			        <td style="font-size: 20px">${m_info.m_id}</td>
			       </tr>
			      </table>
			      </c:if> 
			      <c:if test="${m_info.m_id eq null }" >

			      <table width="550px" align=center border="0"
			       style="color: black; font-size: 30px;" >
			       <tr align=center>
			        <td style="height: 170px">* 아이디 찾기에 실패하셨습니다. *</td>
			       	
			       </tr>
			       <tr align=center>
			        <td><input type="button" value="돌아가기"
			         onClick="history.back()"></td>
			       </tr>
			      </table>
			      </c:if>
		      </td>
		      </tr>
		    </table>
      </form>

</body>
</html>