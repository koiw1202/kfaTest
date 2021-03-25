<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<title>메인 화면</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<link href=/css/userList.css rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>유저 리스트 조회</title>
<script src="assets/js/jquery.js"></script>
<script>

	function fncGetList(requestPageNumber) {
		//var form = document.createElement("form") ;
		var form = document.testForm ;
		form.setAttribute("action", "/getUserList.do?currentPage=1") ;
		form.setAttribute("method", "GET") ;
		form.append( "<input type=\"text\" id=\"currentPage\" name=\"currentPage\" value=" + requestPageNumber + ">" ) ;
		document.getElementById("currentPage").value = requestPageNumber ;
		form.submit() ;
	}
	
	$(function() {
		
		$(".glyphicon-trash").click( function(){
			
			var userId = $(this).attr("id") ; 
			$.ajax({
				type :'GET',
				data : "userId=" + userId,
				url : '/deleteUser.do',
				success : function(data) {
					alert('삭제되었습니다.') ;
					//fncGetList(${resultPage.currentPage}) ;
				},
				error : function(xhr, status, errorThrown) {
					alert("xhr : " + xhr + "<br>" + "오류명: " + errorThrown + "<br>" + "상태: " + status)
				}
			}) ;
		}) ;
	}) ;

</script>
</head>
<body>
	<hr>
	<div class="wrapper">
		<div class="box">
			<div class="row row-offcanvas row-offcanvas-left">
				<jsp:include page="/layout/left.jsp" />
					<div class="column col-sm-10 col-xs-11" id="main"" style="height:10px">
			 		<jsp:include page="/layout/top.jsp" /> 
					</div>
					
				<div class="container bootstrap snippets bootdey" style="width:1000px;margin-left:300px;margin-top:50px" >
					<div class="row">
						<div class="col-lg-12" margin-left="10px">
							<div class="main-box no-header clearfix">
								<div class="main-box-body clearfix">
									<div class="table-responsive">
										<table class="table user-list">
											<thead>
												<tr>
													<th style="text-align:center"><span >프로필 사진</span></th>
													<th style="text-align:center"><span>이름</span></th>
													<th class="text-center"><span>상태</span></th>
													<th style="text-align:center"><span>이메일</span></th>
													<th>조회 / 수정 / 삭제</th>
												</tr>
											</thead>
											<!-- start of for-Each -->
												<c:forEach var="userList" items= "${userList}" varStatus="status">
												<tr> 
												<td style="float:right;left-margin:0px" >
												${userList.userId}
												<img style="left-margin:0px"
														src="/profile/basic_profile.jpg" width="120px"></td>
													<td align="center">${userList.userName}</td>
													<td class="text-center"><span
														class="label label-default">
														<c:if test="${userList.status eq '0'}" >재직</c:if>
														<c:if test="${userList.status eq '1'} ">휴직</c:if>
														<c:if test="${userList.status eq '2'} ">퇴사</c:if> 
														</span></td>
													<td align="center"><a href="#">${userList.email}</a>
													</td>
													<td align="left">
													&nbsp&nbsp
							   <a style="width:25px" class="btn btn-success btn-xs glyphicon glyphicon-ok" 
												        href="getUser.do?userId=${userList.userId}" "title="View"></a>
         					   <a style="width:25px" class="btn btn-info  btn-xs glyphicon glyphicon glyphicon-comment" 
         					   href="updateUserView.do?userId=${userList.userId}" title="Send message"></a>
         					   <a id="${userList.userId}" style="width:25px" 
         					   		class="btn btn-danger  btn-xs glyphicon glyphicon-trash" title="Delete"></a>
												</td>
													
													<!--  
													 <label class="pull-right">
 										          
        										</label>-->
												</tr>
												
												</c:forEach>
									<!-- End of for-Each -->
											</tbody>
											
										</table>
										<div >&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
										&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
										&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
										&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
										&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
										&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<jsp:include page="/common/pageNavigator.jsp"></jsp:include></div>
									</div>
									
								</div>
								
							</div>
							
						</div>
						
					</div>
					
				</div>
				<form action="/getUserList.do" method="get" id="testForm" name="testForm">
					<input type="hidden" value="2" id="currentPage" name="currentPage"> 
				</form>
				<a href="/getUserList.do?currentPage=1">123</a>
			</div>
		</div>
	</div>
</body>
</html>
	









