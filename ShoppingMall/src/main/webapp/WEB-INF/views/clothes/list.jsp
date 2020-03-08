<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700"> 
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/fonts/icomoon/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/magnific-popup.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/jquery-ui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/aos.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/axicon/axicon.min.css" />


</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	
	<div class="site-section">
      <div class="container">
        <div class="row mb-5">
          <div class="col-md-9 order-2">
            <div class="row">
              <div class="col-md-12 mb-5">
                <div class="float-md-left mb-4"><h2 class="text-black h5">${product_division }</h2></div>
              </div>
            </div>
           
            <c:if test="${not empty clothes }">
	            <div class="row mb-5">
	              
	              <c:forEach items="${clothes }" varStatus="vs">
		              <div class="col-sm-6 col-lg-4 mb-4" data-aos="fade-up">
		                <div class="block-4 text-center border">
		                  <figure class="block-4-image">
		                  <input type="hidden" name="product_smallDivision" value="${clothes[vs.index].product_smallDivision }" />
		                  	<c:url var="url" value="/category/${product_division }/${clothes[vs.index].product_smallDivision }/${clothes[vs.index].product_name }">
		                  		<c:param name="product_id" value="${clothes[vs.index].product_id }"/>
		                  	</c:url>
		                    <a href="${url }">
								<img alt="Image placeholder" class="img-fluid" src="<spring:url value = '/upload/${fileVO[vs.index].product_sfile }'/>" >
		                    </a>
		                  </figure>
		                  <div class="block-4-text p-4">
		                    <h3><a href="#">${clothes[vs.index].product_name }</a></h3>
		                    <p class="mb-0">${clothes[vs.index].product_content }</p>
		                    <p class="text-primary font-weight-bold">
		                    	<fmt:formatNumber value="${clothes[vs.index].product_price}" pattern="#,###"/>원
		                    </p>
		                  </div>
		                </div>
		              </div>
	              
	              </c:forEach>
	              
	            </div>
            </c:if>
            <c:if test="${empty clothes }">
				준비중~
			</c:if>
		
          </div>
        </div>
      </div>
    </div>
	
	
	
	
  <script src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/js/jquery-ui.js"></script>
  <script src="${pageContext.request.contextPath }/resources/js/popper.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/js/owl.carousel.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/js/jquery.magnific-popup.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/js/aos.js"></script>

  <script src="${pageContext.request.contextPath }/resources/js/main.js"></script>
	
</body>
</html>