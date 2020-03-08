<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<head>
<meta charset="UTF-8">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Mukta:300,400,700"> 
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/fonts/icomoon/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/resources/axicon/axicon.min.css" />
</head>

    <header class="site-navbar" role="banner">
      <div class="site-navbar-top">
        <div class="container">
          <div class="row align-items-center">
            <div class="col-6 col-md-4 order-2 order-md-1 site-search-icon text-left">
              <form action="${pageContext.request.contextPath }/" class="site-block-top-search">
                <span class="icon icon-search2"></span>
                <input type="text" class="form-control border-0" placeholder="Search">
              </form>
            </div>

            <div class="col-12 mb-3 mb-md-0 col-md-4 order-1 order-md-2 text-center">
              <div class="site-logo">
                <a href="${pageContext.request.contextPath }/" class="js-logo-clone">UK Shop</a>
              </div>
            </div>

            <div class="col-6 col-md-4 order-3 order-md-3 text-right">
              <div class="site-top-icons">
                <ul>
                	<c:if test="${empty sessionScope.vo }">
	                	<li><a href="${pageContext.request.contextPath }/UKshop/login"><i class="axi axi-ion-log-in" style="font-size: 13pt;"></i></a></li> 
		                <li><a href="${pageContext.request.contextPath }/UKshop/join"><span class="icon icon-person"></span></a></li>
                	</c:if>
                	<c:if test="${not empty sessionScope.vo }">
		                <li style="font-size: 13pt;"><span style="font-size: 9pt;">${sessionScope.vo.member_name }님 안녕하세요!!</span> &nbsp&nbsp&nbsp <a href="${pageContext.request.contextPath }/UKshop/logout"><i class="axi axi-ion-log-out"></i></a></li>
		                <c:if test="${sessionScope.vo.member_grade == 9 }">
			                <li><a href="${pageContext.request.contextPath }/UKshop/product"><i class="axi axi-mode-edit" style="font-size: 13pt;"></i></a></li>
						</c:if>	
		                <li>
		                  <a href="${pageContext.request.contextPath }/UKshop/cart" class="site-cart">
		                    <span class="icon icon-shopping_cart"></span>
		                    <span class="count">2</span>
		                  </a>
		                </li> 
                	</c:if>
	                <li class="d-inline-block d-md-none ml-md-0"><a href="#" class="site-menu-toggle js-menu-toggle"><span class="icon-menu"></span></a></li>
                </ul>
              </div> 
            </div>
          </div>
        </div>
      </div>
       
	<nav class="site-navigation text-right text-md-center" role="navigation">
		<div class="container">
	    	<ul class="site-menu js-clone-nav d-none d-md-block">
	    		<li><a href="${pageContext.request.contextPath }/">home</a></li>
				<c:if test="${not empty categoryList }">
					<c:forEach var="category" items="${categoryList }" varStatus="vs">
						<li class="active">
							<c:if test="${category.category_lev==0 }"> <%-- 메인 카테고리 --%>
								<a href="${pageContext.request.contextPath }/${category.category_title}">${category.category_title}</a>
							</c:if>
						</li>
					</c:forEach>
				</c:if>
    		</ul>
		</div>	
      </nav> 
      
      <script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/comm.js"></script>
    </header>