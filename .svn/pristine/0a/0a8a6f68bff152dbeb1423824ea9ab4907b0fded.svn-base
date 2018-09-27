<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/headerScript.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.0.5/sweetalert2.all.js"></script>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.0.5/sweetalert2.min.css">
</head>
<script type = "text/javascript">
	if( ' ${flag} '==1 ){
		swal({
			title: 'success',
			text: '${msg} 성공',
			type: 'success',
			timer: 150000
		}).then(function (result) {
			document.location.href = '${forward_url}';
		});
	} else if( ' ${flag} ' != 1 ){
		swal({
			title: 'fail',
			text: '${msg} 실패',
			type: 'error',
			timer: 150000
		}).then(function (result) {
			history.back();
		});
	} 
  </script>
<body>



</body>
</html>