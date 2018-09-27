<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/include/headerScript.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>  
</head>
<style>
.btn {
    background-color: transparent;
}
</style>
<body>
<script>
   function del(c_no){
      if(confirm('삭제하시겠습니까?')){
               $.ajax({
            url : '/favorite/delete'
            ,type : 'get'
            ,data : {
               c_no:c_no
            }
         }).done(function(msg){
            if('1'==msg){
               alert('삭제되었습니다.');   
               $('#f_'+c_no).hide('slow');
            }else{
               alert('잠시후에 다시 시도해주십시오.');
            }
         });      
      }
   }
</script>

<div class = "row"  style="width:1000px; height:450px; margin:auto;">
<c:if test="${m_name ne null}">
${m_name}님의 선호기업
</c:if>
<c:if test="${f_name ne null}">
${f_name}님의 선호기업
</c:if>

<table id ="example-table-1" width="100%" class="table table-bordered table-hover text-center">
      <tr>
         <th>기업명</th>
         <th>바로가기</th>
         <th>삭제</th>
      </tr>
   <c:forEach var = "love" items="${list}">
      <tr id = "f_${love.c_no}" style="overflow-x:hidden;">
         <td>${love.c_name}</td>
         <td>
         	<form action="/corporation/search" method="post">
				<input type="hidden" name="c_name" value="${love.c_name}">
				<input type="submit" class="btn btn-default" value="${love.c_name} 보러가기">  	
         	</form>
         </td>
         <%-- <td><input type = "button" value = "삭제" onclick = "del(${love.c_no})"></td> --%>
      	<td><button class="btn" id="btn" type="button"  onclick="del(${love.c_no})"><img class="btn-img" src="../resources/images/delete.png" width="20px;"></button></td>
      </tr>
   </c:forEach>
</table>
</div>
</body>

</html>