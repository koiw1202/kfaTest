<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<link href="/assets/css/bootstrap.css" rel="stylesheet">
<link href="/assets/css/facebook.css" rel="stylesheet">
<script type="text/javascript">
	
</script>
</head>
<body>
	<!-- sidebar -->
	<div class="column col-sm-2 col-xs-1 sidebar-offcanvas" id="sidebar">
		<ul class="nav">
			<li><a href="#" data-toggle="offcanvas"
				class="visible-xs text-center"><i class="glyphicon glyphicon-chevron-right"></i></a></li>
		</ul>
		<ul class="nav hidden-xs" id="lg-menu">
			<li class=active"><a href="#featured"><i class="glyphicon glyphicon-list-alt"></i> 전체 진행 현황</a></li>
			<li><a href="#stories"><i class="glyphicon glyphicon-list"></i>금일 이슈</a></li>
			<c:if test="${sessionScope.user.role eq 'admin'}">
			<li><a href="/getUserList.do?currentPage=1"><i class="glyphicon glyphicon-paperclip"></i>사용자 목록 조회</a></li>
				<li><a href="/user/addUserView.jsp"><i class="glyphicon glyphicon-refresh"></i> 회원 등록</a></li>
			</c:if>
		</ul>
		<!-- tiny only nav-->
		<ul class="nav visible-xs" id="xs-menu">
			<li><a href="#featured" class="text-center"><i class="glyphicon glyphicon-list-alt"></i></a></li>
			<li><a href="#stories" class="text-center"><i class="glyphicon glyphicon-list"></i></a></li>
			<li><a href="#" class="text-center"><i class="glyphicon glyphicon-paperclip"></i></a></li>
			<li><a href="#" class="text-center"><i class="glyphicon glyphicon-refresh"></i></a></li>
		</ul>
	</div>

	<!-- /sidebar -->

</body>
</html>
