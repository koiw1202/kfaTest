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
	checkKor = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힝]/;
	checkEng = /[a-z] [A-Z]/;

	var userId = "";

	if (checkKor.test($('#userId').val())) {
		$('#userId').val("");
	};

	$(document)
			.on(
					'blur',
					'#userId',
					function() {
						if (checkKor.test($('#userId').val())) {
							alert("한글로는 ID를 생성할 수 없습니다.");
							$('#userId').val("");
						} else if ($('#userId').val().length < 5
								&& $('#userId').val().length != 0) {
							alert("5글자 이상으로 만들어주세요");
						} else if ($('#userId').val() != userId
								&& $('#userId').val().length >= 5) {
							$
									.ajax({
										type : "GET",
										url : "/checkDuplicate.do?userId="
												+ $("#userId").val(),
										contentType : 'application/x-www-form-urlencoded; charset=utf-8',
										async : false,
										success : function(data) {
											if (data == 100) {
												alert("사용 가능한 아이디 입니다.");
											} else if (data == 200) {
												alert("사용 불가한 아이디 입니다.");
											} else {
												alert("사용 가능한 아이디 입니다.");
											}
										},
										error : function(data) {

										}
									}); //End of aJax
						} //End of else if 
					});

	// 회원가입 할 경우
	$(document).on('click', '#enroll', function() {

		var userId = document.userForm.userId.value;
		var password = document.userForm.password.value;
		var password2 = document.userForm.password2.value;
		var email = document.userForm.email.value;
		var addr = document.userForm.addr.value;
		var name = document.userForm.userName.value;

		if (userId == "" || password == "" || password2 == "" || name == "") {
			alert("아이디, 비밀번호, 이름을 확인해주세요");

			return;

		} else if (password != password2) {
			alert("비밀번호가 일치하지 않습니다.");
			return;
		} else {
			document.userForm.action = "/addUser.do";
			document.userForm.method = "POST";
			document.userForm.submit();
		}
	}); //End of 회원가입

	$(document).on('click', '#cancel', function() {
		window.location.href = '/main/main.jsp';
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
		<div class="row" style="margin-left:30px">
			<div class="col-sm-12 text-center">
				<div class="col-sm-3"></div>
				<div class="col-sm-6">
				<br><br>
					<h2>회원등록</h2>
					<form action="#" method="post" name="userForm">
						<table class="table table-boardered">
							<tr>
								<th>아이디</th>
								<td><input type="text" class="form-control" id="userId"
									name="userId" placeholder="id를 넣으세요"></td>
							</tr>
							<tr>
								<th>패스워드</th>
								<td><input type="password" class="form-control"
									name="password" placeholder="비밀번호는 영문만 넣어주세요"></td>
							</tr>

							<tr>
								<th>패스워드확인</th>
								<td><input type="password" class="form-control"
									name="password2"></td>
							</tr>

							<tr>
								<th>이름</th>
								<td><input type="name" class="form-control" name="userName"></td>
							</tr>

							<tr>
								<th>이메일</th>
								<td><input type="email" class="form-control" name="email"
									id="email"></td>
							</tr>

							<tr>
								<th>전화번호</th>
								<td><input type="tel" class="form-control" name="phone"></td>
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
								<th>기타 사항</th>
								<td><textarea rows="5" cols="40" name="info"
										class="form-control"></textarea></td>
							</tr>
							<tr>
								<td colspan="2"><input size="5pt" class="btn btn-primary"
									id="enroll" name="enroll" value="등록"> <input size="7pt"
									class="btn btn-danger" id="cancel" name="cancel" value="취소"></td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>








</body>
</html>