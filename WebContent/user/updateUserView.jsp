<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원가입</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="/assets/js/jquery.js"></script>
<script>
	$(document).on('click', '#updateUser', function() {
		
		var password = $("#password").val() ;
		var password2 = $("#password2").val() ;
	
		if( password == "" || password2 == "" ||
				password == null || password2 == null ) {
			alert( "비밀번호를 확인해주세요." ) ;
			return ;
		} else if( password != password2 ) {
			alert("비밀번호가 서로 다릅니다.") ;
			return ;
		} else if( password.length < 4 ) {
			alert("비밀번호는 4자리 이상 만들어주세요.")
			return ;
		}
		
    	document.userForm.action = "/updateUser.do" ;
    	document.userForm.method = "POST" ;
    	document.userForm.submit() ;
    	
	});

	$(document).on('click', '#history_back', function() {
		window.history.back();
	});
</script>
</head>
<body>
	<div class="container">
		<div class="wrapper">
			<div class="box">
				<div class="row row-offcanvas row-offcanvas-left">
					<jsp:include page="/layout/left.jsp" />
				</div>
			</div>
			<div class="column col-sm-12 col-xs-11" id="main">
				<jsp:include page="/layout/top.jsp" />
			</div>
		</div>
		<div class="row" >
			<div class="col-sm-12 text-center">
				<div class="col-sm-3"></div>
				<div class="col-sm-6">
				<br><br>
					<h2>회원정보 조회</h2>		
					<form action="#" method="post" name="userForm" id="userForm">
						<table class="table table-boardered">
							<tr><th>프로필 사진</th>
								<td>
								<img src="https://item.kakaocdn.net/do/d84248170c2c52303db27306a00fb861f604e7b0e6900f9ac53a43965300eb9a"
			     				 align="left"></img>
			     			<br><br><br>
			     			<input size="5pt" class="btn btn-primary"
								align="left" id="updateProfile" name="updateProfile" value="수정하기" >
							<br><br>
							<input size="5pt" class="btn btn-primary"
								align="left" id="deleteProfile" name="deleteProfile" value="삭제" >
			     			</td></tr>
							<tr>
							<th>아이디</th>
							<td><input type="text" disabled="disabled" class="form-control" value="${user.userId}">
								<input type="hidden"  class="form-control" id="userId"
								 name="userId" value="${user.userId}" > 
								 </td>
							</tr>
							<tr><th>패스워드</th>
								<td><input type="password" class="form-control" id="password"
									name="password" value="${user.password}"></td>
							</tr>
							<tr>
								<th>패스워드확인</th>
								<td><input type="password" class="form-control" id="password2"
									name="password2" value="${user.password}"></td>
							</tr>
							<tr>
								<th>이름</th>
								<td><input type="name" class="form-control" value="${user.userName}" name="userName" ></td>
							</tr>
							<tr>
								<th>이메일</th>
								<td><input type="email" class="form-control" name="email"
									id="email"  value="${user.email}" ></td>
							</tr>
							<tr>
								<th>전화번호</th>
								<td><input type="tel" class="form-control" name="phone"  value="${user.phone}" ></td>
							</tr>
							<tr>
								<th>사는 지역</th>
								<td><select name="addr" id="addr" class="form-control">
										<option value="강원도">강원도</option>
										<option value="경기도">경기도</option>
										<option value="광주">광주</option>
										<option value="대구">대구</option>
										<option value="대전">대전</option>
										<option value="부산">부산</option>
										<option value="세종">세종</option>
										<option value="울산">울산</option>
										<option value="인천">인천</option>
								</select></td>
							</tr>
							<tr>
								<th>권한 부여</th>
								<td><select name="role" id="role" class="form-control">
										<option value="0">운영자</option>
										<option value="1">관리자</option>
										<option value="2">일반 사용자</option>
									</select>
								</td>
							</tr>
							<tr>
								<th>기타 사항</th>
								<td><select name="status" id="status" class="form-control">
										<option value="0">재직</option>
										<option value="1">휴직</option>
										<option value="2">퇴사</option>
									</select>
								</td>
							</tr>
							<tr>
							&nbsp&nbsp&nbsp
								<td colspan="2" align="center"><input size="5pt" class="btn btn-primary"
								id="updateUser" name="updateUser" value="수정하기">
								<input size="5pt" class="btn btn-primary"
								id="history_back" name="history_back" value="취소하기" ></td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>