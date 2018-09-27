<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/headerScript.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style type="text/css">
		body{background:url('../resources/images/sample2.png') 
		no-repeat center center fixed; -webkit-background-size: cover;-moz-background-size: cover;
		-o-background-size: cover;background-size: cover;} 
		}
</style>
<body>
		<form name="pwsearch" method="post">
		   <%@ page import = "com.cfr.web.member.controller.MemberController"%>
		   <table width="1330px" height="530px" align="center">
		    <tr>
		     <td>
		      <c:if test="${m_info.m_pw ne null }">

		      <table width="550px" align=center border="0"
		       style="color: black; font-size: 30px;">
		       <tr align=center>
		        <td style="height: 170px">* 회원님의 비밀번호를 찾았습니다! *</td>
		       </tr>
		       <tr align=center>
		        <td style="font-size: 20px">${m_info.m_pw}</td>
		       </tr>
		      </table>
		      </c:if> 
		      <c:if test="${m_info.m_id eq null }">
		      <table width="550px" align=center border="0"
		       style="color: black; font-size: 30px;">
		       <tr align=center>
		        <td style="height: 170px">* 비밀번호 찾기에 실패하셨습니다. *</td>
		       </tr>
		       <tr align=center>
		        <td><input type="button" value="돌아가기"
		         onClick="history.back()"></td>
		       </tr>
		      </table>
		      </c:if>
      </form>

</body>
</html>