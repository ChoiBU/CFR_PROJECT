<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/headerScript.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>아이디/패스워드 변경</title>
</head>
<body>
<h1>아이디 찾기</h1>
<form action="/member/idSearch" method="POST">
<input type="text" name="m_name"  size="30" placeholder="이름을 입력해주세요." required><br>
<input type="text"  name="m_email" size="30" placeholder="이메일을 입력해주세요." required>
<input type="submit" value="검색">
<c:if test="${msg == 'fail'}">
			                    <div class="image blinking" style="color: red">
		                        		아이디 또는 비밀번호가 일치하지 않습니다.<br>
		                        		확인 후 다시 입력해주세요.
			                    </div>
		                </c:if>
</form>

<h1>비밀번호 찾기</h1>
<form action="/member/pwSearch" method="POST">
<input type="text" name="m_id"  size="30" placeholder="아이디를 입력해주세요." required><br>
<input type="text"  name="m_email" size="30" placeholder="이메일을 입력해주세요." required>
<input type="submit" value="검색">
<c:if test="${msg == 'fail'}">
			                    <div class="image blinking" style="color: red">
		                        		아이디 또는 비밀번호가 일치하지 않습니다.<br>
		                        		확인 후 다시 입력해주세요.
			                    </div>
		                </c:if>
</form>
</body>
</html>