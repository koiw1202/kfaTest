<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ������</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="/assets/js/jquery.js"></script>
<script>
	checkKor = /[��-��|��-��|��-��]/;
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
							alert("�ѱ۷δ� ID�� ������ �� �����ϴ�.");
							$('#userId').val("");
						} else if ($('#userId').val().length < 5
								&& $('#userId').val().length != 0) {
							alert("5���� �̻����� ������ּ���");
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
												alert("��� ������ ���̵� �Դϴ�.");
											} else if (data == 200) {
												alert("��� �Ұ��� ���̵� �Դϴ�.");
											} else {
												alert("��� ������ ���̵� �Դϴ�.");
											}
										},
										error : function(data) {

										}
									}); //End of aJax
						} //End of else if 
					});

	// ȸ������ �� ���
	$(document).on('click', '#enroll', function() {

		var userId = document.userForm.userId.value;
		var password = document.userForm.password.value;
		var password2 = document.userForm.password2.value;
		var email = document.userForm.email.value;
		var addr = document.userForm.addr.value;
		var name = document.userForm.userName.value;

		if (userId == "" || password == "" || password2 == "" || name == "") {
			alert("���̵�, ��й�ȣ, �̸��� Ȯ�����ּ���");

			return;

		} else if (password != password2) {
			alert("��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
			return;
		} else {
			document.userForm.action = "/addUser.do";
			document.userForm.method = "POST";
			document.userForm.submit();
		}
	}); //End of ȸ������

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
					<h2>ȸ�����</h2>
					<form action="#" method="post" name="userForm">
						<table class="table table-boardered">
							<tr>
								<th>���̵�</th>
								<td><input type="text" class="form-control" id="userId"
									name="userId" placeholder="id�� ��������"></td>
							</tr>
							<tr>
								<th>�н�����</th>
								<td><input type="password" class="form-control"
									name="password" placeholder="��й�ȣ�� ������ �־��ּ���"></td>
							</tr>

							<tr>
								<th>�н�����Ȯ��</th>
								<td><input type="password" class="form-control"
									name="password2"></td>
							</tr>

							<tr>
								<th>�̸�</th>
								<td><input type="name" class="form-control" name="userName"></td>
							</tr>

							<tr>
								<th>�̸���</th>
								<td><input type="email" class="form-control" name="email"
									id="email"></td>
							</tr>

							<tr>
								<th>��ȭ��ȣ</th>
								<td><input type="tel" class="form-control" name="phone"></td>
							</tr>
							<tr>
								<th>��� ����</th>
								<td><select name="addr" id="addr" class="form-control">
										<option value="������">������</option>
										<option value="��⵵">��⵵</option>
										<option value="����">����</option>
										<option value="�뱸">�뱸</option>
										<option value="����">����</option>
										<option value="�λ�">�λ�</option>
										<option value="����">����</option>
										<option value="���">���</option>
										<option value="��õ">��õ</option>
								</select></td>
							</tr>
							<tr>
								<th>��Ÿ ����</th>
								<td><textarea rows="5" cols="40" name="info"
										class="form-control"></textarea></td>
							</tr>
							<tr>
								<td colspan="2"><input size="5pt" class="btn btn-primary"
									id="enroll" name="enroll" value="���"> <input size="7pt"
									class="btn btn-danger" id="cancel" name="cancel" value="���"></td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>








</body>
</html>