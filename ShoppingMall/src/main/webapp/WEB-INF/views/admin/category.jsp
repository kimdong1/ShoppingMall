<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/comm.js"></script>
<style>
.left-box {
  float: left;
  width: 10%;
}
.right-box {
  float: right;
  width: 90%;
}
</style>
<script type="text/javascript">
 function formCheck(){
	 var title = $("#category_title").val();
	 if(title.trim().length<1){
		 $("#category_title").val("");
		 $("#category_title").focus();
		 alert('카테고리명을 입력하세요');
		 return false;
	 }

	 alert('카테고리 등록이 완료 되었습니다.');
	 return true;
 }
 function childCheck(grp){
	 var child_title = $("#categoryChild_title"+grp).val();
	 if(child_title.trim().length==0){
		 alert('소분류를 입력하세요');
		 return false;
	 }
	 return true;
 }
 function plus(grp){
	 if($("#subInput"+grp).css("display") == "none"){
		 $("#subInput"+grp).css("display","inline"); 
		 $("#categoryChild_title"+grp).focus();
	 }
 }
 function cancel(grp){
	 if($("#subInput"+grp).css("display") == "inline"){
		 $("#subInput"+grp).css("display","none"); 
	 }
 }
</script>

</head>
<body>
	<div>
		<jsp:include page="../header.jsp"></jsp:include>
	</div>
	<div class='left-box'>
		<div class="list-group">
		  <button type="button" class="list-group-item list-group-item-action" onclick="location.href='${pageContext.request.contextPath}/UKshop/product'" >상품등록</button>
		  <button type="button" class="list-group-item list-group-item-action active" onclick="location.href='${pageContext.request.contextPath}/UKshop/category'">카테고리등록</button>
		</div>
	</div>
	<div class='right-box'>
		<div class="container">
			<div>
				<form class="form-horizontal" action="${pageContext.request.contextPath }/UKshop/registOk" onsubmit="return formCheck();" method="post">
					<fieldset>
					<!-- Text input-->
					<div class="form-group">
					  <label class="col-md-4 control-label" for="category_title">카테고리명</label>  
					  <div class="col-md-4">
					  <input id="category_title" name="category_title"  style="width: 300px;" placeholder="카테고리명을 입력하세요" class="form-control input-md" required="required" type="text">
					  </div>
					</div>
					<div class="form-group">
					  <label class="col-md-4 control-label" for="detail"></label>
					  <div class="col-md-4">                     
					    <button type="submit" id="singlebutton" name="singlebutton" class="btn btn-primary">카테고리 등록</button>
					  </div>
					</div>
					</fieldset>
				</form>
			</div>
			<div align="center">
				<ul class="list-group list-group-flush">
					<c:if test="${not empty categoryList }">
						<c:forEach var="category" items="${categoryList }" varStatus="vs">
							<li class="list-group-item">
								<c:if test="${categoryList[vs.index].category_lev>0 }">
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									└>
								</c:if>
								<c:out value="${category.category_title }" escapeXml="false" />
								<c:if test="${category.category_lev==0 }">
									<button class="axi axi-plus2" type="button" onclick="plus(${category.category_grp})"></button>
								</c:if>
								
								<button class="axi axi-delete2" onclick="sendPost('${pageContext.request.contextPath}/UKshop/deleteOk',{'category_idx':${category.category_idx }});"></button>
								<form action="${pageContext.request.contextPath}/UKshop/categoryChildRegistOk" method="post" onsubmit="return childCheck(${category.category_grp });">
									<span id="subInput${category.category_grp }" style="display: none;">
										<input type="text" id="categoryChild_title${category.category_grp }" name="categoryChild_title" required="required" />
										<input type="hidden" name="category_grp" value="${category.category_grp }" />
										<input type="submit" value="추가"/> 
										<i class="axi axi-cancel" onclick="cancel(${category.category_grp });" style="cursor: pointer; font-size: 15pt;" ></i>
									</span>
								</form>
							</li>
						</c:forEach>
					</c:if>
				</ul>
			</div>
		</div>
	</div>
	
</body>
</html>