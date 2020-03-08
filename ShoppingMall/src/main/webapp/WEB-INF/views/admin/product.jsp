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
	<script type="text/javascript">
		$(function(){
			$("#product_smallDivision").html("<option value=''>소구분</option>"); 
			$("#product_division").change(function() {
				var selected = $("#product_division option:selected").val();
			$.ajax({
			    url: "${pageContext.request.contextPath}/childCategory",
			    type: "POST",
			    dataType: "json",
			    data: {'category_grp':selected},
			    success: function(data){
		    		if(data.length>0){
				    	for(var i = 0; i < data.length; i++){
				    		$("#product_smallDivision").append("<option value='"+data[i].category_title+"'>"+data[i].category_title+"</option>");
				    		$("#setProduct_division").val($("#product_division option:selected").text());
				    	}
		    		}else{
		    			$("#product_smallDivision").html('<option value="">소구분</option>');
		    		}
			    },
			    error: function (){
			    	alert('error');
			    }
			  });

			});
		});
	
		function formCheck(){
			var data = $("#product_division").val();
			if(!data.trim()){
				alert("상품구분을 선택해주세요!");
				return false;
			}
			var data = $("#product_smallDivision").val();
			if(!data.trim()){
				alert("소구분을 입력하세요!");
				return false;
			}
			var data = $("#product_id").val();
			if(!data.trim()){
				alert("상품번호를 입력하세요!");
				return false;
			}
			var data = $("#product_name").val();
			if(!data.trim()){
				alert("상품명을 입력하세요!");
				return false;
			}
			var data = $("#product_file").val();
			if(!data.trim()){
				alert("상품이미지를 선택하세요!");
				return false;
			}
			var data = $('input:checkbox[name="product_size"]').is(":checked") == true;
			if(!data){
				alert("상품사이즈를 선택하세요!");
				return false;
			}
			var data = $("#product_color").val();
			if(!data.trim()){
				alert("상품컬러를 입력하세요!");
				return false;
			}
			var data = $("#product_content").val();
			if(!data.trim()){
				alert("상품 상세내용을 입력하세요!");
				return false;
			}
			alert('상품 등록이 완료 되었습니다.');
			return true;
		}
	</script>
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
</head>
<body>
	<div>
		<jsp:include page="../header.jsp"></jsp:include>
	</div>
	<input type="hidden" name="url" value="product" />
	<div class='left-box'>
		<div class="list-group">
		  <button type="button" class="list-group-item list-group-item-action active" onclick="location.href='${pageContext.request.contextPath}/UKshop/product'" >상품등록</button>
		  <button type="button" class="list-group-item list-group-item-action" onclick="location.href='${pageContext.request.contextPath}/UKshop/category'">카테고리등록</button>
		</div>
	</div>
	<div class='right-box'>
		<div class="container">
			<div>
				<form enctype="multipart/form-data" class="form-horizontal" action="${pageContext.request.contextPath }/UKshop/postingOk" onsubmit="return formCheck();" method="post">
					<fieldset>
					<div class="form-group">
					  <label class="col-md-4 control-label" for="product_division">상품구분</label>  
					  <div class="col-md-4">
					  	<select id="product_division" name="product_division" >
					  		<option value="">상품구분</option>
					  		<c:if test="${not empty categoryList }">
						  		<c:forEach var="category" items="${categoryList }" varStatus="vs">
							  		<c:if test="${categoryList[vs.index].category_lev==0 }">
								  		<option value="${category.category_grp }">${category.category_title }</option>
							  		</c:if>
						  		</c:forEach>
					  		</c:if>
					  	</select>
					  </div>
					</div>
					
					<!-- Text input-->
					<div class="form-group">
					  <label class="col-md-4 control-label" for="product_smallDivision">소구분</label>  
					  <div class="col-md-4">
				  		<c:if test="${not empty categoryList }">
						  	<select id="product_smallDivision" name="product_smallDivision" >
						  	</select>
				  		</c:if>
					  </div>
					</div>
					<div class="form-group">
					  <label class="col-md-4 control-label" for="product_file">상품이미지</label>  
					  <div class="col-md-4">
					  <input type="file" id="product_file" name="product_file" />
					  </div>
					</div>
					<!-- Text input-->
					<div class="form-group">
					  <label class="col-md-4 control-label" for="product_id">상품번호</label>  
					  <div class="col-md-4">
					  <input id="product_id" name="product_id" placeholder="상품번호를 입력하세요" class="form-control input-md" required="required" type="text">
					  </div>
					</div>
					<!-- Text input-->
					<div class="form-group">
					  <label class="col-md-4 control-label" for="product_name">상품명</label>  
					  <div class="col-md-4">
					  <input id="product_name" name="product_name"  style="width: 300px;" placeholder="상품명을 입력하세요" class="form-control input-md" required="required" type="text">
					  </div>
					</div>
					<!-- Text input-->
					<div class="form-group">
					  <label class="col-md-4 control-label" for="product_price">상품가격</label>  
					  <div class="col-md-4">
					  	<input id="product_price" name="product_price" placeholder="상품가격을 입력하세요" class="form-control input-md" required="required" type="text">
					  </div>
					</div>
					<!-- Text input-->
					<div class="form-group">
					  <label class="col-md-4 control-label" for="product_size">사이즈</label>  
					  <div class="col-md-4">
						  <label for="product_sizeS">
							  <input id="product_sizeS" name="product_size" value="1" type="checkbox">S&nbsp&nbsp
						  </label>
						  <label for="product_sizeM">
							  <input id="product_sizeM" name="product_size" value="2" type="checkbox">M&nbsp&nbsp
						  </label>
						  <label for="product_sizeL">
							  <input id="product_sizeL" name="product_size" value="3" type="checkbox">L&nbsp&nbsp
						  </label>
					  </div>
					</div>
					<!-- Textarea -->
					<div class="form-group">
					  <label class="col-md-4 control-label" for="product_color">컬러</label>
					  <div class="col-md-4">                     
					    <input id="product_color" name="product_color" placeholder="ex)블루,레드..." class="form-control input-md" required="required" type="text">
					  </div>
					</div>
					<!-- Textarea -->
					<div class="form-group">
					  <label class="col-md-4 control-label" for="product_content">Detail</label>
					  <div class="col-md-4">                     
					    <textarea class="form-control" style="width: 400px; height: 80px;"  id="product_content" name="product_content" placeholder="상세내용"></textarea>
					  </div>
					</div>
					<div class="form-group">
					  <label class="col-md-4 control-label" for="detail"></label>
					  <div class="col-md-4">                     
					    <button type="submit" id="singlebutton" name="singlebutton" class="btn btn-primary">상품 등록</button>
					  </div>
					</div>
					</fieldset>
					<input type="hidden" id="setProduct_division" name="setProduct_division" value="" />
				</form>
			</div>
		</div>
	</div>
	
</body>
</html>